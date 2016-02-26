class TaskList extends React.Component {
  render () {
    let createItem = (task) => <Task key={task.id} title={task.title} description={task.description} completed={task.completed} />
    return <ul> {this.props.tasks.map(createItem)} </ul>;
  }
}

TaskList.propTypes = {
  tasks: React.PropTypes.array
};
