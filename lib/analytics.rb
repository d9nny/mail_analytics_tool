class Analytics
	attr_reader :mail_stats

	def initialize(mail_object)
	  @mail_object = mail_object
	end

  def length
    mail_stats[length] = @mail_object.length
  end

  def number_opened
    @mail_object.each do |item|
      mail_stats[number_opened] += 1 if item['Event'] == 'open'
    end
  end

  def number_clicks
    @mail_object.each do |item|
      mail_stats[number_clicks] += 1 if item['Event'] == 'click'
    end
  end

  

end 