class UploadController < ActionController::Base
	IMAGE_EXT = [".gif", ".jpeg", ".jpg", ".png", ".svg"]
	skip_before_action :verify_authenticity_token

	def index
	end

	def upload_image
	    if params[:file]
	      FileUtils::mkdir_p(Rails.root.join("public/uploads/files"))

	      ext = File.extname(params[:file].original_filename)
	      ext = image_validation(ext)
	      file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
	      path = Rails.root.join("public/uploads/files/", file_name)

	      File.open(path, "wb") {|f| f.write(params[:file].read)}
	      view_file = Rails.root.join("/download_file/", file_name).to_s
	      render :json => {:link => view_file}.to_json

	    else
	    	image = Image.save(params[:image])
			# render :json => FroalaEditorSDK::Image.upload(params)
			render :json => {:link => image}.to_json
	    end
	end

	def image_validation(ext)
		raise "Not allowed" unless IMAGE_EXT.include?(ext)
	end

end
