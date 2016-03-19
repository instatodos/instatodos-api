class TaskList extends React.Component {

  render () {
    if(!this.props.tasks.length){
      return <span className="glyphicon glyphicon-refresh glyphicon-spin"></span>
    }

    let taskNodes = this.props.tasks.map((task) => {
      return (<Task key={task.id} task={task} />)
    })

    return(
      <ul className='list-group'> {taskNodes} </ul>
    )
  }
}
