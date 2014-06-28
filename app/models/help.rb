class Help

  ATTRIBUTES = [:title, :description, :status, :note]

  ATTRIBUTES.each do |attr|
    attr_accessor attr
  end

end


    # AFMotion::JSON.get("http://ember-help.herokuapp.com/api/v1/helps.json") do |result|
    #   p result.body
    # end
