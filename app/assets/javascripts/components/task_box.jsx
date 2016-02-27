class TaskBox extends React.Component {
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

  fetchTasks () {
    let url = '/tasks.json'
    $.get(url)
      .done( (data) => {
        this.setState({data: data.tasks})
      }.bind(this))
      .fail( (xhr, status, err) => {
        console.error(url, status, err.toString());
      }.bind(this))
  }

  handleTaskSubmit(task) {
    let url = '/tasks.json'
    let tasks = this.state.data
    task.id = Date.now()
    let newTasks = tasks.concat([task]);
    this.setState({data: newTasks});

    $.post(url, {task: task})
      .done( (data) => {
        let newTasks = tasks.concat([task]);
        this.setState({data: newTasks});
      }.bind(this))
      .fail( (xhr, status, err) => {
        this.setState({data: tasks});
        console.error(url, status, err.toString());
      }.bind(this))
  }


}
