require 'sinatra/base'
require 'premailer'

class MailerApp < Sinatra::Application

  configure do
    set :root , File.dirname( __FILE__)
  end

  helpers do

    def set_view_params
      @edge = (params[:e].nil?)
      @use_device_width = (params[:dw].nil?)
      @media_queries = (params[:mq].nil?)
      @svg = (params[:svg].nil?)
    end

    def premaul(html)
      #Pun intended
      Premailer.new(
        html, {with_html_string: true}
      ).to_inline_css
    end

  end

#
#FILTERS
#
  before '/' do
    # read query params
    # for using enhanhed styles
    set_view_params
  end

#
# ROUTES
#

  get '/' do
    erb(premaul(erb( :premailer_payload)),{
        layout: :styleguide_layout
    })
  end

end #of Class MailerApp 
