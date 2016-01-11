#encoding: utf-8
class NamespacesController < ApplicationController
  before_action :set_namespace, only: [:show, :edit, :update, :destroy]

  # GET /namespaces
  # GET /namespaces.json
  def index
    @namespaces = Namespace.all
  end

  # GET /namespaces/1
  # GET /namespaces/1.json
  def show
  end

  # GET /namespaces/new
  def new
    @namespace = Namespace.new
  end

  # GET /namespaces/1/edit
  def edit
  end

  # POST /namespaces
  # POST /namespaces.json
  def create
    @namespace = Namespace.new(namespace_params)

    respond_to do |format|
      if @namespace.save
        format.html { redirect_to namespaces_url, notice: '命名空间创建成功' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /namespaces/1
  # PATCH/PUT /namespaces/1.json
  def update
    respond_to do |format|
      if @namespace.update(namespace_params)
        format.html { redirect_to namespaces_url, notice: '命名空间更新成功' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /namespaces/1
  # DELETE /namespaces/1.json
  def destroy
    @namespace.destroy
    respond_to do |format|
      format.html { redirect_to namespaces_url, notice: '命名空间删除成功' }
      format.json { head :no_content }
    end
  end

  def add_state_codes
    @namespace = Namespace.find(params[:id])
    @state_code = @namespace.state_codes.new
  end

  def create_state_codes
    namespace = Namespace.find(params[:id])
    state_code = StateCode.new(state_code_params)
    state_code.namespace = namespace
    if state_code.save
      redirect_to namespaces_url, notice: '状态码创建成功'
    else
      puts "---------------#{state_code.errors.messages.values.join(',')}"
      @namespace = Namespace.find(params[:id])
      @state_code = @namespace.state_codes.new
      @errors = state_code.errors.messages.values.join(',')
      render :add_state_codes, errors: @errors
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_namespace
      @namespace = Namespace.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def namespace_params
      params.require(:namespace).permit(:ns, :url_key, :url_address, :status, :res)
    end

    def state_code_params
      params.require(:state_code).permit(:code_num, :code_des)
    end
end

