module UserAgent
  extend ActiveSupport::Concern

  def is_mobile?
    request.user_agent =~ /iPhone|iPad|Android/
  end
end
