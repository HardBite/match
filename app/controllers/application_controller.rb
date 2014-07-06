class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :voted

    def voted
      if user_signed_in?
        user_id = current_user.id
      end

      if params[:id]      
        match_id = params[:id]
      end
      
      @voted = UserVote.where(user_id: user_id, match_id: match_id).take

      if @voted 
        @voted.vote
      else
        nil
      end
   end
end

