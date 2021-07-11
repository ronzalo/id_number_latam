# frozen_string_literal: true

RSpec.describe IdNumberLatam::EcDni do
  context "with a valid id number" do
    subject { described_class.new("1104680135") }

    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("1104680135")
    end

    it "format id_number" do
      expect(subject.format).to eq("110468013-5")
    end

    it "#modulo" do
      expect(subject.modulo).to eq(10)
    end

    it "#coefficient" do
      expect(subject.coefficient).to eq("212121212")
    end
  end

  context "with a valid RUC number" do
    subject { described_class.new("1768156470001") }

    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("1768156470001")
    end

    it "format id_number" do
      expect(subject.format).to eq("176815647000-1")
    end

    it "#modulo" do
      expect(subject.modulo).to eq(11)
    end

    it "#coefficient" do
      expect(subject.coefficient).to eq("32765432")
    end
  end

  context "for private companies or foreigners" do
    subject { described_class.new("0990049459001") }

    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("0990049459001")
    end

    it "format id_number" do
      expect(subject.format).to eq("099004945900-1")
    end

    it "#modulo" do
      expect(subject.modulo).to eq(11)
    end

    it "#coefficient" do
      expect(subject.coefficient).to eq("432765432")
    end
  end
end
