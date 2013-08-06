require 'restore/strategy'

class Restore

  module DatabaseStrategies

    class MongoDB < Strategy

      def initialize(config)
        @config = config
      end

      def restore_from(directory)
        execute("mongorestore --drop -d #{@config[:database_name]} #{directory}")
      end

      def execute(command)
        system(command)
      end

    end

  end

end
