if Rails.env.production?
  Paperclip::Attachment.default_options.merge!(
    storage: :fog,
    fog_credentials: {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
          region: ENV['AMAZON_S3_REGION'],
          host: ENV['AMAZON_S3_BUCKET_NAME']
    },
        fog_directory: ENV["S3_BUCKET"]
  )

end
