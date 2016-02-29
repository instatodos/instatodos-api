class TaskForm extends React.Component {
  constructor(props) {
    super(props)
    this.state = {title: ''}
  }

  handleTitleChange(e) {
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
      <form className="taskForm" onSubmit={this.handleSubmit.bind(this)}>
        <input
          type="text"
          value={this.state.title}
          onChange={this.handleTitleChange.bind(this)}
          placeholder="Task title"
        />
        <input type="submit" value="✓" />
      </form>
    )
  }
}
