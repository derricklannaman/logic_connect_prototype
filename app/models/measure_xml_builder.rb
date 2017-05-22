class MeasureXmlBuilder

  require 'builder'

  def initialize(codes, list_name)
    @codes = codes
    @list_name = list_name
  end

  def file_creator
    # check if file exist, open and append content,  else create new file
    File.open("measures/output/#{@list_name}.xml", 'w+') do |f|
      f.write(xml_measures_builder(@codes))
    end
  end

  def xml_measures_builder(codes)
    xml = Builder::XmlMarkup.new( :indent => 2 )
    xml.instruct! :xml, :encoding => "ASCII"
    xml.code_lists do
       codes.each do |code|
        xml.code do
          xml.name code.code
          xml.code_system code.code_system
          xml.info code.info
          xml.description code.description
        end
      end
    end
  end

end