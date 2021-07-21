# frozen_string_literal: true

RSpec.describe IdNumberLatam::PyDni do
  subject { described_class.new("8765432-6") }

  context "with a valid id number" do
    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("87654326")
    end

    it "format id_number" do
      expect(subject.format).to eq("8.765.432-6")
    end
  end
end
