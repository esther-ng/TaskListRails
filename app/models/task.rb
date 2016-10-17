class Task < ActiveRecord::Base
  # def complete_toggle(id)
  #   task = Task.find(id)
  #   if task.completed
  #     task.completed = false
  #     task.completed_at = nil
  #   else
  #     task.completed = true
  #     task.completed_at = DateTime.now
  #   end
  #
  #   task.save
  # end
end
