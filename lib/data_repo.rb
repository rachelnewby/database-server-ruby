class DataRepo
  def initialize
    @data = {}
  end

  def set(key, value)
    @data.store("#{key}", "#{value}")
  end
end