
require 'sinatra/base'

class MailerApp < Sinatra::Application


configure do
  # setting one option
  set :root , File.dirname( __FILE__)

end


  get '/' do
  
  erb :styleguide_layout

  end


end
