require 'analytics'

describe Analytics do
  subject(:analytics) { described_class.new(test_data) }
  let(:test_data) {[
    {"Address":"barney@lostmy.name","EmailType":"Shipment","Event":"send","Timestamp":1432820696},
    {"Address":"tom@lostmy.name","EmailType":"UserConfirmation","Event":"click","Timestamp":1432820702},
    {"Address":"vitor@lostmy.name","EmailType":"Shipment","Event":"open","Timestamp":1432820704}
  ]}
  calculated_stats = {
    :Order => {opened: 0, clicked: 0, qty: 0}, 
    :UserConfirmation => {opened: 0.0, clicked: 100.0, qty: 1}, 
    :Shipment => {opened: 50.0, clicked: 0.0, qty: 2}, 
    :ReferAFriend => {opened: 0, clicked: 0, qty: 0}, 
    :GetABookDiscount => {opened: 0, clicked: 0, qty: 0}
  }
  calculated_totals = { :opened => 33.33, :clicked => 33.33, :qty => 3 }

  describe '#calculate' do
    it 'should calculate the stats' do
      analytics.calculate()
      expect(analytics.get_stats()).to eq calculated_stats
    end
  end

  describe '#get_stats' do
    it 'should return the stats' do
      analytics.calculate()
      expect(analytics.get_stats()).to eq calculated_stats
    end
  end

  describe '#get_totals' do
    it 'should return the totals' do
      analytics.calculate()
      expect(analytics.get_totals()).to eq calculated_totals
    end
  end

end
