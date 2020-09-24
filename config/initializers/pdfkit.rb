if Rails.env.production?

  PDFKit.configure do |config|
    config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
    config.default_options = {
    	print_media_type: true,
    	footer_right: 'Page [page] of [toPage]',
    }
  end
else

  PDFKit.configure do |config|
    config.default_options = {
    	print_media_type: true,
    	footer_right: 'Page [page] of [toPage]',
    }
  end
# else


#   PDFKit.configure do |config|
#     config.root_url = "#{Rails.root.join('public')}/"
#     config.default_options = {
#     	print_media_type: true,
#     	footer_right: 'Page [page] of [toPage]',
#     }
#   end

end
