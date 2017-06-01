class Cart

  attr_accessor :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_item(item_id)
    if @contents["#{item_id}"] != nil
      increase_quantity(item_id)
    else
      contents[item_id.to_s] = (contents[item_id.to_s] || 0) + 1
    end
  end

  def quantity_for(item_id)
    contents[item_id.to_s]
  end

  def increase_quantity(item_id)
    @contents["#{item_id}"] += 1
  end

end
