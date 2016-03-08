class TaskBox extends React.Component {
  constructor (props) {
    super(props)
    this.state = TodoStore.getState()
    this.onChange = this.onChange.bind(this)
  }

  componentWillMount () {
    TodoStore.listen(this.onChange)
    TodoActions.fetchTasks()
  }

  componentWillUnmount() {
    console.log('unmounting')
    TodoStore.unlisten(this.onChange)
  }

  onChange(state) {
    this.setState(state)
  }

  render () {
    // var cx = React.addons.classSet;
    // var classes = cx({
    //   "message": true,
    //   "warning": this.props.warningLevel === "3",
    //   "critical": this.props.warningLevel === "5"
    // });

    return (
      <div className="taskBox">
        <h2>Tasks</h2>
        <div className='text-center'>
          <div className="btn-group">
            <button type="button" className="btn btn-default active"> Incomplete </button>
            <button type="button" className="btn btn-default"> Completed </button>
          </div>
        </div>
        <br />
        <TaskForm />
        <TaskList tasks={this.state.tasks}/>
      </div>
    )
  }
}
