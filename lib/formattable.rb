module Formattable

  def format_timestamp
    timestamp.strftime(format)
  end

  def timestamp
    self.created_at
  end

  def format
    current_date == timestamp_date ? "%l:%M %P" : "%-m/%-d/%y"
  end

  def current_date
    DateTime.now.strftime("%D")
  end

  def timestamp_date
    timestamp.strftime("%D")
  end

  def format_errors
    self.errors.messages.values.join(" ")
  end

end