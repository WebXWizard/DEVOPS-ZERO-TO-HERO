const express = require("express");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
const mongoUrl = process.env.MONGO_URL || "mongodb://mongo:27017/tasktracker";

app.use(express.json());

const taskSchema = new mongoose.Schema(
  {
    title: {
      type: String,
      required: true,
      trim: true
    }
  },
  {
    timestamps: true
  }
);

const Task = mongoose.model("Task", taskSchema);

app.get("/", async (req, res) => {
  const tasks = await Task.find().sort({ createdAt: -1 });
  const taskItems = tasks
    .map((task) => `<li>${task.title}</li>`)
    .join("");

  res.send(`
    <!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Docker Task Tracker</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            max-width: 720px;
            margin: 40px auto;
            padding: 0 20px;
            line-height: 1.5;
          }
          form {
            display: flex;
            gap: 8px;
            margin-bottom: 24px;
          }
          input {
            flex: 1;
            padding: 10px;
          }
          button {
            padding: 10px 14px;
            cursor: pointer;
          }
          li {
            padding: 8px 0;
          }
        </style>
      </head>
      <body>
        <h1>Docker Task Tracker</h1>
        <p>This app uses Docker networking to reach MongoDB and a Docker volume to keep tasks saved.</p>
        <form method="post" action="/tasks/form">
          <input name="title" placeholder="Enter a task" required />
          <button type="submit">Add Task</button>
        </form>
        <h2>Tasks</h2>
        <ul>${taskItems || "<li>No tasks yet.</li>"}</ul>
      </body>
    </html>
  `);
});

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.get("/tasks", async (req, res) => {
  const tasks = await Task.find().sort({ createdAt: -1 });
  res.json(tasks);
});

app.post("/tasks", async (req, res) => {
  const task = await Task.create({ title: req.body.title });
  res.status(201).json(task);
});

app.use(express.urlencoded({ extended: false }));

app.post("/tasks/form", async (req, res) => {
  await Task.create({ title: req.body.title });
  res.redirect("/");
});

async function start() {
  await mongoose.connect(mongoUrl);
  app.listen(port, () => {
    console.log(`Task tracker running on port ${port}`);
  });
}

start().catch((error) => {
  console.error("Failed to start app:", error);
  process.exit(1);
});

