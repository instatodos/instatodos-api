class Task extends React.Component {
  render () {
    return (
      <li className='list-group-item task'>
        <div className="checkbox">
          <label>
            <input
              type="checkbox"
              checked={this.props.completed}
              onChange={this.handleChangeCompleted.bind(this)}
              />
            {this.props.title}
          </label>
        </div>
      </li>
    )
  }

  handleChangeCompleted () {
    alert('Checked!')
  }
}

Task.propTypes = {
  title: React.PropTypes.string,
  description: React.PropTypes.string,
  completed: React.PropTypes.bool
};
