# encoding: UTF-8
class ExcelExporter
		
		def initialize(name)
			@book = Spreadsheet::Excel::Workbook.new
			@data = @book.create_worksheet name: name
			@date = Spreadsheet::Format.new :number_format => 'DD/MM/YYYY'
		end
		
		def export_collection(collection)
			build_header
			collection.each_with_index { |domain, index| build_data(domain,index) }
			build_footer
			write_excel_buffer
		end
		
		def export_one(domain)
			build_header
			build_data(domain,1)
			build_footer
			write_excel_buffer
		end
		
		def build_header
		end
		
		def build_data(domain, index)
		end
		
		def build_footer
		end
		
		def write_excel_buffer
			blob = StringIO.new('')
			@book.write(blob)
			blob
		end
		
		def write_excel_file(file_name, buffer)
			file = File.new(file_name, 'w+')
			file.write(buffer.string)
			file.close
    	end

	    def format(properties)
	      @format = Spreadsheet::Format.new properties
	    end

end
