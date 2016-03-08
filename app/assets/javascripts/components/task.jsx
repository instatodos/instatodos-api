class Task extends React.Component {
  handleCompletedChange(e) {
    this.setState({title: e.target.value})
  }

  render () {
    return (
      <li className='list-group-item form-inline'>
        <button type="button" className="btn btn-sm btn-danger pull-right deleteTask">
          <i className=""></i>
        </button>
        <label>
          <input
            type="checkbox"
            checked={this.props.completed}
            onChange={this.handleCompletedChange.bind(this)}
            />
            <input className='form-control input-sm hide' value={this.props.title} />
            <span>{this.props.title}</span>
        </label>
      </li>
    )
  }
}

Task.propTypes = {
  title: React.PropTypes.string,
  description: React.PropTypes.string,
  completed: React.PropTypes.bool
};
