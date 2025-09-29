class Groupext2ControllerController < ApplicationController

  def add_assignee
    if not User.current.admin?
      raise InsufficientPermissions, "not allowed to add group mappings"
    end
    group = Groups.where(name: parames[:group_name])
    user = user.where(login: params[:user_login])
    groupAssignee = GroupsAssigned.new
    groupAssignee.group_id = group.id
    groupAssignee.user_id = user.id
    groupAssignee.save!
    redirect_to "assigned_groups"
  end

  def del_assignee
    group = Groups.where(name: parames[:group_name])
    user = user.where(login: params[:user_login])
    if not User.current.admin? and not user.login == User.current.login
      raise InsufficientPermissions, "not allowed to delete group mapping"
    end
    
    # actually find and delete it?
    
  end

  def show_assignees
    @assignees = GroupsAssigned.all
  end

  def assignee_add_user_group
    group = Groups.where(name: parames[:group_name])
    user = user.where(login: params[:user_login])
    au = GroupsAssigned.where(group_id: group.id , user_id: user.id)
    if not au
      raise InsufficientPermissions, "not allowed to modify group"
    end

    # actually add user into group
  end

  def assignee_del_user_group
    group = Groups.where(name: parames[:group_name])
    user = user.where(login: params[:user_login])
    au = GroupsAssigned.where(group_id: group.id , user_id: user.id)
    if not au
      raise InsufficientPermissions, "not allowed to modify group"
    end
    # actually remove user from group
  end

  def assignee_show_group
  end
end
