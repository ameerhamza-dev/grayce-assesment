require_relative 'lib/matcher'
require_relative 'lib/json_loader'
require_relative 'lib/file_writer'

members_data = JsonLoader.load_json_file('members.json')
care_partners_data = JsonLoader.load_json_file('care_partners.json')

matches = Matcher.new(members_data, care_partners_data).find_best_matches

FileWriter.write_json_file('matches_output.json', matches)
