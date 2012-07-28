require 'openssl'

class Task
  attr_reader :description
  attr_accessor :status

  def initialize(description)
    @description = description
    @status = :pending
  end

  def id
    description_hash = OpenSSL::Digest::SHA1.new(@description)
    task_id = description_hash.hexdigest
    task_id.slice(0..5)
  end
end
