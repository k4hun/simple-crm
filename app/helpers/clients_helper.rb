module ClientsHelper
	def fullname
		return "#{@client.firstname} #{@client.lastname}"
	end
end
