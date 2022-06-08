class PagesController < ApplicationController
    def home 
        render html: '<h1> Hello world </h1>'
    end 
    def post 
        render html: "this is post"
    end
    def about 
        render html: "this is about"
    end
    skip_before_action :verify_authenticity_token
    def contact 
        render text: "this is contact page"
    end

end
