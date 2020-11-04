require_relative "../spec_helper"
require_relative "../../algorithms/sorting"

describe "Sorting Algorithm" do
  context "given an array" do
    let(:array) { [6, 17, 26, 18, 19, 39, 1, 6, 14, 3, 40, 40] }
    let(:sorted) { [1, 3, 6, 6, 14, 17, 18, 19, 26, 39, 40, 40] }

    context "#bubble_sort" do
      it "returns nil when array is empty" do
        expect([].bubble_sort).to be_empty
      end

      it "returns the sorted array" do
        expect(array.bubble_sort).to eq(sorted)
      end
    end

    context "#selection_sort" do
      it "returns nil when array is empty" do
        expect([].selection_sort).to be_empty
      end

      it "returns the sorted array" do
        expect(array.selection_sort).to eq(sorted)
      end
    end

    context "#insert_sort" do
      it "returns nil when array is empty" do
        expect([].insert_sort).to be_empty
      end

      it "returns the sorted array" do
        expect(array.insert_sort).to eq(sorted)
      end
    end

    context "#hell_sort" do
      it "returns nil when array is empty" do
        expect([].hell_sort).to be_empty
      end

      it "returns the sorted array" do
        expect(array.hell_sort).to eq(sorted)
      end
    end

    context "#merge_sort" do
      it "returns nil when array is empty" do
        expect([].merge_sort).to be_empty
      end

      it "returns the sorted array" do
        expect(array.merge_sort).to eq(sorted)
      end
    end

    context "#quick_sort" do
      it "returns nil when array is empty" do
        expect([].quick_sort).to be_empty
      end

      it "returns the sorted array" do
        expect(array.quick_sort).to eq(sorted)
      end
    end
  end
end
