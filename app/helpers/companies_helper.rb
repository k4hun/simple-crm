module CompaniesHelper
	def company_owner
		Client.find(params[:client_id]).name	
	end
end
