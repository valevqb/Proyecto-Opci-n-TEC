const { Client } = require('pg')

const connectionData = {

    user: 'opcionTec',
  
    host: 'localhost',
  
    database: 'opcionTec',
  
    password: '2003',
  
    port: 5432,
  
  }
  
  const client = new Client(connectionData)

  client.connect()

client.query('SELECT * FROM table')

    .then(response => {

        console.log(response.rows)

        client.end()

    })

    .catch(err => {

        client.end()

    })