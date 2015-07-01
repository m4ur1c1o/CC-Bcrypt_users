get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  if session[:email]
  	session.clear
  end

  erb :index
end
