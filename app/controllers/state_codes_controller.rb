#encoding: utf-8
class StateCodesController < ApplicationController

  def update_code_res_json
  	begin
	  	StateCode.transaction do 
		  	state_code = StateCode.find(params[:id])
		  	params[:state_code][:actived] = true
		  	if state_code.update_attributes(state_code_params) && StateCode.where("id != ?", params[:id].to_i).update_all(:actived => false)
		  		render json: {success: true}
		  	else
		  		render json: {success: false}
		  	end
		  end
		rescue => ex
			puts ex.inspect
			render json: {success: false}
		end
  end

  def destroy
  	state_code = StateCode.find(params[:id])
  	if state_code.destroy
  		render json: {success: true}
  	else
  		render json: {success: false}
  	end
  end

  private

  def state_code_params
    params.require(:state_code).permit(:code_res_json, :actived)
  end

end
