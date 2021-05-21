# GoAccess

- **Last 2 weeks (all sites)**: `sudo zcat -f /var/log/apache2/*access.log.{2..14}.gz | sudo goaccess -a -o /var/www/example.com/server/all.html --log-format=COMBINED`
- **Realtime (today, all sites)**: `sudo goaccess /var/log/apache2/*-access.log -o /var/www/example.com/server/goaccess.html --log-format=COMBINED --real-time-html`
- **Realtime (latest, other sites)**: `goaccess access.log -o /var/www/html/report.html --log-format=COMBINED --real-time-html`
- **Realtime (all)**: `zcat /var/log/nginx/access.log.{1..15}.gz | ./goccess /var/log/nginx/access.log -`
- **Historical**: `sudo zcat -f /var/log/apache2/access.log.{2..14}.gz | sudo goaccess /var/log/apache2/access.log -a -o /var/www/example.com/server/goaccess.html --log-format=COMBINED`

- `goaccess /var/log/apache2/access.log -o /var/www/example.com/server/goaccess.html --log-format=COMBINED --real-time-html`



