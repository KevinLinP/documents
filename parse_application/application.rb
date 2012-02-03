module ParseApplication
	require 'json'
	require 'rest_client'

	def self.application
		hash = {
			'name' => 'Kevin Lin',
			'email' => 'kevin.lin.p@gmail.com',
			'about' => about_message,
			'urls' => urls
		}
	end

	# String describing why you think Parse is a great fit for you
	def self.about_message
		"Hello Parse! I think Parse would be a great fit for me because: I love exploring technologies/methods, in addition to my technology side I have a business side (I can talk endlessly in both realms), I specialize in web applications (having worked on an ASP.NET MVC app for Rackspace), and Ruby happens to be my favorite language (has been for two years)." 
	end

	# Array of strings with links to your resume, site, or code sample
	def self.urls
		[
			'https://docs.google.com/open?id=0B2hNEgRC1y7POGE4OTg1YTgtNzM1ZS00MGE2LTlhNDYtNDEwNmI1OTNjNWUy',
			'http://api-wiki.apps.rackspace.com/api-wiki/index.php/Main_Page#Operations',
			'https://github.com/wiLD0kl'
		]
	end

end

application_json = ParseApplication.application.to_json
puts application_json

if ARGV[0]
	response = RestClient.post 'https://www.parse.com/jobs/apply', application_json, :content_type => :json
	if response.code.eql? 200
		puts 'Application successfully submitted'
	else
		puts 'Application POST failed, please try again'
	end
end
