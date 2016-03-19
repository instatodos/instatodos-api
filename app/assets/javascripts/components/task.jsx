class Task extends React.Component {
  constructor(props) {
    super(props)
    this.state = { editing: false, editingTitle: this.props.task.title }
  }

  handleTitleClick(e) {
    this.setState({editing: true})
  }

  handleTitleBlur(e) {
    this.setState({editing: false})
  }

  handleTitleChange(e) {
    this.setState({editingTitle: e.target.value})
    let title = this.state.editingTitle.trim()
    if (title) {
      let task = { id: this.props.task.id, title: title }
      TodoActions.updateTask(task)
    }
  }

  handleCompletedChange(e) {
    let task = { id: this.props.task.id, completed: e.target.checked }
    TodoActions.updateTask(task)
  }

  handleDelete(e){
    TodoActions.destroyTask(this.props.task.id)
  }

  render () {
    return (
      <li className='list-group-item form-inline'>
        <input
          type="checkbox"
          checked={this.props.task.completed}
          onChange={this.handleCompletedChange} />
        <span
          className={ classNames({ hide: this.state.editing }) }
          onClick={this.handleTitleClick.bind(this)}>
          {this.props.task.title} </span>
        <input
          className={
            classNames('form-control input-sm', { hide: !this.state.editing }) }
            value={this.state.editingTitle}
            onChange={this.handleTitleChange.bind(this)}
            onBlur={this.handleTitleBlur.bind(this)}
            ref={(input) => { if (input != null) input.focus()} }
            />
        <button type="button"
          className="btn btn-sm btn-danger pull-right deleteTask"
          onClick={this.handleDelete.bind(this)} >
          <i className="glyphicon glyphicon-minus"></i> </button>
      </li>
    )
  }
}


Task.propTypes = {
  id: React.PropTypes.number,
  title: React.PropTypes.string,
  description: React.PropTypes.string,
  completed: React.PropTypes.bool
};
