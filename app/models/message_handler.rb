class MessageHandler
  class << self

    def handle message
      @type = message.parse_element(XMLMessage::MSG_TYPE)
      @from = message.parse_element(XMLMessage::FROM_USER)
      @created = message.parse_element(XMLMessage::CREATE_TIME)
      @msg_id = message.parse_element(XMLMessage::MSG_ID)

      @user = User.find_or_create_by(open_id: @from)
      @message = Message.new(msg_id: @created, from: @from, msg_type: @type, receive_time: @created)
      output = eval "handle_#{@type} message"
      @message.save
      output
    end

    private
    def handle_text message
      text = message.parse_element(XMLMessage::CONTENT)
      text_message = TextMessage.create(text: text)
      @message.details = text_message.id
      entry = NovoEntry.find_by(k: text)
      message.build_response(entry.v)
    end

    def handle_image message
      image_link = message.parse_element(XMLMessage::PIC_URL)
      image_message = ImageMessage.create(link: image_link)
      @message.details = image_message.id
      image_link
    end

    def handle_location message
      location_x = message.parse_element(XMLMessage::LOCATION_X).to_f
      location_y = message.parse_element(XMLMessage::LOCATION_Y).to_f
      scale = message.parse_element(XMLMessage::SCALE).to_i
      label = message.parse_element(XMLMessage::LABEL)
      location_message = LocationMessage.create(x: location_x, y: location_y, scale: scale, label: label)
      @message.details = location_message.id
      label
    end

    def handle_link message
      title = message.parse_element(XMLMessage::TITLE)
      description = message.parse_element(XMLMessage::DESCRIPTION)
      url = message.parse_element(XMLMessage::URL)
      link_message = LinkMessage.create(title: title, description: description, url: url)
      @message.details = link_message.id
      title
    end

    def handle_event message
      event = message.parse_element(XMLMessage::EVENT)
      event_key = message.parse_element(XMLMessage::EVENT_KEY)
      event_message = EventMessage.create(event: event, event_key: event_key)
      @message.details = event_message.id
      event_key
    end
  end
end