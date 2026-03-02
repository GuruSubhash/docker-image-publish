const { getHealthStatus } = require("../services/healthService");

function healthCheck(_req, res) {
  return res.status(200).json(getHealthStatus());
}

module.exports = {
  healthCheck
};

