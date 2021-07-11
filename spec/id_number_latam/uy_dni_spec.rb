# frozen_string_literal: true

RSpec.describe IdNumberLatam::UyDni do
  subject { described_class.new("23486497") }

  context "with a valid id number" do
    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("23486497")
    end

    it "format id_number" do
      expect(subject.format).to eq("2.348.649-7")
    end
  end
end
