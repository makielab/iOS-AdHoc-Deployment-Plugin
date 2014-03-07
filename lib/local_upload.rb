require 'fileutils'

module LocalHost
  def self.upload(upload_path, project, files)
    full_path = File.join upload_path, project[:name], project[:build_number]
    FileUtils.mkdir_p full_path

    files.each do |file|
      FileUtils.cp file, File.join(full_path File.basename(file)) unless file.nil?
    end
  end
end
