
require 'sinatra/base'
require 'premailer'

class MailerApp < Sinatra::Application


  configure do
    # setting one option
    set :root , File.dirname( __FILE__)

  end


  helpers do
    #Pun intended
    def premaul(filename)
    Premailer.new(
      File.open(filename),
      # erb( :styleguide_layout),
      {with_html_string: true}
      ).to_inline_css
    end

  end
  before '/' do
    #Set template instance vars.
    #True by default. Add ! to revert
    @edge = (params[:edge].nil?)
    @use_device_width = (params[:use_device_width].nil?)
    @media_queries = (params[:media_queries].nil?)
    @svg = (params[:svg].nil?)

  end

  get '/' do
    erb( 
      premaul("#{settings.views}/styleguide_layout.erb")
      )
  end

  # after '/' do
  #   premailer = Premailer.new(response.body,with_html_string: true)
  #   response.body = premailer.to_inline_css
  # end

end
