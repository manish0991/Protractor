class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end


  def index
    @articles = Article.all
    
    @show_destroy = false
    @show_edit = false

    @client = LaunchDarkly::LDClient.new("sdk-ea7b9eab-1458-4000-8e99-3cb622456d21")

    @user = {
      key: "marco@venzee.com",
      firstName: "Marco",
      lastName: "Sly",
      custom: {
        groups: "beta_testers"
      }
    }
  
    @show_destroy = true if @client.toggle?("incredible-feature", @user, false)
    @show_update = true if @client.toggle?("update-feature", @user, false)
    
  end


  def show
    @article = Article.find(params[:id])
  end


  def create
    #render plain: params[:article].inspect

    @article = Article.new(article_params)
   

      if @article.save
        redirect_to @article
      else
        render 'new'
      end
   
   end

  
  def edit
    @article = Article.find(params[:id])
  end


  def update

    if @show_update
      @article = Article.find(params[:id])
     
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

  end


def destroy
  
  if @show_destroy

    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path

  end

end


  # ---------------------------------------------------------
  private
    
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
