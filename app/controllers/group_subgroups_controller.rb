class GroupSubgroupsController < ApplicationController
  before_filter :require_user
  before_filter :get_group

  # GET /group_subgroups
  # GET /group_subgroups.xml
  def index
    @group_subgroups = GroupSubgroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @group_subgroups }
    end
  end

  # GET /group_subgroups/1
  # GET /group_subgroups/1.xml
  def show
    @group_subgroup = GroupSubgroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group_subgroup }
    end
  end

  # GET /group_subgroups/new
  # GET /group_subgroups/new.xml
  def new
    @group_subgroup = GroupSubgroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_subgroup }
    end
  end

  # GET /group_subgroups/1/edit
  def edit
    @group_subgroup = GroupSubgroup.find(params[:id])
  end

  # POST /group_subgroups
  # POST /group_subgroups.xml
  def create
    @group_subgroup = GroupSubgroup.new(params[:group_subgroup])

    respond_to do |format|
      if @group_subgroup.save!
        format.js {render :update do |page|
            page.insert_html :bottom, 'wp_sub_list', :partial => 'group_subgroup', :object => @group_subgroup
            page.visual_effect :highlight, "gp_sub_id_#{@group_subgroup.id}", :duration => 5 
            page[:group_auto].value = ''
           end }
      else
        format.js { render :nothing => true }
      end
    end
  end

  # PUT /group_subgroups/1
  # PUT /group_subgroups/1.xml
  def update
    @group_subgroup = GroupSubgroup.find(params[:id])

    respond_to do |format|
      if @group_subgroup.update_attributes(params[:group_subgroup])
        flash[:notice] = 'GroupSubgroup was successfully updated.'
        format.html { redirect_to(@group_subgroup) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_subgroup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /group_subgroups/1
  # DELETE /group_subgroups/1.xml
  def destroy
    @group_subgroup = GroupSubgroup.find(params[:id])
    @group_subgroup.destroy

    respond_to do |format|
      format.js   { render :update do |page|
          page.visual_effect :drop_out, "gp_sub_id_#{params[:id]}"
        end
       }
    end
  end
  
  
  def get_group
    @group = Group.find params[:group_id]
  end
end
