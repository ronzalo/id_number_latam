RSpec.describe IdNumberLatam::ArCUIT do
  subject { described_class.new("20-12345678-6") }

  context "with a valid id number" do
    it "valid id_number" do
      expect(subject.valid?).to be_truthy
    end

    it "unformat id_number" do
      expect(subject.unformat).to eq("20123456786")
    end

    it "format id_number" do
      expect(subject.format).to eq("20-12345678-6")
    end
  end
end
