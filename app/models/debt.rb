class Debt < ApplicationRecord

  enum status: [:active, :filled, :overdue, :closed]

  belongs_to :borrower_request
  has_many :debts_status_histories
  has_and_belongs_to_many :investor_requests
  has_and_belongs_to_many :ardis_transactions

  after_save :update_status
  after_save :set_history

  def stats
    {
        money_borrowed: money_borrowed,
        money_to_refund: money_to_refund,
        money_refunded: money_refunded,
        status: status.to_s
    }
  end

  private

  def map_money
    lambda { |t| t.amount.dollars }
  end

  def money_borrowed
    ardis_transactions.where(kind: :loan).map(&map_money)
  end

  def money_to_refund
    money_borrowed * (1 + borrower_request.credit_percentage)
  end

  def money_refunded
    ardis_transactions.where(kind: :refund).map(&map_money)
  end

  def try_update_status
    ## TODO: check for fill and set appropriate status
  end

  def set_history
    unless debts_status_histories.last.status == status
      dsh = DebtsStatusHistory.create(status: status)
      self.debts_status_histories << dsh
    end
  end

end
