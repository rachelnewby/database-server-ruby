require 'data_repo'

describe DataRepo do
  it "sets data into the repo" do
    data_repo = DataRepo.new
    data_repo.set("first", "hello")
    expect(data_repo.instance_variable_get("@data")).to eq({"first" => "hello"})
  end

  it "sets multiple data fields into the repo" do
    data_repo = DataRepo.new
    data_repo.set("first", "hello")
    data_repo.set("second", "hi")
    expect(data_repo.instance_variable_get("@data")).to eq({"first" => "hello", "second" => "hi"})
  end
end
