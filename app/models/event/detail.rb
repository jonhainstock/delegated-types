class Event::Detail < OpenStruct
  def initialize(particulars)
    @particulars = particulars
  end
end