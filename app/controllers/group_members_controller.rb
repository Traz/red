class GroupMembersController < ApplicationController
  before_filter :require_user
  before_filter :get_group
   
  # GET /group_members
  # GET /group_members.xml
  def index
    @group_members = GroupMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_members }
    end
  end

  # GET /group_members/1
  # GET /group_members/1.xml
  def show
    #@group_member = GroupMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_member }
    end
  end

  # GET /group_members/new
  # GET /group_members/new.xml
  def new
    @group_member = GroupMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_member }
    end
  end

  # GET /group_members/1/edit
  def edit
    @group_member = GroupMember.find(params[:id])
  end

  # POST /group_members
  # POST /group_members.xml
  def create
    @group_member = GroupMember.new(params[:group_member])
    
    respond_to do |format|
      if @group_member.save
        format.js {render :update do |page|
            page.insert_html :bottom, 'wp_user_list', :partial => 'group_member', :object => @group_member
            page.visual_effect :highlight, "gp_user_id_#{@group_member.id}", :duration => 5 
            page[:user_auto].value = ''
           end }
      else
        format.js { render :nothing => true }
      end
    end
  end

  # PUT /group_members/1
  # PUT /group_members/1.xml
  def update
    @group_member = GroupMember.find(params[:id])

    respond_to do |format|
      if @group_member.update_attributes(params[:group_member])
        flash[:notice] = 'GroupMember was successfully updated.'
        format.html { redirect_to(@group_member) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_members/1
  # DELETE /group_members/1.xml
  def destroy
    @group_member = GroupMember.find(params[:id])
    @group_member.destroy

    respond_to do |format|
      format.html { redirect_to(group_members_url) }
      format.xml  { head :ok }
      format.js   { render :update do |page|
          page.visual_effect :drop_out, "gp_user_id_#{params[:id]}"
        end
       }
    end
  end
  
  private
  def get_group
    @group = Group.find params[:group_id]
  end
end
