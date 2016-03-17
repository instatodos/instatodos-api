class TaskBox extends React.Component {
  constructor (props) {
    super(props)
    this.state = TodoStore.getState()
    this.onChange = this.onChange.bind(this)
  }

  componentWillMount () {
    let todoId = parseInt(this.props.todo_id)
    TodoStore.listen(this.onChange)
    TodoActions.fetchTasks(todoId)
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
        <div className='text-center'>
          <div className="btn-group">
            <button type="button" className="btn btn-default active"> Incomplete </button>
            <button type="button" className="btn btn-default"> Completed </button>
          </div>
        </div>
        <br />
        <TaskForm />
        <TaskList tasks={this.state.tasks}/>
      </div>
    )
  }
}
