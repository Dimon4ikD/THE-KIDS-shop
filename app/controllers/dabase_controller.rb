class DabaseController < ApplicationController

# rails g scaffold Dabase name:string document:attachment

#   workbook = RubyXL::Parser.parse("path/to/Excel/file.xlsx")
#   workbook = RubyXL::Workbook.new


  # Axlsx::Package.new do |p|
  #   p.workbook.add_worksheet(:name => "Pie Chart") do |sheet|
  #     sheet.add_row ["Simple Pie Chart"]
  #     %w(first second third).each { |label| sheet.add_row [label, rand(24)+1] }
  #     sheet.add_chart(Axlsx::Pie3DChart, :start_at => [0,5], :end_at => [10, 20], :title => "example 3: Pie Chart") do |chart|
  #       chart.add_series :data => sheet["B2:B4"], :labels => sheet["A2:A4"],  :colors => ['FF0000', '00FF00', '0000FF']
  #     end
  #   end
  #   p.serialize('simple.xlsx')
  # end

  # wb = xlsx_package.workbook
  # wb.add_worksheet(name: "Products") do |sheet|
  #   @products.each do |prod|
  #     sheet.add_row [prod.name, prod.category, prod.price]
  #   end
  # end
  # format.xlsx {
  #   response.headers['Content-Disposition'] = 'attachment; filename="dabase.xlsx"'
  # }

  def dabase
    @products = Product.all
  end

  # def upload
  #   uploaded_io = params[:upload]
  #   File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
  #     file.write(uploaded_io.read)
  #   end
  # end

  # def upload
  #   post = File.save(params[:upload])
  #   render :text => "File has been uploaded successfully"
  # end

  def upload
    name = params[:file]
    # file = File.open(name.path, 'r')
    # raise file.read
    workbook = RubyXL::Parser.parse(name.path)
    workbook.worksheets[0] # Returns first worksheet
    workbook[0]            # Returns first worksheet
    workbook['Sheet1']     # Finds and returns worksheet titled "Sheet1"
    worksheet = workbook[0]
    worksheet.sheet_data[0][0] # Returns cell A1 in the worksheet
    worksheet[0][0]            # Returns cell A1 in the worksheet


    raise worksheet[1][0].value.inspect

    # for i in 0..10 do
    #   for j in 0..10 do
    #     worksheet[0][0].value
    #   end
    # end

    # cell = workbook[0][0][0]
    # cell.is_struckthrough  # Returns +true+ if the cell is struckthrough, other boolean properties have same syntax
    # cell.font_name
    # cell.font_size
    # cell.font_color
    # cell.fill_color
    # cell.horizontal_alignment
    # cell.vertical_alignment
    # cell.get_border(:top)
    #
    # worksheet = workbook[0]
    # worksheet.get_column_fill(0)
    # worksheet.get_column_font_name(0)
    # worksheet.get_column_font_size(0)
    # worksheet.get_column_font_color(0)

    # raise worksheet('Products').inspect

    # worksheet.each { |row|
    #   row && row.cells.each { |cell|
    #     val = cell && cell.value
    #     raise val.read
    #   }
    # }
    raise workbook[0]
    file.close
  end



end
