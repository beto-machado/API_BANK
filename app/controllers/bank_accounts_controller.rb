class BankAccountsController < ApplicationController

  def create
    person_params = person_params(params)

    person = Person.create_with(person_params).find_or_create_by(rg: person_params[:rg])

    bank_account = BankAccount.initialize_account()
    bank_account.person = person
    bank_account.save!

    render json: {account_number: bank_account.account_number, password: BankAccount::TEMP_PASSWORD}, status: :ok
  end

  private

  def person_params(params)
    params.require(:person).permit(:name, :birthdate, :rg, :cpf_photo)
  end

end
