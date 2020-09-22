class FallproHazardsController < ApplicationController
	def new
		@hazard = FallproHazard.new
		if params[:fallpro]
			@fallpro = params[:fallpro]
		elsif params[:fallpro_site_id]
			params[:fallpro_site_id]
		end
			
	end

	def edit
		@hazard = FallproHazard.find(params[:fallpro_hazard_id])
		@fallpro = @hazard.fallpro
	end

	def power_lines
		@hazard = FallproHazard.find(params[:fallpro_hazard_id])
		@fallpro = @hazard.fallpro
	end

  	def create
	  @hazard = FallproHazard.new(fallpro_hazard_params)


	 if @hazard.save
	    # redirect_to fallpro_index_path, notice: "Hazard Created successfully!"
	    redirect_to fallpro_hazard_power_lines_path(@hazard), notice: "Updated successfully!"
	  else
	  logger.info "XXXXXX #{@hazard.errors.full_messages.to_sentence}"
	  end
	end


   def update
   	@hazard = FallproHazard.find(params[:id])
   	  if params[:hazardedit] && @hazard.update_attributes(fallpro_hazard_params)
          redirect_to fallpro_path(@hazard.fallpro, fallpro_id: @hazard.fallpro), notice: "Updated successfully!"
      elsif @hazard.update_attributes(fallpro_hazard_params)
        redirect_to fallpro_systems_path(@hazard.fallpro), notice: "Updated successfully!"

      else
        logger.info @hazard.errors.full_messages.to_sentence
        render :edit, notice: "Fallpro plan could not be updated!"
      end
  end


    protected

  def fallpro_hazard_params
    params.require(:fallpro_hazard).permit(:fallpro_id, :height, :units, :surface, :can_drop, :drop_strike, :power_lines, :holes, :hole_control, :control_zone, :cz_measures, :signage, :sig_measures, :fall_protection, :training, :signup)
  end
end

         