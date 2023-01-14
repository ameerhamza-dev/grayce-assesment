class Matcher
  def initialize(members, care_partners)
    @members = members
    @care_partners = care_partners
  end

  def find_best_matches
    @members.map do |member|
      best_match = @care_partners.min_by do |partner|
        match_criteria(member, partner)
      end

      result = { 'member_id' => member['id'].to_s, 'care_partner_id' => best_match ? best_match['id'].to_s : nil }
      result
    end
  end

  private

  def match_criteria(member, partner)
    [
      partner['specialties'].include?(member['use_case']) ? 0 : 1,
      partner['timezone'] == member['caregiver_location']['timezone'] ? 0 : 1,
      partner['current_active_cases']
    ]
  end
end
