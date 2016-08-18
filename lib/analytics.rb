class Analytics

	def initialize(mail)
	  @mail_objects = mail
    @stats = {
                :Order => {:opened => 0, :clicked => 0, :qty => 0}, 
                :UserConfirmation => {:opened => 0, :clicked => 0, :qty => 0}, 
                :Shipment => {:opened => 0, :clicked => 0, :qty => 0}, 
                :ReferAFriend => {:opened => 0, :clicked => 0, :qty => 0}, 
                :GetABookDiscount => {:opened => 0, :clicked => 0, :qty => 0}
              }
    @email_types = [:Order, :UserConfirmation, :Shipment, :ReferAFriend, :GetABookDiscount]
    @totals = {:qty => 0, :opened => 0, :clicked => 0}
	end

  def calculate
    quantity()
    number_opened()
    number_clicks()
    calculate_totals()
    calculate_percentage(@totals)
    @email_types.each { |type| calculate_percentage(@stats[type]) }
  end

  def get_stats
    @stats
  end

  def get_totals
    @totals
  end

  private

    def quantity
      @mail_objects.each do |item|
        @email_types.each do |type|
          @stats[type][:qty] += 1 if item[:EmailType] == type.to_s
        end
      end
    end

    def number_opened
      @mail_objects.each do |item|
        @email_types.each do |type|
          @stats[type][:opened] += 1 if (item[:Event] == 'open' && item[:EmailType] == type.to_s)
        end
      end
    end

    def number_clicks
      @mail_objects.each do |item|
        @email_types.each do |type|
          @stats[type][:clicked] += 1 if (item[:Event] == 'click' && item[:EmailType] == type.to_s)
        end
      end
    end

    def calculate_totals
      @totals[:qty] = @mail_objects.length
      @email_types.each do |type|
        @totals[:opened] += @stats[type][:opened]
        @totals[:clicked] += @stats[type][:clicked]
      end
    end

    def calculate_percentage(stat)
      if stat[:qty] != 0
          stat[:opened] = ((stat[:opened].to_f / stat[:qty])*100).round(2)
          stat[:clicked] = ((stat[:clicked].to_f / stat[:qty])*100).round(2)
      end 
    end 

end 