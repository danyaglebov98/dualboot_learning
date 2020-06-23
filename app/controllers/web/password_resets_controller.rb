class Web::PasswordResetsController < Web::ApplicationController
  def new
    @reset_password = ResetForm.new
  end

  def create
    @reset_password = ResetForm.new(reset_password_params)
    user = @reset_password.user

    if @reset_password.valid?
      user.generate_password_reset
      UserMailer.with({ user: user }).reset_password.deliver_now
      render('congratulation')
    else
      render(:new)
    end
  end

  def edit
    give_an_error_message
  end

  def give_an_error_message
    @user = User.find_by_password_reset_token!(params[:id])
    return render(:give_an_error_message) if @user.password_reset_token_is_dead?
  end

  def update
    if give_an_error_message
    elsif @user.update(user_params)
      redirect_to(new_session_path)
    else
      render(:edit)
    end
  end

  private

  def reset_password_params
    params.require(:reset_form).permit(:email)
  end

  def user_params
    params.require(:developer).permit(:password)
  end
end