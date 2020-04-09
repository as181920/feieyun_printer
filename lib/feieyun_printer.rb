require 'digest/sha1'
require "faraday"
require "active_support/all"
require "feieyun_printer/version"
require "feieyun_printer/api_client"

module FeieyunPrinter
  class Error < StandardError; end

  def self.logger
    @logger ||= defined?(Rails) ? Rails.logger : Logger.new(STDOUT)
  end
end
