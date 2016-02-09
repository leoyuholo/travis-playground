childProcess = require 'child_process'

cmd = [
	'docker'
	'run'
	'--rm'
	'--net', 'none'
	'--entrypoint', 'sh'
	'-v', __dirname
	'tomlau10/sandbox-run'
	'-c', '"ls /"'
].join ' '

childProcess.exec cmd, {timeout: 2000}, (err, stdout, stderr) ->
	console.log "err [#{err}]"
	console.log "stdout [#{stdout}]"
	console.log "stderr [#{stderr}]"

console.log cmd
console.log 'Hello Travis'
