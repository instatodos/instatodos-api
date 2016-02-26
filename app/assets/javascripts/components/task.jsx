class Task extends React.Component {
  onChange () {
    alert('checked')
  }

  render () {
    return (
      <li>
        <span>{this.props.title}</span>
        <input
          type="checkbox"
          checked={this.props.completed}
          onChange={this.onChange}
        />
      </li>
    )
  }
}

Task.propTypes = {
  title: React.PropTypes.string,
  description: React.PropTypes.string,
  completed: React.PropTypes.bool
};
