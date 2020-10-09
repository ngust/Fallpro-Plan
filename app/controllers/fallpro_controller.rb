class FallproController < ApplicationController
  def index
  	@fallpros = Fallpro.all.order(:created_at).reverse_order
  end

  def new
  	@fallpro = Fallpro.new
  end

  def emails
    @fallpro = Fallpro.find(params[:fallpro_id])
    2.times {@fallpro.fallpro_emails.build}
  end

  def edit
  	@fallpro = Fallpro.find(params[:id])
  end

  def edit_systems
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def edit_gear
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def edit_setup
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def edit_inspection
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def edit_rescue
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def edit_contact
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def systems
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def items
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def pre_use
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def rescue
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def contact
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def signature
    @fallpro = Fallpro.find(params[:fallpro_id])
  end

  def setup
    @fallpro = Fallpro.find(params[:fallpro_id])
    @count = 1
    3.times do
      # FallproStep.(fallpro_id: @fallpro.id, order: @count)
      @fallpro.fallpro_steps.build(order: @count)
      @count += 1
    end
    3.times do
      @fallpro.fallpro_reverse_steps.build(order: @count)
      @count += 1
    end
  end

  def started
    @fallpro = Fallpro.find(params[:fallpro_id])
    @site = FallproSite.find_by(fallpro: params[:fallpro_id])
  end

  def show
  	@fallpro = Fallpro.find(params[:id])
    @site = FallproSite.where(fallpro: @fallpro.id).last
    @hazard = FallproHazard.where(fallpro: @fallpro.id).last
  end

   def create
    @fallpro = Fallpro.new(fallpro_params)
    if @fallpro.user
      @fallpro.supervisor = @fallpro.supervisor.length > 1 ? @fallpro.supervisor : @fallpro.user.fallpro_user.full_name
    end
    
     if @fallpro.save
        redirect_to new_fallpro_site_path(fallpro: @fallpro.id), notice: "Fallpro plan created successfully!"
      else
        logger.info @fallpro.errors.full_messages.to_sentence
        render :new, notice: "Fallpro plan could not be created!"
      end
  end

   def update
    @fallpro = Fallpro.find(params[:id])

      if params[:systems] && @fallpro.update_attributes(fallpro_params)
        logger.info "systems triggered ...."
        redirect_to fallpro_items_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:items] && @fallpro.update_attributes(fallpro_params)
        logger.info "items triggered ...."
        redirect_to fallpro_setup_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:setup] && @fallpro.update_attributes(fallpro_params)
        logger.info "setup triggered ...."
        redirect_to fallpro_pre_use_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:pre_use] && @fallpro.update_attributes(fallpro_params)
        logger.info "setup triggered ...."
        redirect_to fallpro_rescue_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:rescue] && @fallpro.update_attributes(fallpro_params)
        logger.info "rescue triggered ...."
        redirect_to fallpro_contact_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:contact] && @fallpro.update_attributes(fallpro_params)
        logger.info "contact triggered ...."
        redirect_to fallpro_signature_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:signature] && @fallpro.update_attributes(fallpro_params)
        logger.info "signature triggered ...."
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      ## edits
      elsif params[:systemsedit]  && @fallpro.update_attributes(fallpro_params)
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:itemsedit]  && @fallpro.update_attributes(fallpro_params)
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:setupedit]  && @fallpro.update_attributes(fallpro_params)
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:inspectionedit]  && @fallpro.update_attributes(fallpro_params)
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:rescueedit]  && @fallpro.update_attributes(fallpro_params)
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:contactedit]  && @fallpro.update_attributes(fallpro_params)
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Updated successfully!"
      elsif params[:emails]  && @fallpro.update_attributes(fallpro_params)
        emails = @fallpro.fallpro_emails
        emails.each do |email|
          logger.info "sending fallpro email ...."
          MainMailer.fallpro_report(@fallpro.id, email).deliver
        end
        redirect_to fallpro_path(fallpro_id: @fallpro.id), notice: "Emails sent!"



      elsif @fallpro.update_attributes(fallpro_params)
        redirect_to fallpro_index_path, notice: "Updated successfully!"

      else
        logger.info @fallpro.errors.full_messages.to_sentence
        render :edit, notice: "Fallpro plan could not be updated!"
      end
  end

  # def pdf_template
  #   @fallpro = Fallpro.find(params[:id])
  #   @site = FallproSite.where(fallpro: @fallpro.id).last
  #   @hazard = FallproHazard.where(fallpro: @fallpro.id).last
  # end

  def print_report
    @fallpro = Fallpro.find(params[:fallpro_id])
    @site = FallproSite.where(fallpro: @fallpro.id).last
    @hazard = FallproHazard.where(fallpro: @fallpro.id).last
    html = render_to_string(:action => "show", :layout => 'layouts/pdf', :locals => {:@fallpro => @fallpro, :@site => @site, :@hazard => @hazard })
    css =  "#{Rails.public_path}/pdf-data.css"
    pdf = PDFKit.new(html, :page_size => 'Letter')
    pdf.stylesheets << css
    send_data pdf.to_pdf, filename: "#{@fallpro.created_at}-FallProPlan.pdf"
  end

   private


  def fallpro_params
       params.require(:fallpro).permit(
        :user_id, 
        :supervisor, 
        :company, 
        :add_procedures, 
        :picture, 
        :sketch,
        :gaurdrails,
        :fall_restraint,
        :fall_arrest,
        :control_zone,
        :control_drop_zone,
        :systems,
        :anchor_structure, :anchor_connection, :full_body_harness, :connect_anchor, :lifeline, :rope_grab, :lanyard, :lanyard_type, :tool_lanyard, :matarial_tie, :control_zone_item,
        :all_read, :safe_area, :parts_compatible, :steps_reverse,
        :strong_enough, :equipment_inspected, :after_breaks,
        :signature,
        :rescue,
        :contact_name, :contact_number, :contact_position, :airhorn_location, :radio_location,
        :sketch, :sketch_upload,
        how_rescue: [],

         fallpro_steps_attributes: [:id, :body, :order, :_destroy],
         fallpro_reverse_steps_attributes: [:id, :body, :order, :_destroy],
         fallpro_emails_attributes: [:id, :email, :_destroy]
        )
    end   

end
