require('dotenv').config()

exports.config_front = {
	development: {
		client: 'mysql', // type database
		useNullAsDefault: true,
		connection: {
			host: process.env.HOST,
			user: process.env.USERNAME_FRONT,
			password: process.env.PASSWORD_FRONT,
			database: process.env.DATABASE_FRONT,
			connectTimeout: 60000,
		},
		pool: {
			min: 2,
			max: 10,
		},
	},
}
