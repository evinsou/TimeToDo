require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "try create task" do
    task = Task.new
  
    task.user = users (:eugene) 
    task.body = "Test body"

    assert task.save
  end

  test "try to find a task" do
    task_id = tasks(:first_task).id
    assert_nothing_raised { Task.find(task_id) }
  end

  test "try update task" do
    task = tasks(:first_task)
    assert task.update_attributes(:body=>'New body')
  end

  test "try delete task" do
    task = tasks(:first_task)
    task.destroy
    assert_raise(ActiveRecord::RecordNotFound) { Task.find(task.id) }
  end

  test "should not create a task without body" do
    task = Task.new
    assert !task.valid?
    assert task.errors[:body].any?
    assert_equal ["can't be blank"], task.errors[:body]
    assert !task.save  
  end
end
