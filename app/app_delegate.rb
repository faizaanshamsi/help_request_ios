class AppDelegate < PM::Delegate
  def on_load(app, options)
    open HelpRequests.new
  end
end
