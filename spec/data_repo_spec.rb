require 'data_repo'

describe DataRepo do
  before(:each) do
    @data_repo = DataRepo.new
  end

  it "sets data into the repo" do
    @data_repo.set("first", "hello")
    expect(@data_repo.instance_variable_get("@data")).to eq({"first" => "hello"})
  end

  it "sets multiple data fields into the repo" do
    @data_repo.set("first", "hello")
    @data_repo.set("second", "hi")
    expect(@data_repo.instance_variable_get("@data")).to eq({"first" => "hello", "second" => "hi"})
  end

  it "finds data stored in the repo" do
    @data_repo.set("first", "hello")
    expect(@data_repo.find("first")).to eq("hello")
  end

  it "finds data stored in the repo" do
    @data_repo.set("second", "hi")
    expect(@data_repo.find("second")).to eq("hi")
  end

  it "finds data stored in the repo" do
    @data_repo.set("third", "ahoy")
    expect(@data_repo.find("third")).to eq("ahoy")
  end
end
