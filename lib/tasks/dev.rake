namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Executando drop")do#do-end pode ser substituido por {}
     %x(rails db:drop:_unsafe)
    end
   show_spinner("criando db")do 
   %x(rails db:create) 
    end
 show_spinner("migrando")do 
   %x(rails db:migrate) 
    end
     %x(rails dev:add_mining_types)
     %x(rails dev:add_coins)
    
    else
     puts "Você não está em ambiente de desenvolvimento!"
  end
end
  
  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas...") do
         coins = [
        {description: "Bitcoin",
            aconym: "BTC",
            url_image: "http://www.pngall.com/wp-content/uploads/1/Bitcoin-PNG-Pic.png",
            mining_type: MiningType.all.first #pode ser tbm .where(aconym 'PoW')
          },

            {description: "João",
            aconym: "Juburro",
            url_image: "https://discordemoji.com/assets/emoji/6216_kappapride.png",
            mining_type: MiningType.all.sample
        }

 ]
  
  coins.each do |coin|
  Coin.find_or_create_by!(coin)

    end
  end
end






desc "Cadastra dos tipos de mineração"
task add_mining_types: :environment do 
  show_spinner("Cadastrando tipos de mineração...")do
  mining_types =  [
      {description: "Proor of Work", aconym: "PoW"},
      {description: "Proor of Stake", aconym: "PoS"},
      {description: "Proor of Capacity", aconym: "PoC"}
  ]
    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
    end
  end
  private #só pra nao ser utilizado em outros lugares...
  
  def show_spinner(msg_start,msg_end = "Concluido!!!")
   spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
   spinner.auto_spin
  yield
  spinner.success("(#{msg_end})")
  end
end	
