module NavigationHelpers
  def path_to(page_name)

    case page_name
      when /^(?:the )todo list?$/;       "/"
    end
  end
end

World(NavigationHelpers)
