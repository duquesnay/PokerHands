class DoubletsEnumerator

  def self.each_pair_of( enumerable )
    enumerator = DoubletsEnumerator.new(enumerable)
    enumerator.each{ |*args| yield args }
  end

  def initialize(enumerator)
    @enumerator = enumerator.each
    shift
  end

  def each
    while shift
      yield @left, @right
    end
  end

  def shift
    begin
      @left = @right
      @right = @enumerator.next
    rescue StopIteration
      return false
    end
  end
end
