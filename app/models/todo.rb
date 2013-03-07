class Todo < ActiveRecord::Base
  attr_accessor :due_date_on, :due_time_on
  attr_accessible :account_id, :description, :due_on, :title, :type_id, :due_date_on, :due_time_on
  belongs_to :account

  before_save :set_due_on

  def due_date_on
    if @due_date_on.nil? && due_on
      @due_date_on = due_on.to_date.to_s
    end
    @due_date_on
  end

  def due_time_on
    if @due_time_on.nil? && due_on
      @due_time_on = due_on.to_time.strftime("%r")
    end
    @due_time_on
  end

  def parsed_due_on
    DateTime.parse("#{ due_date_on } #{ due_time_on }")
  end

  private

  def set_due_on
    self.due_on = self.parsed_due_on
  end

end
