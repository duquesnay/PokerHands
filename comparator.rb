class Comparator

  @values

  def initialize
    @values=[]
  end

  def gather_value value
    @values << value
  end

  def visit part
    raise ArgumentError.new "object cannot be visited because no tell_value method : #{part}" if ! part.respond_to? :tell_value
    part.tell_value self
  end

  def self.compare_objects_by_value(left_part, right_part)
    comparator = new
    comparator.visit left_part
    comparator.visit right_part
    comparator.compare
  end

  def compare
    return left_value <=> right_value
  end

  private

  def left_value
    @values[0]
  end

  def right_value
    @values[1]
  end

end