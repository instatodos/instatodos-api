class TaskBox extends React.Component {
  fetchTasks () {
    let url = '/tasks'
    $.ajax({
      url: url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({data: data.tasks});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(url, status, err.toString());
      }.bind(this)
    });
  }

  handleTaskSubmit(task) {
    let url = '/tasks'
    let tasks = this.state.data
    task.id = Date.now()
    let newTasks = tasks.concat([task]);
    this.setState({data: newTasks});
    $.ajax({
      url: url,
      dataType: 'json',
      type: 'POST',
      data: {task: task},
      success: function(data) {
        let newTasks = tasks.concat([task]);
        this.setState({data: newTasks});
      }.bind(this),
      error: function(xhr, status, err) {
        this.setState({data: tasks});
        console.error(url, status, err.toString());
      }.bind(this)
    })
  }

  constructor (props) {
    super(props)
    this.state = { data: [] }
  }

  componentDidMount () {
    this.fetchTasks()
    setInterval(this.fetchTasks(), 2000);
  }

  render () {
    return (
      <div className="taskBox">
        <h1>Tasks</h1>
        <TaskForm onTaskSubmit={this.handleTaskSubmit.bind(this)} />
        <TaskList data={this.state.data} />
      </div>
    )
  }

}
