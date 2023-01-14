require 'json'

module JsonLoader
  def self.load_json_file(file_path)
    begin
      JSON.parse(File.read(file_path))
    rescue Errno::ENOENT, JSON::ParserError => e
      puts "Error reading or parsing #{file_path}: #{e.message}"
      exit
    end
  end
end
