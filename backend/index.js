const express = require('express');
const cors = require('cors');
const mysql = require('mysql2/promise');

const app = express();
const port = 3000;

app.use(express.json());
app.use(cors({
    origin: '*',
    credentials: true
}))

// Állítsd be a saját adatbázis elérési adataidat!
const pool = mysql.createPool({
  host: '',
  user: '',        
  password: '',       
  database: '',
});


app.get('/korut', async (req, res) => {
  try {
    const [rows] = await pool.query(`SELECT * FROM korut ORDER BY id`);
    res.json(rows);
  } catch (err) {
    console.error('Hiba a /korut lekérdezésnél:', err);
    res.status(500).json({ hiba: 'Szerver hiba a körút lekérdezésekor.' });
  }
});

app.listen(port, () => {
  console.log(`Télapó backend fut: http://localhost:${port}`);
});
