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