class TaskBox extends React.Component {
  constructor (props) {
    super(props)
    this.state = TodoStore.getState()
    this.onChange = this.onChange.bind(this)
  }

  componentWillMount () {
    TodoStore.listen(this.onChange)
    TodoActions.fetchTasks()
  }

  componentWillUnmount() {
    TodoStore.unlisten(this.onChange)
  }

  onChange(state) {
    this.setState(state)
  }

  render () {
    return (
      <div className="taskBox">
        <h1>Tasks</h1>
        <TaskForm />
        <TaskList tasks={this.state.tasks}/>
      </div>
    )
  }
}
