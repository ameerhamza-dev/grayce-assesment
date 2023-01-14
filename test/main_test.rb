require 'minitest/autorun'
require_relative '../lib/matcher'
require_relative '../lib/json_loader'
require_relative '../lib/file_writer'

class MainScriptTest < Minitest::Test
  def setup
    @members_data = [
      {
        'id' => 1,
        'use_case' => 'elderly',
        'caregiver_location' => {
          'timezone' => 'America/New_York'
        }
      },
      {
        'id' => 2,
        'use_case' => 'infant',
        'caregiver_location' => {
          'timezone' => 'America/Chicago'
        }
      }
    ]

    @care_partners_data = [
      {
        'id' => 1,
        'specialties' => %w[elderly youth],
        'timezone' => 'America/New_York',
        'current_active_cases' => 3
      },
      {
        'id' => 2,
        'specialties' => %w[infant teen],
        'timezone' => 'America/Chicago',
        'current_active_cases' => 2
      }
    ]
  end

  def test_integration
    JsonLoader.define_singleton_method(:load_json_file) do |file_name|
      file_name.include?('members') ? @members_data : @care_partners_data
    end

    matches = Matcher.new(@members_data, @care_partners_data).find_best_matches

    assert_equal 2, matches.size
    matches.each do |match|
      assert match.key?('member_id')
      assert match.key?('care_partner_id')
    end
  ensure
    JsonLoader.singleton_class.undef_method(:load_json_file)
    load 'lib/json_loader.rb'
  end
end
