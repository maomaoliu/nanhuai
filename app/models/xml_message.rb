require 'libxml'

class XMLMessage

  XML = 'xml'
  FROM_USER = 'FromUserName'
  TO_USER = "ToUserName"
  CONTENT = 'Content'
  MSG_TYPE = 'MsgType'
  CREATE_TIME = 'CreateTime'
  MSG_ID = "MsgId"
  FUNC_FLAG = 'FuncFlag'
  PIC_URL = "PicUrl"
  LOCATION_X = "Location_X"
  LOCATION_Y = "Location_Y"
  SCALE = "Scale"
  LABEL = "Label"
  TITLE = "Title"
  DESCRIPTION = "Description"
  URL = "Url"
  EVENT = "Event"
  EVENT_KEY = "EventKey"

  def initialize xml
    @document = LibXML::XML::Parser.string(xml).parse
  end

  def parse_element name
    node = @document.find_first(name)
    node.nil? ? nil : node.content
  end

  def build_response response
    doc = LibXML::XML::Document.new()
    doc.root = LibXML::XML::Node.new(XML)
    doc.root << build_to
    doc.root << build_from
    doc.root << build_time
    doc.root << build_type
    doc.root << build_content(response)
    doc.root << build_flag
    doc.to_s
  end

  private

  def build_flag
    flag = LibXML::XML::Node.new(FUNC_FLAG)
    flag << 0
  end

  def build_content(response)
    content = LibXML::XML::Node.new(CONTENT)
    content << LibXML::XML::Node.new_cdata(response)
  end

  def build_type
    type = LibXML::XML::Node.new(MSG_TYPE)
    type << LibXML::XML::Node.new_cdata('text')
  end

  def build_time
    created_time = LibXML::XML::Node.new(CREATE_TIME)
    created_time << Time.now.to_i
  end

  def build_from
    from = LibXML::XML::Node.new(FROM_USER)
    from << LibXML::XML::Node.new_cdata(parse_element(TO_USER))
  end

  def build_to
    to = LibXML::XML::Node.new(TO_USER)
    to << LibXML::XML::Node.new_cdata(parse_element(FROM_USER))
  end
end