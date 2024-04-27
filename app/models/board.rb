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
  def posts
    board_id = self.id
    matching_posts = Post.where({:board_id => "#{board_id}"})
    return matching_posts
  end
end
