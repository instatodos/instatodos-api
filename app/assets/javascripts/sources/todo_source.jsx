const TodoSource = {
  fetchTasks: () => {
    return new Promise((resolve, reject) => {
      axios.get( '/tasks.json', {} )
        .then((response) => {
          resolve( response.data.tasks )
        })
        .catch((response) => {
          reject('Loading Failed.')
        });
    });
  }
};
