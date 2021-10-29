class BankAccounts::TransactionsController < ApplicationController

  def create
    bank_account = BankAccount.find_by(account_number: params.require(:account_number))
    previous_balance = bank_account.calculate_balance

    transaction = Transaction.new(transaction_params(params))
    transaction.bank_account = bank_account

    if transaction.save
      render json: {
        account_number: bank_account.account_number,
        previous_balance: previous_balance,
        new_balance: bank_account.reload.calculate_balance
      }
    else
      render json: {transaction: transaction.errors.full.message}, status: 500
    end
  end

  private

  def transaction_params(params)
    params.require(:transaction).permit(:kind, :amount_in_cents, :transaction_hour)
  end

end
