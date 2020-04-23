class MailPresenter < BasePresenter
  def body
    if o.multipart?
      o.text_part.try(:decoded).presence || mail.html_part.try(:decoded).presence || default_body
    else
      default_body
    end
  end
  
  private 

  def default_body
    o.try(:body).to_s.encode("UTF-8", "binary", invalid: :replace, undef: :replace, replace: "")
  end
end
