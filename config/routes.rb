# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'show_assignees', to: 'groupext2_controller#show_assignees'
get 'add_assignee', to: 'groupext2_controller#add_assignee'
get 'del_assignee', to: 'groupext2_controller#del_assignee'
get 'assignee_add_user_group', to: 'groupext2_controller#assignee_add_user_group'
get 'assignee_del_user_group', to: 'groupext2_controller#assignee_del_user_group'
get 'assignee_show_group', to: 'groupext2_controller#assignee_show_group'
