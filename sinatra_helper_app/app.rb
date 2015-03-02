require 'sinatra/base'
require 'premailer'

class MailerApp < Sinatra::Application

  WIDTHS = {
    narrow: 298,
    medium: 456,
    wide: 608
  }
  

  @small_view = WIDTHS[:narrow]
  @medium_view = 456
  @large_view = 608

  configure do
    set :root , File.dirname( __FILE__)
  end

  helpers do

    def render_block(block_name,local_views=@local_views)
      erb( :'/content/spaced_row', { locals: {block: "#{local_views}/#{block_name}"} } )
    end

    def get_width(keysym)
      keysym = keysym.to_sym unless keysym.is_a? Symbol  # just in case
      return WIDTHS[keysym]
    end

    def use_get_params
      @edge = (params[:e].nil?)
      #device width triggers zoom in outlook mobile view.
      @use_device_width = false

      # @use_device_width = (params[:dw].nil?)
      @media_queries = (params[:mq].nil?)
      @svg = (params[:svg].nil?)

    end

    def premaul(html)
      #Pun intended
      Premailer.new(
        html, {with_html_string: true}
      ).to_inline_css
    end

    def post_maul(main_template, view_path)
       erb(premaul(erb( main_template.to_sym,{views: view_path})))
    end

  end

#
#FILTERS
    before '/fixed/*' do
      @flex = false
      use_get_params
      @local_views = "fixed"
      # @local_views = "#{settings.views}/fixed"

    end

   before '/fluid/*' do
      @flex = true
      use_get_params
      @local_views = "fluid"
    end

  before '/fixed/narrow' do

  end

  before 'fluid/:width' do
    @bodywidth = get_width(params[:width])
  end

#
# ROUTES
#

  get '/' do
    erb :index
  end

  get '/fixed/narrow' do
    @edge = true
    @use_device_width = true
    @outerwidth = 306
    @innerwidth = 298 # outer - 8 for spacing
    @zoomlevel = '1.1'
    post_maul(:fixed_narrow_body,"#{settings.views}/fixed")

        # erb(premaul(erb( :fixed_narrow_body,{views: "#{settings.views}/fixed"})))

  end

  get '/fluid/:width' do
    erb(premaul(erb( :premailer_payload)),{
        layout: :styleguide_layout
    })
  end

end #of Class MailerApp 
