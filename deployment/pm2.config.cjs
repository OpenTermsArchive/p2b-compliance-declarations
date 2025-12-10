const path = require('path');

const collectionId = path.basename(__dirname);

module.exports = {
  apps: [
    {
      name: `ota-${collectionId}-api`,
      script: 'npm',
      args: 'run start:collection-api',
      min_uptime: '10s',
      max_restarts: 10,
      restart_delay: 1000,
      exponential_backoff_restart_delay: true,
      log_date_format: "YYYY-MM-DDTHH:mm:ssZ"
    }
  ],
};
