require 'data_repo'

describe DataRepo do
  it "sets data into the repo" do
    data_repo = DataRepo.new
    data_repo.set("first", "hello")
    expect(data_repo.instance_variable_get("@data")).to eq({"first" => "hello"})
  end
end
