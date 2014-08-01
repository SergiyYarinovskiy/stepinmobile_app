class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
  end

  def create_object
    errors = []
    @object = case params[:object]
                when 'Car' then Car.new
                when 'Ship' then Ship.new
                when 'Aircraft' then Aircraft.new
                else nil
              end
    if @object.nil?
      errors << 'Wrong object type'
    else
      @object.name = params[:name]
      @object.color = params[:color]
      @object.valid?
      unless @object.errors.messages[:color].nil?
        @object.errors.messages[:color].each { |color_error| errors << 'Color '.concat(color_error)}
      end
      unless @object.errors.messages[:name].nil?
        @object.errors.messages[:name].each { |color_error| errors << 'Name '.concat(color_error)}
      end
    end

    if errors.empty?
      @object.save
      render json: @object.id
    else
      render json: errors
    end
  end

end
