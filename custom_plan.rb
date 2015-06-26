require 'zeus/rails'

class CustomPlan < Zeus::Rails
  def sidekiq
    require 'sidekiq/cli'

    begin
      cli = Sidekiq::CLI.instance
      cli.parse
      cli.run
    rescue => e
      raise e if $DEBUG
      STDERR.puts e.message
      STDERR.puts e.backtrace.join("\n")
      exit 1
    end
  end

  def test
    require 'simplecov'
    SimpleCov.start 'rails'
    Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
    Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
    super
  end

  def teaspoon_console
    require 'teaspoon/console'
    @console = ::Teaspoon::Console.new({})
  end

  def teaspoon(argv=ARGV)
    @console.execute(argv[0])
  end
end

Zeus.plan = CustomPlan.new
