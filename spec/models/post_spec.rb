require "rails_helper"

RSpec.describe Post, type: :model, vcr: true do
  describe "scanning for malware" do
    describe "with a clean file" do
      let(:filename) { Tatoru::Client::Rails::Engine.root.join(*%w[spec files clean.pdf]) }

      before(:each) do
        subject.assets.attach(io: File.open(filename), filename: File.basename(filename))
      end

      it { expect(subject).to be_valid }
    end

    describe "with an infected file" do
      let(:filename) { Tatoru::Client::Rails::Engine.root.join(*%w[spec files infected.zip]) }

      before(:each) do
        subject.assets.attach(io: File.open(filename), filename: File.basename(filename))
      end

      it { expect(subject).not_to be_valid }
    end
  end
end
