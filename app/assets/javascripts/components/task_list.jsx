class TaskList extends React.Component {

  render () {
    if(!this.props.tasks.length){
      return <span className="glyphicon glyphicon-refresh glyphicon-spin"></span>
    }

    let taskNodes = this.props.tasks.map((task) => {
      return (<Task key={task.id} task={task} />)
    })

    var ReactTransitionGroup = React.addons.CSSTransitionGroup;

    return(
      <ReactTransitionGroup
        component="ul"
        className="list-group"
        transitionName= "example"
        transitionEnterTimeout={500}
        transitionLeaveTimeout={500}>
          {taskNodes}
      </ReactTransitionGroup>
    )
  }
}
