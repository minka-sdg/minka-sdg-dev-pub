require 'paperclip'

class WikiPageAttachment < ActiveRecord::Base
  acts_as_wiki_page_attachment do
    if CONFIG.usingS3
      has_attached_file :wiki_page_attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" },
        :storage => :s3,
        :s3_credentials => CONFIG.s3_credentials,
        :s3_protocol => CONFIG.s3_protocol || "https",
        :s3_host_alias => CONFIG.s3_host || CONFIG.s3_bucket,
        :s3_region => CONFIG.s3_region,
        :bucket => CONFIG.s3_bucket,
        :path => "wiki_page_attachments/:id-:style.:extension",
        :url => ":s3_alias_url"
    else
      has_attached_file :wiki_page_attachment,
        styles: { medium: "300x300>", thumb: "100x100>" },
        path: ":rails_root/public/attachments/wiki_page_attachments/:id-:style.:extension",
        url: "/attachments/wiki_page_attachments/:id-:style.:extension"
    end
    invalidate_cloudfront_caches :wiki_page_attachment, "wiki_page_attachments/:id-*"
    validates_attachment_presence :wiki_page_attachment, :message => " is missing."
    validates_attachment_content_type :wiki_page_attachment, :content_type => [
      'image/jpeg',
      'image/jpg',
      'image/png',
      'image/x-png',
      'image/gif',
      'image/pjpeg',
      'application/pdf',
      'image/svg+xml'
    ], :message => ' must be a JPEG, PNG , GIF, PDF, or SVG'
    before_post_process :skip_for_non_images
  end

  IMAGE_CONTENT_TYPES = [
    'image/jpeg',
    'image/jpg',
    'image/png',
    'image/x-png',
    'image/gif',
    'image/pjpeg'
  ]

  def image?
    IMAGE_CONTENT_TYPES.include?( wiki_page_attachment.content_type )
  end

  def skip_for_non_images
    image?
  end
end
