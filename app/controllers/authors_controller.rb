class AuthorsController < ApplicationController

def new
  @author = Author.new
end

def create
  @author = Author.create(params.require(:author).permit(:email, :password))
  if @author.save
    session[:author_id] = @author.id
    redirect_to root_path, notice: "Thank you for signing up!"
  else
    render "new"
  end
end

end