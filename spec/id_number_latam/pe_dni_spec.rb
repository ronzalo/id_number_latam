# frozen_string_literal: true

RSpec.describe IdNumberLatam::PeDni do
  subject { described_class.new("17801146-0") }

  context "with a valid id number" do
    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("178011460")
    end

    it "format id_number" do
      expect(subject.format).to eq("17.801.146-0")
    end
  end
end
