# frozen_string_literal: true

RSpec.describe IdNumberLatam::ClDni do
  subject { described_class.new("529.982.247-25") }

  context "with a valid id number" do
    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("52998224725")
    end

    it "format id_number" do
      expect(subject.format).to eq("529.982.247-25")
    end
  end
end
