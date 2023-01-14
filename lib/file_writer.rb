require 'json'

module FileWriter
  def self.write_json_file(file_path, data)
    begin
      File.write(file_path, JSON.pretty_generate(data))
      puts "Matching complete. Results saved to #{file_path}."
    rescue IOError => e
      puts "Error writing to #{file_path}: #{e.message}"
    end
  end
end
