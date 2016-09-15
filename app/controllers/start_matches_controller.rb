class StartMatchesController < ApplicationController

@@potential_matches = []
@@next_match

before_action :find_user, only: [:video, :answers, :playlist, :profile]

  def matches
    # get an array of compatible matches
    @user = current_user
    seeking = current_user.seeking
    matches = @@potential_matches
    if seeking == 'f4m'
      matches = User.id.where(seeking: 'm4f')
    elsif seeking == 'm4f'
      matches = User.where(seeking: 'f4m')
    elsif seeking == 'm4m'
      matches = User.where(seeking: 'm4m')
    else
      matches = User.where(seeking: 'f4f')
    end
    p "MATCHES"
    p @@potential_matches


    # make this array an array of corresponding user ids
    matches.each do |match|
      p "MATCHING #{match.id} with #{current_user.id}"
      if match.id != current_user.id
        @@potential_matches.push(match.id)
      end
    end

    # send the first matched user
    next_id = @@potential_matches.shift
    @next_match = User.find(next_id)
    redirect_to next_match_path
  end

  def next_match
    # the next match for the current_user to look at
    next_id = @@potential_matches.shift
    # this will be the user
    @@next_match = User.find(next_id)
    if @@potential_matches.length == 0
      flash[:notice] = "You have ran out of matches. Try again later or lower your standards."
    end
    redirect_to user_video_path and return
  end

  def video
    p "MATCH"
    p @@next_match
  end

  def answers
  end

  def playlist
  end

  def profile
  end

private

  def find_user
    @user = @@next_match
  end

end
