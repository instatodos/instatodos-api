class Task extends React.Component {
  constructor(props) {
    super(props)
    this.state = { editing: false, editTitleText: '' }
  }

  handleEditTitle(e) {
    console.log('editing')
    this.setState({ editing: true })
    this.setState({ editTitleText: this.props.title});
  }

  handleTitleSubmit(e) {
    let val = this.state.editTitleText.trim();
    if (val) {
      this.setState({ editing: true })
      // this.props.onSave(val);
      this.setState({editTitleText: val});
    } else {
      this.props.onDestroy();
    }
  }

  handleCompletedChange(e) {
    this.setState({title: e.target.value})
  }

  handleDelete(e){
    TodoActions.destroyTask(this.props.id)
  }

  render () {
    return (
      <li className='list-group-item form-inline' id={ 'task' + this.props.id}>
        <button type="button"
          className="btn btn-sm btn-danger pull-right deleteTask"
          onClick={this.handleDelete.bind(this)} >
          <i className="glyphicon glyphicon-minus"></i>
        </button>

        <label>
          <input
            type="checkbox"
            checked={this.props.completed}
            onChange={this.handleCompletedChange.bind(this)} />

          <span
            className={ classNames({ hide: this.state.editing }) }
            onClick={this.handleEditTitle.bind(this)}>
              {this.props.title}
              </span>

          <input
            className={
              classNames('form-control input-sm', { hide: !this.state.editing })
            }
            value={this.state.editTitleText}
						onBlur={this.handleTitleSubmit} />
        </label>
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
