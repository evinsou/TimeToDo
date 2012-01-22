Feature: Manage tasks

So I add and change own tasks
As an user
I want to create and manages tasks

Background:
  Given logged in user

@checked
Scenario: Create a task
  Given no tasks and add task link on main page and new task form 
  When  I write new task with valid fields and selects
  Then I should be on the tasks list page and see new record

@checked
Scenario: Edit task attributes
  Given existing task for edit
  When I choose task to update and changes fields with new values and click update
  Then I see page with updated task values

@checked
Scenario: Delete task
  Given existing task for delete
  When goes on task page and click delete 
  Then shows main page without task have been deleted 

