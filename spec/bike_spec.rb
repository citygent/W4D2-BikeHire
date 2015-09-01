require_relative './spec_helper.rb'
require_relative '../lib/bike.rb'

#describing functionlity of the specific bike class

describe Bike do 

  let(:bike) {Bike.new} #instantiate an instance of the Bike Class every test. 

  it 'should not be broken after we create it' do
    expect(bike.broken?).to be false
  end

  it 'should be able to break down' do  
    bike.break
    expect(bike.broken?).to be true
  end

  it 'should be able to be fixed' do
    bike.break
    bike.fix
    expect(bike.broken?).to be false  
  end


end
