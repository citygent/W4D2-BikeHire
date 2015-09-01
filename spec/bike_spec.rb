require_relative '../lib/bike.rb'

#describing functionlity of the specific bike class
describe Bike do 
  it 'should not be broken after we create it' do 
    bike = Bike.new #instantiate an instance of the Bike Class
    expect(bike.broken?).to be false
  end

  it 'should be able to break down' do  
    bike = Bike.new
    bike.break
    expect(bike.broken?).to be true
  end

  it 'should be able to be fixed' do
    bike = Bike.new
    bike.break
    bike.fix
    expect(bike.broken?).to be false  
  end


end
