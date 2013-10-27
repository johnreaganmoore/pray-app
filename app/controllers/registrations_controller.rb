class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  end

  def new
    super
  end

  def create
    @user = User.new(user_permitted)
    @user.save

    if params[:church_type] == 'existing'
      @church = Church.find_by_id(params[:church_id])
    else
      @church = Church.new
      @church.name = params[:church_name]
      @church.date = params[:church_date]

      coords = Geocoder.coordinates(params[:church_address])

      @church.lat = coords[0].to_f
      @church.lng = coords[1].to_f

      @church.save
    end

    @slot = Slot.new
    @slot.hour = params[:hour]
    @slot.user = @user
    @slot.church = @church
    @slot.save

    sign_in @user
    redirect_to home_path
  end

  def update
    super
  end

  private
    def user_permitted
      params.require(:user).permit(:name, :email, :password)
    end

end
