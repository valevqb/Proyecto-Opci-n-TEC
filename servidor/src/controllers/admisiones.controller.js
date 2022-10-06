const {pool} = require('../database/postgeSQL');

const getAdmisiones =  async (req,res) => {
   
    const response =  await pool.query('SELECT  getadmisiones()');
    res.json(JSON.parse(response.rows[0]["getadmisiones"]))
  
}

module.exports = {getAdmisiones}