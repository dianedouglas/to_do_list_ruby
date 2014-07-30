require 'rspec'
require 'task'
require 'list'

describe 'Task' do
  it 'initializes with a description of a task' do
    test_task = Task.new('Protect the chickens', 1)
    expect(test_task).to be_an_instance_of Task
  end

  it 'reads the description back to you' do
    test_task = Task.new('Protect the chickens', 1)
    expect(test_task.description).to eq 'Protect the chickens'
  end

  it 'provides an id number for each task' do
    test_task = Task.new('Protect the chickens', 1)
    expect(test_task.id).to eq 1
  end
end

describe(List) do
  it("starts out with an empty list of tasks") do
    test_list = List.new("School stuff")
    test_list.tasks.should eq []
  end

  it("can add tasks") do
    test_list = List.new("School stuff")
    test_task = Task.new("Learn Ruby", 1)
    test_list.add_task(test_task)
    test_list.tasks.should eq [test_task]
  end
end
