const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const PORT = 3000;

app.use(cors());
app.use(bodyParser.json());
app.use(express.static("public")); // serve your frontend

// route to handle contact form submissions
app.post("/contact", (req, res) => {
  const { name, email, message } = req.body;
  console.log("📩 New message received:");
  console.log("Name:", name);
  console.log("Email:", email);
  console.log("Message:", message);
  res.json({ success: true, message: "Form submitted successfully!" });
});

app.listen(PORT, () => console.log(`✅ Server running at http://localhost:${PORT}`));
