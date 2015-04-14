module ApplicationHelper

	def avatar_url(usuario)
		default_url = "#{root_url}public/mcpato.png"
		gravatar_id = Digest::MD5.hexdigest(usuario.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
		binding.pry
	end
end
