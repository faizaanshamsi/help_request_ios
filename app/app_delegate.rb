class AppDelegate < PM::Delegate
  def on_load(app, options)
    open NewHelpRequest.new(nav_bar: true)
  end
end
