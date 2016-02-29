const TodoSource = {
  fetchTasks:  function() {
    return new Promise( function(resolve, reject) {
      axios.get( '/tasks.json', {} )
        .then( function( response ){
          resolve( response.data.tasks );
        })
        .catch( function(response) {
          reject('Loading Failed.');
        });
    });
  }
};
