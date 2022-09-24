'use strict';

const DockerCommand = require('../models/dockerCommand');

const dockerCommandsRepository = (function () {
  const getDockerCommands = function (callback) {
    DockerCommand.find(function (err, commands) {
      if (err) return callback(err, null);

      callback(err, commands);
    });
  };

  return {
    getDockerCommands: getDockerCommands,
  };
})();

module.exports = dockerCommandsRepository;
