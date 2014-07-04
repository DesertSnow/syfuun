class Todo < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true, allow_blank: false

  scope :unfinished, -> {where(finished: false)}

  def finish!
    update_attribute(:finished, true)
  end
end
