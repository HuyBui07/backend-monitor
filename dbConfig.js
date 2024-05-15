// dbConfig.js
import { createConnection } from 'mysql2';

const dbConfig = {
  host: 'localhost', // Docker container exposed port on localhost
  port: 3306, // MySQL default port
  user: 'root',
  password: 'root',
  database: 'cms',
};

const connection = createConnection(dbConfig);

export default connection;
