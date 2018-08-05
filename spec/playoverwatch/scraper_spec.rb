RSpec.describe PlayOverwatch do
  it "has a version number" do
    expect(PlayOverwatch::VERSION).not_to be nil
  end

  describe "can scrape correctly" do
    before(:all) do
      @scraper = PlayOverwatch::Scraper.new('BattleTag#4615') # Random battle tag from Google
    end

    it "can get player icon" do
      expect(@scraper.player_icon).to start_with('http')
    end

    it "can get player level" do
      expect(@scraper.player_level).to be_an(Numeric)
    end

    it "can get endorsement level" do
      expect(@scraper.endorsement_level).to be_an(Numeric)
    end

    it "can get competitive SR" do
      expect(@scraper.sr).to be_an(Numeric)
    end

    it "can get main qp" do
      expect(@scraper.main_qp).to be_a(String)
    end
  end
end
