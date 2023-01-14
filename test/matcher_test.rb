require 'minitest/autorun'
require_relative '../lib/matcher'

class MatcherTest < Minitest::Test
  def setup
    @members_data = [
      {
        'id' => '1',
        'use_case' => 'infant',
        'caregiver_location' => { 'timezone' => 'America/New_York' }
      },
      {
        'id' => '2',
        'use_case' => 'elderly care',
        'caregiver_location' => { 'timezone' => 'America/Chicago' }
      }
    ]

    @care_partners_data = [
      {
        'id' => '1',
        'specialties' => ['infant'],
        'timezone' => 'America/New_York',
        'current_active_cases' => 2
      },
      {
        'id' => '2',
        'specialties' => ['elderly care'],
        'timezone' => 'America/Chicago',
        'current_active_cases' => 3
      }
    ]

    @matcher = Matcher.new(@members_data, @care_partners_data)
  end

  def test_find_best_matches
    matches = @matcher.find_best_matches

    assert_equal '1', matches[0]['member_id']
    assert_equal '1', matches[0]['care_partner_id']

    assert_equal '2', matches[1]['member_id']
    assert_equal '2', matches[1]['care_partner_id']
  end
end
