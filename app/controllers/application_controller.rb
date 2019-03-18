class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
  end

  get '/recipes/new' do #loads new form
  erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
     redirect to "/recipes/#{@recipe.id}"
  end

  get '/articles/:id/edit' do  #load edit form
    @article = Article.find_by_id(params[:id])
    erb :edit
  end


end
