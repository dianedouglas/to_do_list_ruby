require 'rspec'
require 'task'

describe 'Task' do
  it 'initializes with a description of a task' do
    test_task = Task.new('Protect the chickens')
    expect(test_task).to be_an_instance_of Task
  end

  it 'reads the description back to you' do
    test_task = Task.new('Protect the chickens')
    expect(test_task.description).to eq 'Protect the chickens'
  end
end
