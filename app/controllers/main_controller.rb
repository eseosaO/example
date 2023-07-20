class MainController < ApplicationController
  #Controller actions:
  def index
    render('index')
  end

  def about
    @created_by = "Eseosa Oshodin "
    @id = params['id']
    @page = params[:page]
    render('about')
  end

  def apps
    redirect_to(action: 'index') #Since it has no view template we redirect the apps request to index page
  end
end
