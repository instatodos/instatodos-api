class Task extends React.Component {
  handleCompletedChange(e) {
    this.setState({title: e.target.value})
  }

  render () {
    return (
      <li className='list-group-item'>
        <button type="button" className="btn btn-sm btn-danger pull-right">
          <i className="glyphicon glyphicon-trash"></i>
        </button>
        <label>
          <input
            type="checkbox"
            checked={this.props.completed}
            onChange={this.handleCompletedChange(this)}
            />
          {this.props.title}
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
