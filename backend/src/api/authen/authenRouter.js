const { Router } = require('express')
const authenController = require('./authenController.js')
const { check } = require('express-validator')
const route = Router()

route.post(
	'/on_login',
	[
		check('username').isString().withMessage('username not found in body'),
		check('password').isString().withMessage('password not found in body'),
	],
	authenController.onLogin
)

route.post('/check_authen', authenController.checkAuthen)

route.get('/profile', authenController.getProfile)

route.post(
	'/onregister',
	[
		check('no').isString().withMessage('no not found in body'),
		check('title').isString().withMessage('title not found in body'),
		check('name').isString().withMessage('name not found in body'),
		check('class').isString().withMessage('class not found in body'),
	],
	authenController.onregister
)

route.post(
	'/create_user',
	[
		check('name').isString().withMessage('name not found in body'),
		check('username').isString().withMessage('class not found in body'),
		check('password').isString().withMessage('class not found in body'),
	],
	authenController.createUser
)

route.post(
	'/update_user',
	[
		check('name').isString().withMessage('name not found in body'),
		check('username').isString().withMessage('class not found in body'),
		check('password').isString().withMessage('class not found in body'),
	],
	authenController.updateUser
)

route.post(
	'/chang_status_user',
	authenController.changStatusUser
)

route.get('/get_dashboard', authenController.getDashboard)

module.exports = route
