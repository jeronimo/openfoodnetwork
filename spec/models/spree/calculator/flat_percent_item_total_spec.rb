module Spree
  describe Calculator::FlatPercentItemTotal do
    let(:calculator) { Calculator::FlatPercentItemTotal.new preferred_flat_percent: 20 }

    it "calculates for a simple line item" do
      line_item = LineItem.new price: 50, quantity: 2
      expect(calculator.compute(line_item)).to eq 20
    end

    it "rounds fractional cents before summing" do
      line_item = LineItem.new price: 0.86, quantity: 8
      expect(calculator.compute(line_item)).to eq 1.36
    end
  end
end
