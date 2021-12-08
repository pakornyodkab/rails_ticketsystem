class Chair < ApplicationRecord
  belongs_to :theater
  has_many :tickets

  def to_label
    "#{row}#{seat} Theater:#{Theater.find(theater_id).name}"
  end

end
