class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: ["PENDING", "APPROVED", "DENIED"], message: "%{value} is not a valid input"}
  validate :overlapping_approved_requests

  belongs_to :cat,
  :dependent => :destroy

  def overlapping_requests
    current_start = self.start_date
    current_end = self.end_date
    current_cat_id = self.cat_id
    CatRentalRequest.where("cat_id = ? AND (? - end_date) * (start_date - ?) >= 0", current_cat_id, current_start, current_end)
  end

  def overlapping_approved_requests
    unless overlapping_requests.where("status = 'APPROVED' AND id != ?", self.id).empty?
      errors[:date] << "overlaps with pre-approved request"
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end

  def cat_name
    self.cat.name
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = 'APPROVED'
      self.save
      overlapping_pending_requests.update_all(status: "DENIED")
    end
  end

  def deny!
    self.status = 'DENIED'
    self.save!
  end

end
