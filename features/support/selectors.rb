module HtmlSelectorsHelpers
  # Maps a name to a selector. Used primarily by the
  #
  #   When /^(.+) within (.+)$/ do |step, scope|
  #
  # step definitions in web_steps.rb
  #
  def selector_for(locator, found=false)
    case locator
      # Add more mappings here.
      # Here is an example that pulls values out of the Regexp:
      #
      #  when /the (notice|error|info) flash/
      #    ".flash.#{$1}"

      # You can also return an array to use a different selector
      # type, like:
      #
      #  when /the header/
      #    "[:css, //header"]

      # This allows you to provide a quoted selector as the scope
      # for "within" steps as was previously the default for the
      # web steps:
      when /^'(.*)'$/
        $1


When /^the first todo item $/; '.todo_item:first'
When /^the second todo item $/; '.todo_item:eq(1)'
When /^the third todo item $/; '.todo_item:eq(2)'
When /^the fourth todo item $/; '.todo_item:eq(3)'
    end
  end
end

World(HtmlSelectorsHelpers)
