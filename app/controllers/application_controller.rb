class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
  end

  def create_object

    @object = case params[:object]
                when 'Car' then Car.new
                when 'Ship' then Ship.new
                when 'Aircraft' then Aircraft.new
                else nil
              end

    render text: @object.class
  end

end
