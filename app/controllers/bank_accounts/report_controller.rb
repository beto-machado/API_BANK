class BankAccounts::ReportController < ApplicationController

  def index
    bank_account = BankAccount.find_by(account_number: params.require(:account_number))

    render json: {
      acocunt_number: bank_account.account_number,
      balance: bank_account.calculate_balance,
      total_transactions: bank_account.transactions.count,
      transactions: bank_account.transactions.order(:transaction_hour).map do |transaction|
        {transaction_hour: transaction.transaction_hour, amount: transaction.formatted_amount}
      end
    }
  end

  private

  def transaction_params(params)
    params.require(:transaction).permit(:kind, :amount_in_cents, :transaction_hour)
  end
end
