require_relative "../spec_helper"
require_relative "../../data-structures/array/merge_cal"

describe MergeCal do
  context "#merge" do
    it "merges the meeting" do
      meetings = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]
      expect(described_class.merge(meetings)).to eq([[0, 1], [3, 8], [9, 12]])
    end

    it "merges the meeting" do
      meetings = [[1, 2], [2, 3]]
      expect(described_class.merge(meetings)).to eq([[1, 3]])
    end

    it "merges the meeting" do
      meetings = [[1, 5], [2, 3]]
      expect(described_class.merge(meetings)).to eq([[1, 5]])
    end

    it "merges the meeting" do
      meetings = [[1, 10], [2, 6], [3, 5], [7, 9]]
      expect(described_class.merge(meetings)).to eq([[1, 10]])
    end

    it "merges the meeting" do
      meetings = [[1, 3], [2, 4]]
      expect(described_class.merge(meetings)).to eq([[1, 4]])
    end
  end

  context "in-place reverse" do
    def reverse!(string)
      length = string.size
      (0...(length / 2)).each do |n|
        right_idx = length - n - 1
        string[n], string[right_idx] = string[right_idx], string[n]
      end
      string
    end

    it "works for empty string" do
      expect(reverse!("")).to eq("")
    end

    it "works for one string" do
      expect(reverse!("A")).to eq("A")
    end

    it "works for more strings" do
      expect(reverse!("ABCDE")).to eq("EDCBA")
    end
  end

  context "in-place reverse words" do
    def reverse_words!(message)
      left_start, left_end = 0, 0
      right_start, right_end = message.size, message.size

      while left_end < right_start
        (left_end += 1) until message[left_end] == " "
        (right_start -= 1) until message[right_start] == " "

        break if left_end >= right_start

        message[(right_start+1)..right_end], message[left_start...left_end] = message[left_start...left_end], message[(right_start+1)..right_end]
        left_end += 1
        left_start = left_end

        right_start -= 1
        right_end = right_start
      end

      message
    end

    it "works for more strings" do
      expect(reverse_words!("cake pound steal")).to eq("steal pound cake")
    end
  end

  context "merge sorted lists" do
    def merge_arrays(list1, list2)
      list1_cnt, list2_cnt, merged = 0, 0, []

      while list1_cnt < list1.size && list2_cnt < list2.size
        if list1[list1_cnt] < list2[list2_cnt]
          merged << list1[list1_cnt]
          list1_cnt += 1
        else
          merged << list2[list2_cnt]
          list2_cnt += 1
        end
      end

      (merged += list1[list1_cnt...list1.size]) if list1_cnt < list1.size
      (merged += list2[list2_cnt...list2.size]) if list2_cnt < list2.size
      merged
    end

    it "works for two lists" do
      my_array     = [3, 4, 6, 10, 11, 15]
      alices_array = [1, 5, 8, 12, 14, 19]
      expect(merge_arrays(my_array, alices_array)).to eq([1, 3, 4, 5, 6, 8, 10, 11, 12, 14, 15, 19])
    end
  end

  context "check first-come, first-served" do
    def first_come_first_served?(take_out_orders, dine_in_orders, served_orders)
      until served_orders.empty?
        order_id = served_orders.shift

        if order_id == take_out_orders.first
          take_out_orders.shift
        elsif order_id == dine_in_orders.first
          dine_in_orders.shift
        else
          return false
        end
      end

      take_out_orders.empty? && dine_in_orders.empty?
    end

    it "works for both registers have same number of orders" do
      expect(first_come_first_served?(
                [1, 4, 5],
                [2, 3, 6],
                [1, 2, 3, 4, 5, 6])
            ).to be_truthy
    end

    it "works for registers have different lengths" do
      expect(first_come_first_served?(
                [1, 5],
                [2, 3, 6],
                [1, 2, 6, 3, 5])
            ).to be_falsey
    end

    it "works for one register has extra orders" do
      expect(first_come_first_served?(
                [1, 9],
                [7, 8],
                [1, 7, 8])
            ).to be_falsey
    end
  end
end
