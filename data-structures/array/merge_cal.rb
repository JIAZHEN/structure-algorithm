class MergeCal
  def self.merge(meetings)
    meetings
      .sort
      .reduce([]) do |result, meeting|
        start_time, end_time = result.last

        if end_time.nil? || end_time < meeting.first
          result << meeting
        else
          result[-1] = [start_time,
                        [end_time, meeting.last].max]
          result
        end
      end
  end
end
