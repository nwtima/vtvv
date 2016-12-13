class CreateDebtsArdisTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :debts_ardis_transactions do |t|
      t.references :debt, foreign_key: true
      t.references :ardis_transaction, foreign_key: true

      t.timestamps
    end
  end
end
