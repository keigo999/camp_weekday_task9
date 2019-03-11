module TasksHelper

  def status_confirmation(task)
    @status =   case task.status
                when "0"
                  "draft"
                when "1"
                  "published"
                when "2"
                  "archieved"
                end
  end
end
