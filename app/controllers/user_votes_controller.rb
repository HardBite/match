class UserVotesController < ApplicationController

  def create
    @user_vote = UserVote.new(user_vote_params)
    @user_vote.match_id = params[:match_id]
    @user_vote.user_id = current_user.id
     respond_to do |format|
      if @user_vote.save
        match_votes = UserVote.all
        sum = 0
        count = 0
        match_votes.each do |v|
          if v.match_id == params[:match_id].to_i
            sum = sum + v.vote.to_f
            count = count +1
          end
        end
        binding.pry
        average_rating = sum/count
        match = Match.find_by_id(params[:match_id])
        match.rating = average_rating
        match.save
        
        format.html { redirect_to "/matches/#{params[:match_id]}", notice: 'Your opinion is very important for us' }
       else
        format.html { redirect_to :root }
      end
    end
  end

 
  private
     # Never trust parameters from the scary internet, only allow the white list through.
    def user_vote_params
      params.require(:user_vote).permit(:user_id, :match_id, :vote)
    end


end
