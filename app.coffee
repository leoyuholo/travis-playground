mongodb = require 'mongodb'
MongoClient = mongodb.MongoClient

mongoUrl = 'mongodb://localhost:27017'

MongoClient.connect mongoUrl, {useNewUrlParser: true}, (err, db) ->
	return console.log err if err
	console.log 'Connected successfully to server'

	db.close()

amqp = require 'amqp'

amqpUrl = 'amqp://localhost:5672/'

connection = amqp.createConnection {host: amqpUrl}

connection.on 'error', (err) ->
  console.log 'Error from amqp:', err

connection.on 'ready', ->
  connection.queue 'my-queue', (q) ->
    q.bind '#'
    q.subscribe (message) ->
      console.log message
