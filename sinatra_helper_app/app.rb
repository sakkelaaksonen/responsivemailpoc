
require 'sinatra/base'
require 'premailer'

class MailerApp < Sinatra::Application


  configure do
    # setting one option
    set :root , File.dirname( __FILE__)

  end


  helpers do
    #Pun intended

    def set_view_params
      @large_view = 640
      @edge = (params[:e].nil?)
      @use_device_width = (params[:dw].nil?)
      @media_queries = (params[:mq].nil?)
      @svg = (params[:svg].nil?)
    end

    def premaul(html)
      Premailer.new(
        html, {with_html_string: true}
      ).to_inline_css
    end

  end

  before '/' do
    set_view_params
   end

  get '/' do

    inlined_html = premaul(erb( :premailer_payload))
    
    
    erb(inlined_html,{
      layout: :styleguide_layout
      })    
  end

  # after '/' do
  #   premailer = Premailer.new(response.body,with_html_string: true)
  #   response.body = premailer.to_inline_css
  # end

end
