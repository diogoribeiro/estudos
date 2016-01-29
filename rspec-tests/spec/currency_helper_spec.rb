require 'spec_helper'

describe CurrencyHelper do
    let(:currency) {
        CurrencyHelper::PTBr.new
    }

    let(:currency_en) {
        CurrencyHelper::US.new

    }

    it "should initialize a new default currency helper" do
        expect(currency).to be_an_instance_of CurrencyHelper::PTBr
    end

    it "should initialize a new currency helper with params" do
        expect(currency_en).to be_an_instance_of CurrencyHelper::US
    end

    it "should have a format method" do
        expect(currency).to respond_to(:format)
    end

    it "should format to brazilian currency" do
        expect(currency.format 12).to eq 'R$ 12,00'
        expect(currency.format 0.65).to eq 'R$ 0,65'
        expect(currency.format 2500.65).to eq 'R$ 2.500,65'
        expect(currency.format 2530.65).to eq 'R$ 2.530,65'
        expect(currency.format 2531.65).to eq 'R$ 2.531,65'
        expect(currency.format 1000.65).to eq 'R$ 1.000,65'
    end

    it "should format decimal with 4 numbers" do
        expect(currency.format 12, 4).to eq 'R$ 12,0000'
    end

    it "should use '.' as decimal separator" do
        expect(currency_en.format 12).to eq 'US$ 12.00'
    end

    it "should use ',' as thousands separator" do
        expect(currency_en.format 1000.65).to eq 'US$ 1,000.65'
    end

    it "should use 'US' as currency symbol" do
        expect(currency_en.format 1000.65).to eq 'US$ 1,000.65'
    end
end