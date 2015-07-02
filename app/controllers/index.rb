get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
	@error = session[:errors]

  if logged_in?
	  @user = current_user
  	erb :show_user
  else
  	erb :index
  end

  # if session[:email]
  # 	session.clear
  # end

  # erb :index
end
