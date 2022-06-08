class MovieController < ApplicationController
    def index
        if (params[:id])
            allMovie = Movie.find(params[:id])
        else
            allMovie = Movie.all
        end
        render json: allMovie, status: :ok
    end
    skip_before_action :verify_authenticity_token
    def postMovie()
        data = Movie.new(params.permit(:Title, :Year, :Rated, :imdbID, :Title, :Year, :Rated, :Released, :Runtime, :Genre, :Plot, :Poster, :imdbRating, :Response))
        data.save()
        render json: data, status: :created
    end
    def updateMovie()
        Movie.find(params[:id]).update(params.permit(:Title, :Year, :Rated, :imdbID, :Title, :Year, :Rated, :Released, :Runtime, :Genre, :Plot, :Poster, :imdbRating, :Response))
        puts("Params=============", params)
        render html: "Updated", status: :ok
    end
    def deleteMovie
        Movie.find(params[:id]).destroy!
        render html: "Deleted", status: :no_content
    end
    def getMovieImdb
        if (params[:imdbID])
        movie = Movie.find_by(imdbID: params[:imdbID])
        else 
            movie = Movie.all
        end
        render json: movie, status: :ok
    end
    def getMovieSearch
        # movie = Movie.where("Title like ?", "%#{params[:search]}%")
        # puts(movie)
        if (params[:page])
            pageNum = params[:page]
        else 
            pageNum = 1
        end
        if (params[:limit])
            limit = params[:limit]
        else 
            limit = 10
        end
        pageNum = pageNum.to_i
        limit = limit.to_i
        pageNum -= 1
        pageNum *= limit
        movie = Movie.where("Title like ?", "%#{params[:search]}%").offset(pageNum).limit(limit)
        render json: movie, status: :ok
    end
    def getSetLikeUnlike
        movie = Movie.find_by(imdbID: params[:imdbID]).update(params.permit(:isliked))
        render json: Movie.find_by(imdbID: params[:imdbID]), status: :ok
    end
    def getLikedMovie
        movie = Movie.where(isliked: true)
        render json: movie, status: :ok
    end
end
