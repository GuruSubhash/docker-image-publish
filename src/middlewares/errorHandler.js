const logger = require("../utils/logger");

function notFound(_req, res) {
  return res.status(404).json({ message: "Route not found" });
}

function errorHandler(err, _req, res, _next) {
  logger.error("Unhandled error", { error: err.message });
  return res.status(500).json({ message: "Internal server error" });
}

module.exports = {
  notFound,
  errorHandler
};

