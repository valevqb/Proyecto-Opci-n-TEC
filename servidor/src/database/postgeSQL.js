const {Pool} = require('pg');

const pool = new Pool({
    host: '192.168.18.13',
    user: 'opcionTec',
    password: '2003',
    database: 'OpcionTEC',
    port: '5432'
})

module.exports = {pool}