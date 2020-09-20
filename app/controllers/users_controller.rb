class UsersController < ApplicationController
  # helper_method :sort_column, :sort_direction

  # def index
  #    if params[:search]
  #     @users = User.search(params[:search]).order(:email)
  #   else
  #     @users = User.all
  #   end 
        
  #       # @users = @users.order(:updated_at).reverse_order.page(params[:page]).per(15) 
  #       @users = @users.order("#{sort_column} #{sort_direction}").page(params[:page]).per(15)
  #   end

    def new
      @user = User.new
      @noEmp = Employer.find_by(name: "No Employer").id
    end


    # def edit
    #   @user  = User.find(params[:id])
    # end

    def create
      @user = User.new(user_params)
      @user.user_type = "Fallpro"


     if @user.save
          sign_in :user, @user 
        redirect_to new_fallpro_fallpro_users_path, notice: "User Created successfully!"
      else
      logger.info "XXXXXX #{@user.errors.full_messages.to_sentence}"
      end
    end

    # def update
    #   @user  = User.find(params[:id])
    #   @employers = Employer.all
    #   @primes = Prime.all
    #    if @user.user_type == "Prime Contractor"
    #     prime = Prime.find_by(employer_id: @user.employer_id)
    #     @user.prime_id = prime.id if prime
    #   end
    #   @user.email = @user.email.downcase.presence
    #   if params[:user][:password].blank?
    #     params[:user].delete(:password)
    #     params[:user].delete(:password_confirmation)
    #   end

    #   if @user.update_attributes(user_params)
    #     redirect_to admin_users_path, notice: "Updated successfully!"

    #   else
    #     # flash[:error] = @user.errors.full_messages.to_sentence
    #     render :new, notice: "User could not be created! #{@user.errors.full_messages.to_sentence}"
    #   end
    # end

  #   def destroy
  #     @user  = User.find(params[:id])
  #     @user.destroy
  #     redirect_to admin_users_path, notice: "#{@user.id} was deleted successfully!"
  # end

  protected

  def user_params
    params.require(:user).permit(:employer, :email, :password, :password_confirmation, :user_type, :employer_id, :toc)
  end

   # def sort_column
   #    params[:column] ? params[:column] : "updated_at"
   # end
    
   # def sort_direction
   #    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
   # end
end