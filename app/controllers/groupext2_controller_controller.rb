
class Groupext2ControllerController < ApplicationController

  class InsufficientPermissions < StandardError; end

  def show_assignees
    if User.current.admin?
      @assignees = GroupsAssigned.all
    else
      @assignees = GroupsAssigned.where(user_id: User.current.id)
    end
  end

  def add_assignee
    if not User.current.admin?
      raise InsufficientPermissions, "not allowed to add group mappings"
    end
    group = Group.find_by(lastname: params[:group_name])
    user = User.find_by(login: params[:user_login])
    groupAssignee = GroupsAssigned.new
    groupAssignee.group_id = group.id
    groupAssignee.user_id = user.id
    groupAssignee.save!
    redirect_to action: "show_assignees"
  end

  def del_assignee
    group = Group.find_by(lastname: params[:group_name])
    user = User.find_by(login: params[:user_login])
    if not User.current.admin? and user.login != User.current.login
      raise InsufficientPermissions, "not allowed to delete group mapping"
    end
    
    GroupsAssigned.destroy_by(group_id: group.id, user_id: user.id )

    redirect_to action: "show_assignees"
    
  end

  def assignee_show_group
    @group = Group.find_by(lastname: params[:group_name])
    @users = @group.users
  end

  def assignee_add_user_group
    group = Group.find_by(lastname: params[:group_name])
    user = User.find_by(login: params[:user_login])
    au = GroupsAssigned.find_by(group_id: group.id , user_id: User.current.id)
    if au == nil
      raise InsufficientPermissions, "not allowed to modify group"
    end
    group.users << user

    redirect_to action: "assignee_show_group", group_name: group.lastname
  end

  def assignee_del_user_group
    group = Group.find_by(lastname: params[:group_name])
    user = User.find_by(login: params[:user_login])
    au = GroupsAssigned.find_by(group_id: group.id , user_id: User.current.id)
    if au == nil
      raise InsufficientPermissions, "not allowed to modify group"
    end
    # actually remove user from group
    group.users.delete(user)

    redirect_to action: "assignee_show_group", group_name: group.lastname
  end

end
