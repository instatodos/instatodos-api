class TaskList extends React.Component {
  render () {
    let createItem = ({ title }) => <Task title={title} />
    return <ul> {this.props.tasks.map(createItem)}</ul>;
  }
}

TaskList.propTypes = {
  tasks: React.PropTypes.array
};
