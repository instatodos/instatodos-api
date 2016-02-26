class TaskList extends React.Component {
  render () {
    let taskNodes = this.props.data.map((task) => {
      return (<Task
        key={task.id}
        title={task.title}
        description={task.description}
        completed={task.completed}
      />)
    })

    return <ul className='taskList'> {taskNodes} </ul>
  }
}
