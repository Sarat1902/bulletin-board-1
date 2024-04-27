# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  def active_posts
    board_id = self.id
    #matching_posts = Post.where({:board_id => "#{board_id}" AND :expires_on > "#{Data.today}"})
    matching_posts = Post.where("board_id = ? AND DATE(expires_on) > ?", board_id, Date.today)
    return matching_posts
  end

  def expired_posts
    board_id = self.id
    #matching_posts = Post.where({:board_id => "#{board_id}" AND :expires_on > "#{Data.today}"})
    matching_posts = Post.where("board_id = ? AND DATE(expires_on) < ?", board_id, Date.today)
    return matching_posts
  end
end
