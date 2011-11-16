class Card
  attr_accessor :name, :supervisor, :projects, :allocations
  
  def initialize(args = {})
    args.reverse_merge!( { :name        => nil,
                           :supervisor  => nil,
                           :projects    => [], 
                           :allocations => []})
    @name = args[:name]
    @supervisor = args[:supervisor]
    @projects = args[:projects]
    @allocations = args[:allocations]
  end
end
