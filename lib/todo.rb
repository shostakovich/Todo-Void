require 'openssl'

class Todo
  attr_reader :description
  attr_accessor :tags, :status, :finished_at

  def initialize(description)
    @description = description
    @status = :pending
    @tags = []
  end

  def id
    description_hash = OpenSSL::Digest::SHA1.new(@description)
    description_hash = description_hash.hexdigest
    description_hash.slice(0..5)
  end

  def status=(status)
    @status = status
    if status == :finished && finished_at.nil?
      @finished_at = Time.now
    end
  end
end
