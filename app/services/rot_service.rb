module RotService

  WEIGHT = {credit_history: 0.3, profile_info: 0.3, credit_activity: 0.4}

  def self.create_user_score(user)
    '''
      Calculating user credit score according to the past
    '''
    credit_history = CreditHistory.find_by number: user.profile.credit_number
    account = user.accounts.first
    unless credit_history.nil?
      account.credit_score = CreditScore.new score: credit_history.score, status: CreditScore.statuses[:approved]
    else
      account.credit_score = CreditScore.new score: 0, status: CreditScore.statuses[:approved]
    end
    account.credit_score.score *= weight[:credit_history]
    account.save
  end

  def self.update_user_score(user)
    '''
      Updating credit score of user. Use this only for users with created credit_score
    '''

    user_account = user.accounts.first

    score = CreditScore.find_by account_id: user_account.id

    # credit score consists of three parts: ROT = w1*credit_history + w2*profile + w3*credit_history_ardis
    # w1 = 0.3 w2 = 0.3 w3 = 0.4

    # credit history part
    credit_history = CreditHistory.find_by number: user.profile.credit_number
    credit_history_part = (credit_history.nil? ? 0 : credit_history.score)

    # profile part
    user_profile = user.profile
    profile_part = user_profile.attributes.each_pair.map{|arr| arr.try(:second).present? ? 1 : 0}.
      reduce(:+) / user_profile.attributes.count.to_f

    # ardis credit activity part
    activity_part = 0

    user_account.credit_score.update(score: WEIGHT[:credit_history] * credit_history_part + WEIGHT[:profile_info] *
      profile_part + WEIGHT[:credit_activity] * activity_part)
    puts user_account.credit_score.score
  end
end