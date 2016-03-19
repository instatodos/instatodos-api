class TaskForm extends React.Component {
  constructor(props) {
    super(props)
    let todoId = document.getElementById('todo_id').value
    this.state = { title: '', todo_id: todoId }
  }

  handleTitleChange(e) {
    this.setState({title: e.target.value})
  }

  handleCompletedChange(e) {
    this.setState({title: e.target.value})
  }

  handleSubmit(e) {
    e.preventDefault()
    let title = this.state.title.trim()
    let todo_id = this.state.todo_id
    let task = { title: title, todo_id: todo_id }
    if (!title) return
    TodoActions.createTask(task)
    this.setState({title: ''})
  }

  render () {
    return (
      <form className='taskForm' onSubmit={this.handleSubmit.bind(this)}>
        <div className='form-group'>
          <div className="input-group">
            <input
              id='title'
              className="form-control"
              value={this.state.title}
              onChange={this.handleTitleChange.bind(this)}
              placeholder="Task title"
              autoComplete="off"
            />

            <span className="input-group-btn">
              <button type="submit" className="btn btn-primary submitTask">
                <i className="glyphicon glyphicon-plus" aria-hidden="true"></i>
              </button>
            </span>

          </div>
        </div>
      </form>
    )
  }
}
