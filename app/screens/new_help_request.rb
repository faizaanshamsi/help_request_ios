class NewHelpRequest < PM::FormotionScreen
  def table_data
    {
      sections: [{
        title: 'Submit a Help Request',
        rows: [
        {
          title: "Title",
          key: :title,
          type: :string,
          placeholder: 'Quick Question',
          auto_correction: :no,
          auto_capitalization: :none,
          input_accessory: :done
        },
        {
          title: "Description",
          key: :description,
          type: :text,
          placeholder: 'This is a really quick question',
          row_height: 100,
          auto_correction: :no,
          auto_capitalization: :none,
          input_accessory: :done
        },
        {
          title: 'Submit',
          type: :submit
        }]
      }]
    }
  end

  def on_submit(_form)
    data = _form.render
    request_body = build_request(data)
    post(request_body)
    open HelpRequests.new(nav_bar: true)
  end

  def build_request(data)
    {
        title: data[:title],
        description: data[:description],
        status: "Open"
      }
  end

  def post(help)
    AFMotion::HTTP.post("http://localhost:3000/api/v1/helps", help: help ) do |result|
      if result.success?
        p result.object
      else
        App.alert(result.error.localizedDescription)
      end
    end
  end
end
