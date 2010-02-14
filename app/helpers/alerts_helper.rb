module AlertsHelper
  def display_one_or_many(obj, name)
    if obj.length == 1
      if name == "domains"
        truncate(obj[0].name, {:length => 25})
      else
        link_to truncate(obj[0].name, {:length => 25}), "#", {:title => obj[0].name}
      end
    elsif obj.length > 1
      obj_names = ""
      obj.each do |o|
        obj_names += o.name + ", " unless o.name.nil?
      end
      link_to obj.length.to_s + " " + name, "#", {:title => obj_names[0, obj_names.length - 2]}
    end
  end
end