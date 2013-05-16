class RolesAndPermissionsController < ApplicationController
  # GET /roles_and_permissions
  # GET /roles_and_permissions.json
before_filter :cargar_role

  def index
    @roles_and_permission = @roles.roles_and_permission.find(params[:role_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles_and_permission }
    end
  end

  # GET /roles_and_permissions/1
  # GET /roles_and_permissions/1.json
  def show
    @roles_and_permission = @roles.roles_and_permission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @roles_and_permission }
    end
  end

  # GET /roles_and_permissions/new
  # GET /roles_and_permissions/new.json
  def new
    
    @roles_and_permission = @roles.roles_and_permission.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @roles_and_permission }
    end
  end

  # GET /roles_and_permissions/1/edit
  def edit
    @roles_and_permission = @roles.roles_and_permission.new
  end

  # POST /roles_and_permissions
  # POST /roles_and_permissions.json
  def create

    @roles_and_permission = @roles.roles_and_permission.new(params[:roles_and_permission])
    
    respond_to do |format|
      if @roles_and_permission.save
        format.html { redirect_to [@roles, @roles_and_permission ], notice: 'Roles and permission was successfully created.' }
        format.json { render json: @roles_and_permission, status: :created, location: @roles_and_permission }
      else
        format.html { render action: "new" }
        format.json { render json: @roles_and_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /roles_and_permissions/1
  # PUT /roles_and_permissions/1.json
  def update
    @roles_and_permission = @roles.roles_and_permission.find(params[:id])

    respond_to do |format|
      if @roles_and_permission.update_attributes(params[:roles_and_permission])
        format.html { redirect_to [@roles,@roles_and_permission], notice: 'Roles and permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @roles_and_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles_and_permissions/1
  # DELETE /roles_and_permissions/1.json
  def destroy
    @roles_and_permission = @roles.roles_and_permission.find(params[:id])
    @roles_and_permission.destroy

    respond_to do |format|
      format.html { redirect_to roles_and_permissions_url }
      format.json { head :no_content }
    end
  end

private

def cargar_role
  
    @roles = Role.find(params[:role_id])
end


end
