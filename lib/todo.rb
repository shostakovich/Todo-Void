require 'openssl'

class Todo
  attr_reader :description
  attr_accessor :status

  def initialize(description)
    @description = description
    @status = :pending
  end

  def id
    description_hash = OpenSSL::Digest::SHA1.new(@description)
    description_hash = description_hash.hexdigest
    description_hash.slice(0..5)
  end
end
