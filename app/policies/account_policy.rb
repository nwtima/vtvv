class AccountPolicy < ApplicationPolicy
  def create?
    user && user.accounts.count < 2
  end

  def show?
    is_borrower_or_investor?
  end

  def change?
    is_borrower_or_investor? && user.accounts.count == 2
  end

  def deposit?
    is_borrower_or_investor?
  end

  def withdraw?
    is_borrower_or_investor?
  end
end