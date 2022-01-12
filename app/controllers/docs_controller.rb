class DocsController < ApplicationController
    #Create the action for Docs controller
    #Add a before action
    before_action :find_doc, only: [:show, :edit, :update, :destroy]

    def index
        @docs = Doc.all.order("created_at DESC")
    end

    def show
        
    end

    def new
        #call the instance of the doc
        @doc = Doc.new
    end

    def create
        @doc = Doc.new(doc_params)

        if @doc.save
            redirect_to @doc
        else
            render 'new'
        end
    end
#edit is just responsible for the view file (edit.html.haml)
    def edit
    end

    def update
        #if the document is updated, them save it and redirected us to the doc page
        #else render the edit page
        if @doc.update(doc_params)
            redirect_to @doc
        else
            render 'edit'
        end
    end

    def destroy
        @doc.destroy
        redirect_to docs_path
    end

    private
    def find_doc
        @doc= Doc.find(params[:id])
    end

    def doc_params
        params.require(:doc).permit(:title, :content)
    end
    
    
end
