class Todo < ActiveRecord::Base
  attr_accessible :title

  validates :title, presence: true, allow_blank: false

  scope :unfinished, -> {where(finished: false)}
  scope :ordered_by_title, order(:title)

  def finish!
    update_attribute(:finished, true)
  end

  def prioritise!
    update_attribute(:prior, true)
  end
end
