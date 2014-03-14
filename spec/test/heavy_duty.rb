class HeavyDuty < Struct.new(:developer)
  def perform
    "Run Coder script #{developer}"
  end
end
