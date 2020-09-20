class FallproUsersController < ApplicationController
	def new
		@user = FallproUser.new
	end

	def create
	  @user = FallproUser.new(fallpro_user_params)


	 if @user.save
	    redirect_to new_fallpro_fallpro_path, notice: "User Created successfully!"
	  else
	  logger.info "XXXXXX #{@user.errors.full_messages.to_sentence}"
	  end
	end


    protected

  def fallpro_user_params
    params.require(:fallpro_user).permit(:user_id, :firstname, :lastname, :phone)
  end
end
