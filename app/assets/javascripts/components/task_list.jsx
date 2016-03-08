class TaskList extends React.Component {

  render () {
    if(!this.props.tasks.length){
      return <img className='spinner' width='50px' src='assets/spinner.gif' />
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
