class Alert < ActiveRecord::Base
  belongs_to :feed
  after_create { self.send_later(:get_metrics) }
  
  def get_metrics
    require 'cgi'
    require 'base64'
    require 'open-uri'
  
    ACCESS_ID = CGI::escape('member-acf8d277df')
    SECRET_KEY = CGI::escape('cf23f577e2d6bf7b22aa23e6cbaa6158')  
    EXPIRES = Time.now.to_i + (60*60*2)
    API_CALL = 'url-metrics'
    URL = self.url
  
    signature = CGI::escape(Base64.encode64(HMAC::SHA1.digest(SECRET_KEY, "#{ACCESS_ID}\n#{EXPIRES}")).chomp)
    to_fetch = "http://lsapi.seomoz.com/linkscape/#{API_CALL}/#{URL}?AccessID=#{ACCESS_ID}&Expires=#{EXPIRES}&Signature=#{signature}"
    self.metrics = open(to_fetch).read
    self.save
  end
end
