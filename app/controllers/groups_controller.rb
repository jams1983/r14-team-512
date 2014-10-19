class GroupsController < ApplicationController
  before_action :set_users, only: [:create, :update]
  before_action :set_group, except: [:index, :new, :create, :new_party]

  def index
    @owned_groups = Group.where(owner_id: current_user.id)
    @groups = current_user.groups
  end

  def new
    @enabled_users = User.where('id != ?', current_user.id)
    @group = current_user.groups.build
  end

  def create
    @group = Group.new(group_params.merge(:owner_id => current_user.id))
    @group.users = @users

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      @enabled_users = User.where('id != ?', current_user.id)
      binding.pry
      render :new, alert: 'Errors'
    end
  end

  def show
  end

  def edit
    @enabled_users = User.where('id != ?', current_user.id)
  end

  def update
    @group.assign_attributes(group_params)
    @group.users = @users
    if @group.save
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      @enabled_users = User.where('id != ?', current_user.id)
      render :edit, alert: 'Errors'
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path , notice: 'Group was successfully removed.'
  end

  def new_party
    @enabled_users = User.where('id != ?', current_user.id)
    movies = params[:group][:movies].split(",").map(&:to_i)
    @group = current_user.groups.build
    movies.each {|id| @group.movies.build(movie_id: id) }
    render :new
  end

  protected
    def group_params
      params.require(:group).permit(:name, :description, :couch_date, movies_attributes: [:id, :movie_id])
    end

    def set_users
      user_ids = params[:group][:user_ids]
      params[:group].delete :user_ids
      @users = User.find user_ids.reject! { |c| c.empty? }
    end

    def set_group
      @group = Group.find(params[:id])
    end
end
