class User

  attr_accessor :name
   attr_reader :accounts

  def initialize(fname, lname)
    @fname = params[:fname]
    @lname = params[:lname]
    @accounts = {}
  end

end
