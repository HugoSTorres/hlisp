require_relative "spec_helper"

describe SExpression do
  before do
    @s = SExpression.new
  end

  it "should have an atom" do
    expect(@s).to respond_to :atom
  end

  it "should have a sequence" do
    expect(@s).to respond_to :sequence
  end

  it "should have either an atom or a sequence" do
    pending "We need an implementation of atom and sequence to do this"
    expect(true).to be_false
  end
end
