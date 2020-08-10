require "pdf_renderer/railtie"

module PdfRenderer
  
end

require "prawn"

ActionController::Renderers.add :pdf do |filename, options|
  pdf = Prawn::Document.new
  pdf.text render_to_string(options)
  send_data(pdf.render, fiename: "#{filename}.pdf", disposition: "attachment")
end