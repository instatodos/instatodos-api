class TaskBox extends React.Component {
  fetchTasks () {
    const data = [
      { id: 1, title: 'hola', description: 'desc', completed: true },
      { id: 2, title: 'hola 2', description: 'desc 2', completed: false }
    ]
    this.setState({data: data})
  }

  handleTaskSubmit(task) {
    let tasks = this.state.data
    task.id = Date.now()
    let newTasks = tasks.concat([task]);
    this.setState({data: newTasks});
    // $.ajax({
    //   url: this.props.url,
    //   dataType: 'json',
    //   type: 'POST',
    //   data: comment,
    //   success: function(data) {
    //     this.setState({data: data});
    //   }.bind(this),
    //   error: function(xhr, status, err) {
    //     this.setState({data: comments});
    //     console.error(this.props.url, status, err.toString());
    //   }.bind(this)
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
