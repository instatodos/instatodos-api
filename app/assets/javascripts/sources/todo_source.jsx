const TodoSource = {
  fetchTasks: () => {
    return new Promise((resolve, reject) => {
      axios.get( '/todos/1.json', {} )
        .then((response) => {
          resolve( response.data.tasks )
        })
        .catch((response) => {
          reject('Loading Failed.')
        })
    })
  }
}
