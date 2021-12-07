class SameTheaterValidator < ActiveModel::Validator
  def validate(record)
    if Chair.find(record.chair_id).theater_id != Timetable.find(record.timetable_id).theater_id
      record.errors.add :chair, "Can't create ! Different theater"
    end
  end
end




class Ticket < ApplicationRecord
  belongs_to :timetable
  belongs_to :chair
  has_one :product ,as: :productable
  validates_with SameTheaterValidator
end
