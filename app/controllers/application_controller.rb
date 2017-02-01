require 'trailblazer/endpoint/rails'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def endpoint_app(operation_class, options={}, &block)
    endpoint operation_class, options do |m|
      if block
        block.call(m)
      end
      m.not_found {}
      m.unauthenticated {}
      m.present {}
      m.created {}
      m.success {}
      m.invalid {}
    end
  end
end
