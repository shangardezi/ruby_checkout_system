class PromotionsParser
  def initialize promotions
    @promotions = promotions
  end

  def value_rules
    parse_json[:value_rules]
  end

  def volume_rules
    parse_json[:volume_rules]
  end

  private

    def parse_json
      JSON.parse @promotions, symbolize_names: true
    end
end