class HomeScreen < PM::Screen
  title "Home"

  def on_load
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }
  end
end
