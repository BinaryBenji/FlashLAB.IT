var express = require('express');
var router = express.Router();
var PythonShell = require('python-shell');

/*var options = {
    pythonPath: '/usr/bin/python3.5',
    scriptPath: '../../ansible/ok-playbooks/'
};*/



/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});


router.post('/', function(req, res, next) {
  key = req.body.key
  pass = '$2a$10$33USXSTL1p7WuPIah5TwX.shP3z6mRymUqFv1BOZgXm.pJhzoblsi'

  if (key === pass){
  	res.render('success');
  	console.log('Infrastructure deployment requested.')
  	/* WARNING : Set path to the script */ 

      PythonShell.run('launch.py', function (err, results) {
  		if (err) throw err;
		console.log('%j', results);
	});
  }
  else{
  	res.render('failure');
  	console.log('Someone is trying to bruteforce the launch form.')
  }
});

module.exports = router;
