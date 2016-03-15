class TaskList extends React.Component {

  render () {
    if(!this.props.tasks.length){
      return <span className="glyphicon glyphicon-refresh glyphicon-spin"></span>
    }

    let taskNodes = this.props.tasks.map((task) => {
      return (<Task
        key={task.id}
        title={task.title}
        description={task.description}
        completed={task.completed}
      />)
    })
    return(
      <ul className='list-group'> {taskNodes} </ul>
    )
  }
}
