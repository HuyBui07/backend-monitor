// monitor.js
import { exec } from 'child_process';
import { schedule } from 'node-cron';
import connection from './dbConfig.js';

// Function to check database connection
const checkDatabase = () => {
  connection.query('SELECT 1', (err, results) => {
    if (err) {
      console.error('Database connection failed:', err);
      // Implement failover mechanism here
      handleFailover();
    } else {
      console.log('Database is healthy');
    }
  });
};

// Function to perform database backup
const backupDatabase = () => {
  const timestamp = new Date().toISOString().replace(/T/, '_').replace(/:/g, '-').replace(/\..+/, '');
  const backupFile = `./backups/db_backup_${timestamp}.sql`;
  
  exec(`mysqldump -u root -proot cms > ${backupFile}`, (err, stdout, stderr) => {
    if (err) {
      console.error('Error during backup:', err);
    } else {
      console.log('Backup successful:', backupFile);
    }
  });
};

// Function to handle failover
const handleFailover = () => {
  console.log('Handling failover...');
  // Add logic to promote slave to master or switch to a replica
};

// // Schedule health checks every minute
// schedule('* * * * *', () => {
//   console.log('Running health check...');
//   checkDatabase();
// });

// // Schedule backups every hour
// schedule('0 * * * *', () => {
//   console.log('Running backup...');
//   backupDatabase();
// });

checkDatabase();
backupDatabase();

// Ensure backups directory exists
import { existsSync, mkdirSync } from 'fs';
const backupDir = './backups';
if (!existsSync(backupDir)){
    mkdirSync(backupDir);
}

console.log('Monitoring module started...');
