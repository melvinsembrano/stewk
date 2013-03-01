class Todo < ActiveRecord::Base
  attr_accessor :due_date_on, :due_time_on
  attr_accessible :account_id, :description, :due_on, :title, :type_id
  belongs_to :account

  before_save :set_due_on

  def due_date_on
    due_on.to_date if due_on
  end

  def due_time_on
    due_on.to_time if due_on
  end

  private

  def set_due_on

  end

end
