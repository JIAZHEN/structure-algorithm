require_relative "../spec_helper"
require_relative "../../data-structures/stack/stack"

describe Stack do
  before { @instance = Stack.new }

  context "#push" do
    before do
      [10, 12, 9, 14, 7].each { |n| @instance.push(n) }
    end

    it "records the data correctly" do
      expect(@instance.stack).to eq([10, 12, 9, 14, 7])
      expect(@instance.min_indices).to eq([0, 2, 4])
      expect(@instance.min_value).to eq(7)
    end
  end

  context "#pop" do
    before do
      [10, 12, 9, 14, 7].each { |n| @instance.push(n) }
      @value = @instance.pop
    end

    it "pops correctly" do
      expect(@value).to eq(7)
      expect(@instance.stack).to eq([10, 12, 9, 14])
      expect(@instance.min_indices).to eq([0, 2])
      expect(@instance.min_value).to eq(9)
    end

    context "when it pops everything" do
      before { 4.times { @instance.pop } }

      it "works properly" do
        expect(@instance.stack).to eq([])
        expect(@instance.min_indices).to eq([])
        expect(@instance.min_value).to be_nil
      end

      context "then it pushs again" do
        before do
          [10, 12, 9, 14, 7].each { |n| @instance.push(n) }
        end

        it "works properly" do
          expect(@instance.stack).to eq([10, 12, 9, 14, 7])
          expect(@instance.min_indices).to eq([0, 2, 4])
          expect(@instance.min_value).to eq(7)
        end
      end
    end

    context "when it pushes and pops the duplicate value" do
      before do
        @instance.push(7).push(7).push(8)
        2.times { @instance.pop }
      end

      it "works properly" do
        expect(@instance.stack).to eq([10, 12, 9, 14, 7])
        expect(@instance.min_indices).to eq([0, 2, 4])
        expect(@instance.min_value).to eq(7)
      end
    end
  end
end
