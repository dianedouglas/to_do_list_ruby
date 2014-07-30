require 'rspec'
require 'task'
require 'list'

describe 'Task' do
  it 'initializes with a description of a task' do
    test_task = Task.new('Protect the chickens', 1, 'high', '20010203')
    expect(test_task).to be_an_instance_of Task
  end

  it 'reads the description back to you' do
    test_task = Task.new('Protect the chickens', 1, 'high', '20010203')
    expect(test_task.description).to eq 'Protect the chickens'
  end

  it 'provides an id number for each task' do
    test_task = Task.new('Protect the chickens', 1, 'high', '20010203')
    expect(test_task.id).to eq 1
  end

  it 'provides a rate of priority for each task' do
    test_task = Task.new('Protect the chickens', 1, 'high', '20010203')
    expect(test_task.priority).to eq 'high'
  end

  it 'provides a duedate for each task' do
    test_task = Task.new('Protect the chickens', 1, 'high', '20010203')
    expect(test_task.duedate.mon).to eq 2
  end
end

describe(List) do
  it("starts out with an empty list of tasks") do
    test_list = List.new("School stuff", 1)
    test_list.tasks.should eq []
  end

  it("can add tasks") do
    test_list = List.new("School stuff", 1)
    test_task = Task.new("Learn Ruby", 1, 'high', '20010203')
    test_list.add_task(test_task)
    test_list.tasks.should eq [test_task]
  end

  it("returns the list's name") do
    test_list = List.new("School stuff", 1)
    expect(test_list.name).to eq("School stuff")
  end

  it 'provides an id number for each list' do
    test_list = List.new('Chicken Stuff', 1)
    expect(test_list.id).to eq 1
  end
end
