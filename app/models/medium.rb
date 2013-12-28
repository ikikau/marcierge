
class Medium < ActiveRecord::Base

  attr_accessible :asset


  #  Validations
  #-----------------------------------------------
  validate :asset,
    content_type: {
      content_type: %w[image/jpeg image/jpg image/pjpeg image/png]
    },
    presence: true,
    attachment_size: { less_than: 20.megabyte }


  #  Paperclip
  #-----------------------------------------------
  has_attached_file :asset,
    styles: {
      large: '1020>',
      thumbnail: '243x172#',
      small: '300x300>',
      facebook: '300x300#',
    },
    convert_options: {
      large: '-strip',
      thumbnail: '-quality 75 -strip',
    }

  before_save :rename_file
  after_save :check_file


private


  #  Callback: Check if successfully uploaded after save
  #-----------------------------------------------
  def check_file
    if read_attribute(:asset_file_name).nil?
      self.destroy
    end
  end


  #  Callback: Rename file before save
  #-----------------------------------------------
  def rename_file
    return unless asset.queued_for_write.present?

    path = asset.queued_for_write[:original].path
    ext = File.extname path
    basename = File.basename path, ext
    file_name = "#{Digest::MD5.hexdigest(basename + Time.now.to_i.to_s)}#{ext}"

    asset.instance_write :file_name, file_name
  end

end

