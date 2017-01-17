mongodb = require 'mongodb'
MongoClient = mongodb.MongoClient

url = 'mongodb://localhost:27017'

MongoClient.connect url, (err, db) ->
	return console.log err if err
	console.log 'Connected successfully to server'

	db.close()
