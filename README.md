
Redmine Group Assignee Plugin v2

This is a small, simple plugin that lets you delegate management of particular groups
to particular users in Redmine (https://redmine.org) 

The original Redmine Group Assignee plugin:
https://github.com/lamps/redmine_group_assignee

worked by monkeypatching Redmine methods, and broke with every major version upgrade.

This is a very lean (less than 180 lines of code), simple plugin that gives the same
ability for delegated users to manage particular groups, and uses the same data table
as the original, but is much easier to maintain.  It does not currently have the
fancy Redmine user selection mechanism that the main Admin pages have. 
