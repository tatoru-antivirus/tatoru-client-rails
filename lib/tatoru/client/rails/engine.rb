module Tatoru
  module Client
    module Rails
      class Engine < ::Rails::Engine
        isolate_namespace Tatoru::Client::Rails
      end
    end
  end
end
