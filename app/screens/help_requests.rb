class HelpRequests < PM::TableScreen
  title "Help Requests"
  refreshable

  def on_load
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }

    @help_requests = []
    load_help_requests
  end

  def table_data
     [{
      title: 'Help Requests',
      cells: @help_requests.map do |help_request|
        {
          title: help_request[:title]
          # action: :edit_task,
          # arguments: { task: task }
        }
      end
    }]
  end

  def on_refresh
    load_help_requests
  end

  def load_help_requests
    AFMotion::JSON.get("http://ember-help.herokuapp.com/api/v1/helps.json") do |result|
      result.object[:helps].each do |help|
        help_request = {
          title: help['title'],
          description: help['description'],
          status: help['status'],
          note: help['note']
        }
        @help_requests << help_request
      end
    end
    end_refreshing
    update_table_data
  end
end


