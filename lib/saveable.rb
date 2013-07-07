module Saveable

  def attempt_to_save model, notice = nil
    if model.save
      flash[:notice] = notice
    else
      flash[:alert] = model.format_errors
    end
  end
  private :attempt_to_save

end