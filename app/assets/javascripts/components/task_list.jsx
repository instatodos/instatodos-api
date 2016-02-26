class TaskList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { tasks: [] };
  }

  componentDidMount () {
    this.fetchTasks()
    setInterval(this.fetchTasks(), 2000);
  }

  fetchTasks () {
    let data = {tasks: [
      { id: 1, title: 'hola', description: 'desc', completed: true },
      { id: 2, title: 'hola 2', description: 'desc 2', completed: false }
    ]}
    this.setState(data)
  }

  render () {
    let createItem = (task) => <Task key={task.id} title={task.title} description={task.description} completed={task.completed} />
    return <ul> {this.state.tasks.map(createItem)} </ul>
  }
}
