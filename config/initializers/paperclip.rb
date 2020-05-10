if ENV['AKIASYVPHMA4YLENABBQ']
  Paperclip::Attachment.default_options.merge!(
    storage: :fog,
    fog_credentials: {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIASYVPHMA4YLENABBQ'],
      aws_secret_access_key: ENV['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'],
            region: ENV['ap-northeast-1'],
            host: ENV['potepanecnamikataec']
        },
        # S3バケットの指定
        fog_directory: ENV["S3_BUCKET"]
  )

end
