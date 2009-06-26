class WikisController < ApplicationController
  before_filter :require_user

  CamelCase = Regexp.new( '\b((?:[A-Z]\w+){2,})' )

  uses_tiny_mce :only => [:new, :create, :edit, :update], :options => {
    :theme => 'advanced',
    :theme_advanced_resizing => true,
    :theme_advanced_resize_horizontal => false,
    :plugins => %w{table fullscreen contextmenu},
    :theme_advanced_toolbar_align => 'left',
    :theme_advanced_toolbar_location => 'top',
    :theme_advanced_buttons1 => 'undo,redo,cut,copy,paste,pastetext,|,bold,italic,strikethrough,blockquote,charmap,bullist,numlist,removeformat,|,link,unlink,image,|,cleanup,code',
    :theme_advanced_buttons2 => 'formatselect,fontselect,fontsizeselect,|,justifyleft,justifycenter,justifyright,indent,outdent,|,forecolor,backcolor,|,table,fullscreen',
    :theme_advanced_buttons3 => ''
     }
  # GET /wikis
  def index
    @wikis = Wiki.paginate :page => params[:page], :order => 'title ASC', :per_page => 3

  end

  # GET /wikis/1
  def show
    @wiki = Wiki.find(params[:id])
    if params[:version_id]
      @wiki.revert_to params[:version_id]
    end
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
    @wiki = Wiki.find(params[:id])
  end

  # POST /wikis
  def create
    @wiki = Wiki.new(params[:wiki])
    @wiki.owner = current_user
    @wiki.writer = current_user
    if @wiki.save
      flash[:notice] = 'Wiki was successfully created.'
      redirect_to @wiki
    else
      render :action => "new"
    end
  end

  # PUT /wikis/1
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.writer = current_user
    if @wiki.update_attributes(params[:wiki])
      flash[:notice] = 'Wiki was successfully updated.'
      redirect_to @wiki
    else
      render :action => "edit" 
    end
  end

  # DELETE /wikis/1
  def destroy
    @wiki = Wiki.find(params[:id])
    @wiki.destroy
    redirect_to wikis_url
  end

  def revert_to_version
    @wiki = Wiki.find(params[:id])
    @wiki.revert_to!(params[:version_id])
    redirect_to @wiki
  end

end