const {pool} = require('../database/postgeSQL');

const getEventos =  async (req,res) => {
   
    const response =  await pool.query('SELECT getEventos()');
    console.debug(response.rows[0]);
    res.json(JSON.parse(response.rows[0]))
}

module.exports = {getEventos};