#require "prawn"
class ArticlesController < ApplicationController
    
   before_action :show, only: [:download_pdf]

    def index
        
            @articles = Article.search(params[:search])

            @ar = Article.all
    
    end

    def show
        if params[:id]
            @article = Article.find(params[:id])
        else
            @article = Article.find(params[:format])
        end
    end
    def new
        @article = Article.new
        #render file: "embedded_document/app/views/users/index"
    end

    def edit
       @article = Article.find(params[:id])
    end
    def search
    end

    def create
       # render plain: params[:article].inspect
        @article = Article.new(article_params)

        
       if @article.save
         redirect_to @article
       else
        render 'new'
       end
    end
    
    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])

         @article.destroy
            redirect_to @article

    end

    def download_pdf
        #byebug
        article = Article.find(params[:format])
        send_data generate_pdf(article),
                filename: "#{article.title}.pdf",
                type: "application/type"
    end

    private
      def article_params
        params.require(:article).permit(:title, :text, :search)
      end

      def generate_pdf(article)
        Prawn::Document.new do
            text article.title, align: :center, :font_size => 50
            text "text :  #{article.text}"
        end.render
      end

      

end
