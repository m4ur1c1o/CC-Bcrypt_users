get '/users' do
	@users = User.all
	erb :user
end

get '/users/new' do
	erb :new_user
end

post '/users' do
	email = params[:email]
	password = params[:password]
	@user = User.create(email: email, password: password)
	redirect to("/users/#{@user.id}")
end

get '/users/:id' do
	id = params[:id]
	@user = User.find("#{id}")
	erb :show_user
end

get '/users/:id/edit' do
	id = params[:id]
	@user = User.find("#{id}")
	erb :edit_user
end

post '/users/:id' do
	email = params[:email]
	password = params[:password]
	id = params[:id]
	user = User.find(id)
	if password == ""
		user.update(email: email)
	else
		user.update(email: email, password: password)	
	end
	redirect to("/users/#{id}")
end

post '/users/:id/delete' do
	id = params[:id]
	user = User.destroy(id)
	redirect to ('/users')
end

post '/login' do
	email = params[:email]
	password = params[:password]
	user = User.authenticate(email, password)
	if user
		id = user.id
		puts "pasamos"
		session[:email] = params[:email]
		session[:id] = id
		redirect to("/users/#{id}")		
	else
		session[:errors] = "Datos incorrectos"
		# @errors = "Datos incorrectos"
		erb :index
	end


end












