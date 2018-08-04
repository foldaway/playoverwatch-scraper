require 'json'
require 'nokogiri'
require 'open-uri'

CHROME_USER_AGENT = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36'

module PlayOverwatch
  ##
  # This class represents a scraper that can be used to retrieve certain statistics.
  class Scraper
    ##
    # Creates a scraper with a specified battle tag.
    # The +battle_tag+ can be in the hex (#) or hyphenated (-) format. It IS case sensitive.
    def initialize(battle_tag)
      @player_page = Nokogiri::HTML(open("https://playoverwatch.com/en-us/career/pc/#{battle_tag.gsub(/#/, '-')}", "User-Agent" => CHROME_USER_AGENT))
    end

    ##
    # Retrieve the player's player icon. Returns an image URL.
    def player_icon
      @player_page.css('img.player-portrait').first["src"]
    end

    ##
    # Retrieve a player's level
    def player_level
      quotient = 0
      remainder = @player_page.css('.player-level .u-vertical-center').first.content.to_i
      player_rank_div = @player_page.css('.player-rank')
      if player_rank_div.any?
        level_stars_image_url_code = player_rank_div.first['style'].scan(/0x0250000000000(.+?)_Rank.png/i).flatten
        if level_stars_image_url_code.any?
          quotient = 100 * rank_map[level_stars_image_url_code.first]
        end
      end
      return quotient + remainder
    end

    ##
    # Retrieve a player's endorsement level
    def endorsement_level
      @player_page.css('.endorsement-level .u-center').first.content.to_i
    end

    ##
    # Retrieve a player's current competitive season ranking.
    # Returns -1 if player did not complete placements.
    def sr
      comp_div = @player_page.css('.competitive-rank > .h5')
      return -1 if comp_div.empty?
      content = comp_div.first.content
      content.to_i if Integer(content) rescue -1
    end

    ##
    # Retrieve player's main Quick Play hero, in lowercase form.
    def main_qp
      hero_img = hidden_mains_style.content.scan(/\.quickplay {.+?url\((.+?)\);/mis).flatten.first
      hero_img.scan(/\/hero\/(.+?)\/career/i).flatten.first
    end

    ##
    # Retrieve player's main Competitive hero, in lowercase form.
    # You should check if the sr is -1 before attempting to call this.
    def main_comp
      hero_img = hidden_mains_style.content.scan(/\.competitive {.+?url\((.+?)\);/mis).flatten.first
      hero_img.scan(/\/hero\/(.+?)\/career/i).flatten.first
    end

    private
    def rank_map
      JSON.parse File.read(File.expand_path('./ranks.json', __dir__))
    end

    def hidden_mains_style
      @player_page.css('style').first
    end
  end
end