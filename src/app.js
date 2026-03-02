const express = require("express");
const routes = require("./routes");
const { notFound, errorHandler } = require("./middlewares/errorHandler");

const app = express();

app.use(express.json());
app.use("/api", routes);
app.get("/", (_req, res) => res.status(200).json({ message: "Service is running" }));
app.use(notFound);
app.use(errorHandler);

module.exports = app;

