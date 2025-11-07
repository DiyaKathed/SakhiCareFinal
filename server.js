// server.js
import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';

const app = express();
const PORT = 3000;

// Middleware
app.use(cors({ origin: '*' }));
app.use(bodyParser.json());

// Test route to check server
app.get('/', (req, res) => {
  res.send('✅ Backend is running!');
});

// Contact form route
app.post('/contact', (req, res) => {
  const { name, email, message } = req.body;
  if (!name || !email || !message) {
    return res.status(400).json({ success: false, message: 'All fields are required.' });
  }
  console.log('Contact form submission:', { name, email, message });
  return res.json({ success: true, message: 'Your message has been received!' });
});

// Example GET route
app.get('/api/someRoute', (req, res) => {
  res.json({ message: 'Hello from backend!' });
});

// Start server
app.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}`);
});

