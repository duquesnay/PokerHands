require_relative "visitor"
class Comparator < Visitor

  def self.compare_objects_by_value(left_part, right_part)
    comparator = new
    comparator.visit left_part
    comparator.visit right_part
    comparator.compare
  end

end
