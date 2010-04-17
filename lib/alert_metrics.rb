class AlertMetrics < Struct.new(:alert_id)
  def perform
    require "cgi"
    require "base64"
    require "open-uri"
    require "hmac-sha1"

    alert = Alert.find(alert_id)
    
    access_id = CGI::escape("member-acf8d277df")
    secret_key = CGI::escape("cf23f577e2d6bf7b22aa23e6cbaa6158")  

    expires = Time.now.to_i + (60 * 60 * 2)
    url = CGI::escape(alert.url.gsub(/(.*:\/\/)/, ""))
    signature = CGI::escape(Base64.encode64(HMAC::SHA1.digest(secret_key, "#{access_id}\n#{expires}")).chomp)

    api_url = "http://lsapi.seomoz.com/linkscape/url-metrics/#{url}?AccessID=#{access_id}&Expires=#{expires}&Signature=#{signature}"

    alert.metrics = JSON.parse(open(api_url).read)
    alert.save
  end  
end