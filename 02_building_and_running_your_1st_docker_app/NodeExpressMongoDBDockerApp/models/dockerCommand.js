'use strict';

const mongoose = require('mongoose'),
  Schema = mongoose.Schema,
  ObjectId = Schema.Types.ObjectId;

const exampleSchema = Schema({
  example: { type: String, required: true },
  description: { type: String, required: true },
});

const dockerCommandSchema = Schema({
  command: { type: String, required: true },
  description: { type: String, required: true },
  examples: [exampleSchema],
});

const DockerCommandModel = mongoose.model('dockerCommand', dockerCommandSchema);

module.exports = DockerCommandModel;
