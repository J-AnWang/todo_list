module TasksHelper
    # todo_check_button用來辨識status的helper，使用在index.html.erb
    # button_checked, button_unchecked是來裝html字串的變數
    def todo_check_button(t)
        if t.status == false
            link_to check_task_path(t), method: :post do
                button_unchecked = '<i class="fa fa-square-o" aria-hidden="true"></i>'
                button_unchecked.html_safe
            end
        else
            link_to check_task_path(t.id), method: :post do
                button_checked = '<i class="fa fa-check-square" aria-hidden="true"></i>'
                button_checked.html_safe
            end
        end
    end
    # todo_edit_button是edit的helper，使用在index.html.erb
    def todo_edit_button(t)
        link_to edit_task_path(t) do
            edit_button = '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>'
            edit_button.html_safe
        end
    end
    # todo_delete_button是delete的helper，使用在index.html.erb
    def overdue?(t)
      if t.date < Date.today
          edit_button = '<i class="fa fa-times" id="overdue" aria-hidden="true" style="color: grey"></i>'
          edit_button.html_safe
      else
          link_to task_path(t), method: :delete, data: { confirm: 'Are you sure?' } do
              edit_button = '<i class="fa fa-times" aria-hidden="true" style="color: red"></i>'
              edit_button.html_safe
          end
      end
    end

end
