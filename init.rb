Redmine::Plugin.register :redmine_group_assignee_v2 do
  name 'Redmine Group Assignee V2 plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  menu :account_menu, :managed_groups, {controller: 'groupext2_controller' , action: 'show_assignees'}, caption: 'My Groups'
end
