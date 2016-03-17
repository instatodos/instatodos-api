const TodoSource = {
  fetchTasks: (id) => {
    return new Promise((resolve, reject) => {
      axios.get( '/todos/' + id + '.json', {} )
        .then((response) => {
          resolve( response.data.tasks )
        })
        .catch((response) => {
          reject('Loading Failed.')
        })
    })
  }
}
