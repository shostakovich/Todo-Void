require 'openssl'

class Task
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def id
    description_hash = OpenSSL::Digest::SHA1.new(@description)
    task_id = description_hash.hexdigest
    task_id.slice(0..5)
  end
end
