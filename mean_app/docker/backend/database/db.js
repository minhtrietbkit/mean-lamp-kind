const port = process.env.DB_PORT || 27017;
const host = process.env.DB_HOST || "localhost";

module.exports = {
  db: `mongodb://${host}:${port}/meandatabase`
};
