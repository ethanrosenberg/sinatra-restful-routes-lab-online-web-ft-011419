class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes/new' do
  erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
  end



  post '/recipes' do
    @recipe = Recipe.create(params)
     redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
      @recipe.ingredients = params[:ingredients]
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    #@recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect '/recipes'
  end


end
