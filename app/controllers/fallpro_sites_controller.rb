class FallproSitesController < ApplicationController
	def new
		@site = FallproSite.new
		@fallpro = params[:fallpro]
	end

	def roof
		@site = FallproSite.find(params[:fallpro_site_id])
    @fallpro = @site.fallpro
	end

  def edit_roof
    # @site = FallproSite.find(params[:fallpro_site_id])
    # @fallpro = @site.fallpro
    @fallpro = Fallpro.find(params[:fallpro_id]) 
    @site = FallproSite.find(params[:fallpro_site_id])
  end

  def edit
    # @site = FallproSite.find(params[:fallpro_site_id])
    # @fallpro = @site.fallpro
    @fallpro = Fallpro.find(params[:fallpro_id]) 
  end

  	def create
	  @site = FallproSite.new(fallpro_site_params)


	 if @site.save
	    redirect_to fallpro_fallpro_started_path(@site.fallpro), notice: "User Created successfully!"
	  else
	  logger.info "XXXXXX #{@site.errors.full_messages.to_sentence}"
    render :new, notice: "Fallpro plan could not be created!"
	  end
	end


   def update
   		@site = FallproSite.find(params[:id])
      if @site.update_attributes(fallpro_site_params)
        if params[:roofedit]
          redirect_to fallpro_fallpro_path(@site.fallpro, fallpro_id: @site.fallpro), notice: "Updated successfully!"
      	elsif params[:fallpro_site][:roof]
      		redirect_to new_fallpro_fallpro_hazard_path(fallpro: @site.fallpro), notice: "Updated successfully!"
      	else
        	redirect_to fallpro_fallpro_index_path, notice: "Updated successfully!"
        end

      else
        logger.info @site.errors.full_messages.to_sentence
        render :edit, notice: "Fallpro plan could not be updated!"
      end
  end


    protected

  def fallpro_site_params
    params.require(:fallpro_site).permit(:address, :fallpro, :prime, :cso_name, :cso_phone, :construction_site, :desc, :height, :units, :roof, :slope, :worktype, :created_by, :project, :work_desc)
  end
end