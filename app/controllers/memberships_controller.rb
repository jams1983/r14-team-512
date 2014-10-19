class MembershipsController < ApplicationController
  def destroy
    member = Membership.find(params[:id])
    member.destroy
    if member.user == current_user
      redirect_to groups_path
    else
      redirect_to group_path(member.group)
    end
  end
end