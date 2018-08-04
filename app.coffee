mongodb = require 'mongodb'
MongoClient = mongodb.MongoClient

console.log process.env

console.log process.env.MY_SECRET_ENV == 'super_secret'

console.log process.env.MY_SECRET_ENV.split().join(' ')

mongoUrl = 'mongodb://localhost:27017'

MongoClient.connect mongoUrl, {useNewUrlParser: true}, (err, db) ->
  return console.log err if err
  console.log 'Connected successfully to mongodb'

  db.close()

amqp = require 'amqp'

amqpUrl = 'amqp://localhost:5672/'

connection = amqp.createConnection {host: amqpUrl}

connection.on 'error', (err) ->
  console.log 'Error from amqp:', err

connection.on 'ready', ->
  console.log 'Connected successfully to rabbitmq'
  connection.disconnect()
