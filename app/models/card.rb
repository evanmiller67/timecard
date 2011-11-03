class Card
  attr_accessor :name, :supervisor, :date, :projects, :allocations
  
  def initialize(args = {})
    args.reverse_merge!( { :name        => nil,
                           :supervisor  => nil,
                           :date        => nil,
                           :projects    => [], 
                           :allocations => []})
    @name = args[:name]
    @supervisor = args[:supervisor]
    @date = args[:date]
    @projects = args[:projects]
    @allocations = args[:allocations]
  end
end
