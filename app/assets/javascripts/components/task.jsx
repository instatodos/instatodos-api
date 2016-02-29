class Task extends React.Component {
  render () {
    return (
      <li>
        <span>{this.props.title}</span>
        <input
          type="checkbox"
          checked={this.props.completed}
          onChange={this.handleChangeCompleted.bind(this)}
        />
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
