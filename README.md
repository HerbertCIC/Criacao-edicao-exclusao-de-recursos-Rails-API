# PASSOS

#Criando o projeto
{
    rails new notebook-api --api
    cd notebook-api/
}

#Gerando Scaffold para Contact
{
    rails g scaffold Contact name:string email:string birthdate:date
    rails db:migrate
}

#Adicionando a gem "faker" para gerar BD falso em modo de desenvolvimento
{
    gem 'faker'
    bundle
}

#Criando uma task para gerar BD
{
    rails g task dev setup
    --implementado em lib/tasks
    rails dev:setup
}

#Adicionar uma nova migração
{
    rails g migration add_kind_to_contact kind:references
}

#Gerar um novo scaffold 
{
    rails g scaffold Kind description:string
    rails db:migrate
}

#Alterarndo task dev setup para add Tipos de contato
{
    --implementação para add tipos em lib/tasks
    --add ao cadastro de contatos ->  kind: Kind.all.sample
}

#Adicionando relacionamento belongs_to e has_many nos models Contact e Kind respectivamente

#Adicionando validações nos models Contact e Kind
