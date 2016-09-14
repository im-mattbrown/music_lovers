class StartMatchesController < ApplicationController

  def match_criteria
    @user = current_user
    if current_user.seeking = 'f4m'
      @potential_matches = User.where(seeking: 'm4f')
    elsif @user.seeking = 'm4f'
      @potential_matches = User.where(seeking: 'f4m')
    elsif @user.seeking = 'm4m'
      @potential_matches = User.where(seeking: 'm4m')
    else @user.seeking = 'f4f'
      @potential_matches = User.where(seeking: 'f4f')
    end
    @potential_matches.each do |match|
      @user.suitors.push(match.id)
    end
    p @user.suitors
    p @user.seeking
    p current_user.seeking
    p @user.id
  end

end
