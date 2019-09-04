module ApplicationHelper
	def locale
		I18n.locale == :en ? "Inglês" : "Português do Brasil"
		
	end

	
	def nome_aplicacao
		"CRYPTO WALLET APP"
	end
end
