# frozen_string_literal: true

RSpec.describe IdNumberLatam::ClDni do
  subject { described_class.new("11.111.111") }

  context "with a valid id number" do
    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("11111111")
    end

    it "format id_number" do
      expect(subject.format).to eq("11.111.111")
    end
  end
end
