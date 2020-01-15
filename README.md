# Froala editor image upload

[https://www.froala.com/wysiwyg-editor/docs/framework-plugins/rails](https://www.froala.com/wysiwyg-editor/docs/framework-plugins/rails)

## gem
	gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.5'
	gem "wysiwyg-rails"
	gem "froala-editor-sdk"

## Import CSS
	@import "froala_editor.min";
	@import "froala_style.min";

	@import 'plugins/char_counter.min.css';
	@import 'plugins/code_view.min.css';
	@import 'plugins/colors.min.css';
	@import 'plugins/emoticons.min.css';
	@import 'plugins/file.min.css';
	@import 'plugins/fullscreen.min.css';
	@import 'plugins/help.min.css';
	@import 'plugins/image_manager.min.css';
	@import 'plugins/image.min.css';
	@import 'plugins/line_breaker.min.css';
	@import 'plugins/quick_insert.min.css';
	@import 'plugins/special_characters.min.css';
	@import 'plugins/table.min.css';
	@import 'plugins/video.min.css';

	@import 'third_party/embedly.min.css';
	@import 'third_party/image_tui.min.css';
	@import 'third_party/spell_checker.min.css';

## Import Js
	//= require froala_editor.min.js

	//= require plugins/align.min.js
	//= require plugins/char_counter.min.js
	//= require plugins/code_beautifier.min.js
	//= require plugins/code_view.min.js
	//= require plugins/colors.min.js
	//= require plugins/emoticons.min.js
	//= require plugins/entities.min.js
	//= require plugins/file.min.js
	//= require plugins/font_family.min.js
	//= require plugins/font_size.min.js
	//= require plugins/fullscreen.min.js
	//= require plugins/help.min.js
	//= require plugins/image.min.js
	//= require plugins/image_manager.min.js
	//= require plugins/inline_class.min.js
	//= require plugins/inline_style.min.js
	//= require plugins/line_breaker.min.js
	//= require plugins/line_height.min.js
	//= require plugins/link.min.js
	//= require plugins/lists.min.js
	//= require plugins/paragraph_format.min.js
	//= require plugins/paragraph_style.min.js
	//= require plugins/print.min.js
	//= require plugins/quick_insert.min.js
	//= require plugins/quote.min.js
	//= require plugins/save.min.js
	//= require plugins/table.min.js
	//= require plugins/special_characters.min.js
	//= require plugins/url.min.js
	//= require plugins/video.min.js

## Set editor
	$('#wysiwyg').froalaEditor({
      inlineMode: false,
      heightMin: '200px',
      imageUploadParam: 'image',
      imageUploadURL: '/upload_image',
      imageUploadMethod: 'POST',
      imageMaxSize: 2 * 1024 * 1024,
      imageInsertButtons: ['imageBack', '|', 'imageUpload', 'imageByURL'],
      imageDefaultAlign: null,
      imageDefaultDisplay: null,
      imageDefaultWidth: null
      // toolbarButtons: ['bold', 'italic', 'underline'],
    })
    .on('froalaEditor.image.beforeUpload', function (e, editor, images) {
    })
    .on('froalaEditor.image.uploaded', function (e, editor, response) {
      
    })
    .on('froalaEditor.image.inserted', function (e, editor, $img, response) {
    })
    .on('froalaEditor.image.replaced', function (e, editor, $img, response) {
      
    })
    .on('froalaEditor.image.error', function (e, editor, error, response) {
      if (error.code == 1) {  }

      // No link in upload response.
      else if (error.code == 2) {  }
      // Error during image upload.
      else if (error.code == 3) {  }
      // Parsing response failed.
      else if (error.code == 4) { }
      // Image too text-large.
      else if (error.code == 5) { }
      // Invalid image type.
      else if (error.code == 6) { }
      // Image can be uploaded only to same domain in IE 8 and IE 9.
      else if (error.code == 7) { }
    });

## Set Route
	post "/upload_image" => "upload#upload_image", :as => :upload_image

## Add image class
	# models/image.rb
	class Image
	  def self.save(file)
	    name = file.original_filename
	    #create the file path
	    write_path = File.join(Rails.root,'public','uploads','images', name)
	    return_path = File.join('/','uploads','images', name)
	    #write the file
	    File.open(write_path, "wb") { |f| f.write(file.read) }
	    return_path
	  end
	end

## Add Controller
	upload_controller.rb

