class HomeController < ApplicationController
  
  def group_delete
    completed_tasks = List.where(completed: true)

    if completed_tasks.empty?
      flash[:notice] = "No tasks are finished."
    else
      completed_tasks.destroy_all
      flash[:notice] = "Marked tasks removed."
    end

    redirect_to lists_url
  end
end
