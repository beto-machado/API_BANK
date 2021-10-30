# API BANK

## Requisitos Necessários:

* Ruby 2.7.4
* PostgreSQL
* Rails 6

## Funcionalidades

- Cadastro de conta corrente aonde a pessoa deve informar, nome, data de nascimento e foto do CPF ou RG. O retorno deve ser uma conta e uma senha.

![ScreenShot](https://github.com/beto-machado/API_BANK/blob/master/app/img/create_person.png)

- Débito/Crédito: Permitir debitar um valor ou creditar em uma determinada conta, retornando a conta, saldo anterior e o novo saldo.


![ScreenShot](https://github.com/beto-machado/API_BANK/blob/master/app/img/transaction.png)

- Extrato: Permitir ao informar uma conta retornar o extrato da conta com saldo anterior, movimentações de débito e crédito e ao final o saldo atualizado.


![ScreenShot](https://github.com/beto-machado/API_BANK/blob/master/app/img/report.png)


## Para executar o projeto:

### Clone em sua máquina

```shell
git clone https://github.com/beto-machado/API_BANK.git
```

### Instale as dependências
```shell
bundle install
```

### Crie o Banco de Dados
```shell
rails db:create
rails db:migrate
```

### Execute a aplicação
```shell
rails s
