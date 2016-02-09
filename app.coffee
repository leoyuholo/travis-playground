childProcess = require 'child_process'

cmd = [
	'docker'
	'run'
	'-i'
	'--rm'
	'--net', 'none'
	'-v', __dirname + ':/vol/'
	'-u', '$(id -u):$(id -g)'
	'tomlau10/sandbox-run'
	'-C'
	'-c', 'code.c'
	'code'
].join ' '

proc = childProcess.exec cmd, {timeout: 20000}, (err, stdout, stderr) ->
	console.log "err [#{err}]"
	# console.log "stdout [#{stdout}]"
	console.log "stderr [#{stderr}]"

proc.stdin.write '0\n'

proc.stdout.on 'data', (data) ->
	console.log 'data', data
	num = +data
	proc.stdin.write "#{num + 100}\n" if !isNaN num

proc.stderr.on 'data', (data) ->
	console.log 'err', data

proc.on 'end', (code) ->
	console.log 'end', code

console.log cmd
console.log 'Hello Travis'
