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
      <form onSubmit={this.handleSubmit.bind(this)}>
        <div className='form-group'>
          <div className="input-group">

            <input
              className="form-control"
              value={this.state.title}
              onChange={this.handleTitleChange.bind(this)}
              placeholder="Task title"
            />

            <span className="input-group-btn">
              <button type="submit" claspanssName="btn btn-primary">
                <span className="glyphicon glyphicon-plus" aria-hidden="true"></span>
              </button>
            </span>

          </div>
        </div>
      </form>
    )
  }
}
