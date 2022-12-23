# Destroy All RabbitMQ Queues

Should only be done on a dev machine:

```bash
rabbitmqctl stop_app
rabbitmqctl reset
rabbitmqctl start_app
```
