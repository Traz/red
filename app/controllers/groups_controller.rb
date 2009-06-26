class GroupsController < ApplicationController
  before_filter :require_user
  in_place_edit_for :group, :name

  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.paginate :page => (params[:page]||1), :order => 'name ASC', :per_page => 10
      
    @self_member_groups = Group.find(User.find(current_user).group_members.map(&:group_id)) 
    @self_created_groups = User.find(current_user).groups
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    @list_group_subgroups = @group.group_subgroups.paginate :page => params[:subgroups_page], :per_page => 10
    @list_group_members = @group.group_members.paginate :page => params[:members_page], :per_page => 10
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end
  
  def list
    @query = params[:group_query]
    @groups = Group.find :all, :conditions => ['name LIKE ?', "%#{@query}%"]
    respond_to do |format|
      format.html
      format.js { render :partial => 'list', :layout => false }
    end
  end

  
  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])
    @group.user = current_user
    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to(@group) }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
  

end
