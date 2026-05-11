const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("<h1>&#128640; Hello from Node.js Dockerized App!</h1>");
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
