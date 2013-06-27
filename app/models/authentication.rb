class Authentication

  TOKEN = "sample"

  def self.verify(signature, timestamp, nonce)
    str = [timestamp, nonce, TOKEN].sort.join("")
    encrypt = Digest::SHA1.hexdigest(str)
    encrypt == signature
  end
end