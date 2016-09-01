class Task extends React.Component {
  constructor(props) {
    super(props)
    this.state = {editing: false}
  }

  handleTitleClick(e) {
    this.setState({editing: true})
  }

  handleTitleBlur(e) {
    this.setState({editing: false})
  }

  handleTitleChange(e) {
    let title = e.target.value.trim()
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
      <li className='task list-group-item row no-gutter'>
        <div className='col-xs-1'>
          <input
            className='task-completed'
            type="checkbox"
            checked={this.props.task.completed}
            onChange={this.handleCompletedChange.bind(this)} />
        </div>

        <div className='col-xs-10'>
          <input
            className={
              classNames(
                'form-control input-sm task-title', { 'display-task': !this.state.editing }
              )
            }
            id='task'
            value={this.props.task.title}
            onChange={this.handleTitleChange.bind(this)}
            onClick={this.handleTitleClick.bind(this)}
            onBlur={this.handleTitleBlur.bind(this)}
          />
        </div>

        <div className='col-xs-1'>
          <button
            className="btn btn-sm btn-danger pull-right delete-task"
            onClick={this.handleDelete.bind(this)} >
            <i className="glyphicon glyphicon-minus"></i> </button>
        </div>
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
