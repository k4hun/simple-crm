module CompaniesHelper
	def company_owner
		@client = Client.find(params[:client_id])		
	end
end
