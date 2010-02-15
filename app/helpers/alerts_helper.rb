module AlertsHelper
  def display_one_or_many(obj)
    if obj.length == 1
      if obj[0].name.length <= 25
        obj[0].name
      else
        link_to truncate(obj[0].name, {:length => 25}), "#", {:title => obj[0].name}
      end
    elsif obj.length > 1
      obj_names = ""
      obj.each do |o|
        obj_names += o.name + ", " unless o.name.nil?
      end
      link_to obj.length.to_s + " " + obj[0].class.name.downcase.pluralize, "#", {:title => obj_names[0, obj_names.length - 2]}
    end
  end
end