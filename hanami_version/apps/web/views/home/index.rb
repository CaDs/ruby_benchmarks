module Web
  module Views
    module Home
      class Index
        include Web::View

        def render
          Time.now.to_json
        end
      end
    end
  end
end
