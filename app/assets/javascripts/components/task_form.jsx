class TaskForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {title: ''}
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
    if (!title) return
    TodoActions.submitTask({title: title})
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
            />

            <span className="input-group-btn">
              <button type="submit" className="btn btn-primary submitTask">
                <span className="" aria-hidden="true"></span>
              </button>
            </span>

          </div>
        </div>
      </form>
    )
  }
}
