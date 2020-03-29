class MergeCal
  def self.merge(meetings)
    meetings
      .sort {|a, b| a[0] <=> b[0]}
      .reduce([]) do |result, meeting|
        if result.empty?
          result << meeting
        else
          start_time, end_time = result.last

          if end_time >= meeting.first
            result[-1] = [start_time, end_time > meeting.last ? end_time : meeting.last]
            result
          else
            result << meeting
          end
        end
      end
  end
end
