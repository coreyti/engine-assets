module Support
  module Helpers
    def tm_inspect(label = nil, &block)
      content = yield
      content = content.inspect unless content.is_a? String

      if $0 =~ /textmate-command/
        puts %Q|#{label ? "<p>inspecting: #{label}</p><hr />" : ""}<code>#{CGI.escapeHTML(content)}</code><hr />|
      else
        puts %Q|#{label ? "\ninspecting: #{label}\n" : "\n"}#{'-' * 80}\n#{content}\n#{"-" * 80}|
      end
    end
  end
end
