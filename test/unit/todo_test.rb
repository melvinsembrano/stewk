require 'test_helper'

class TodoTest < ActiveSupport::TestCase

  test "should properly parse date and time properly" do
    todo = todos(:one)
    assert_equal todo.due_on, todo.parsed_due_on
    assert_equal todo.due_time_on, todo.due_on.strftime("%T")
    assert_equal todo.due_date_on, todo.due_on.to_date.to_s
  end

  test "should properly set due_on value" do
    test_date = "2013-10-12"
    test_time = "9:30:45"
    todo = Todo.new(
      :title => "",
      :description => "",
      :account_id => 1,
      :due_time_on => test_time,
      :due_date_on => test_date
    )

    assert todo.save

    assert_equal DateTime.parse("#{ test_date } #{ test_time }"), todo.due_on

  end

end
