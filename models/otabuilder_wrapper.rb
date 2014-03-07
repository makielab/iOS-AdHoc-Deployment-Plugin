require 'rubygems'
require 'require_relative'
require 'net/http'
require 'open-uri'
require 'fileutils'

require_relative '../lib/plist_generator.rb'
require_relative '../lib/ipa_search.rb'
require_relative '../lib/mailer.rb'
require_relative '../lib/data_from_ipa.rb'

class OtabuilderWrapper<Jenkins::Tasks::Publisher

  include Jenkins::Model::DescribableNative

  display_name 'Upload Build and Generate OTA link'

  attr_accessor :ipa_path
  attr_accessor :bundle_identifier
  attr_accessor :bundle_version
  attr_accessor :title
  attr_accessor :local_ota_dir
  attr_accessor :http_root

  def initialize(attrs)
    @ipa_path = attrs['ipa_path']
    @local_ota_dir = attrs['local_ota_dir']
    @http_root = attrs['http_root']
  end

  def needsToRunAfterFinalized
    return true
  end

  def prebuild(build, listener)
  end


  def perform(build, launcher, listener)

      #project informations
      workspace_path = build.native.getProject.getWorkspace() #get the workspace path
      ipa_filepath = IPASearch::find_in "#{workspace_path}/#{@ipa_path}"
      ipa_filename = File.basename ipa_filepath

      #build informations
      project = build.native.getProject.displayName
      build_number = build.native.getNumber()
      build_number = build_number.to_s

      ipa_file_data_obj = IPAFileData.new
      info_plist_path = ipa_file_data_obj.binary_plist_path_of ipa_filepath
      info_plist_contents = ipa_file_data_obj.contents_of_infoplist info_plist_path, ipa_filepath
      ipa_info_obj = IPA.new info_plist_contents

      #manifest information
      @bundle_identifier = ipa_info_obj.bundleidentifier
      @bundle_version = ipa_info_obj.bundleversion
      @title = ipa_info_obj.displayname

      icon_filename = ipa_info_obj.icon

      ipa_url = "#{@http_root}#{project}/#{build_number}/#{ipa_filename}"
      icon_url =  "#{@http_root}#{project}/#{build_number}/#{icon_filename}"

      @icon_path = ipa_file_data_obj.path_to_icon_file_with_name icon_filename, ipa_filepath

      manifest_file = Manifest::create ipa_url,icon_url, @bundle_identifier, @bundle_version, @title, File.dirname(ipa_filepath)

      manifest_filename = File.basename manifest_file
      itms_link = "itms-services://?action=download-manifest&url=#{@http_root}#{project}/#{build_number}/#{manifest_filename}"
      itms_link = itms_link.gsub(/\s*/, '')

      listener.info itms_link

      output_path = File.join @local_ota_dir, project, build_number

      FileUtils.mkdir_p output_path

      [ipa_filepath, manifest_file, @icon_path].each do |file|
        FileUtils.cp file, File.join(output_path File.basename(file)) unless file.nil?
      end

      File.open(File.join(output_path, "index.html"), "w") { |file| file.write("
<html>
    <head>
        <title>#{@title} #{@bundle_version}</title>
    </head>
    <body>
        <a href=\"#{itms_link}\">
            Click here to install #{@title} #{@bundle_version}.
        </a>
    </body>
</html>
") }

  end

end
