const { config_front } = require('./knexfile')
const env = 'development'

const knex_front = require('knex')(config_front[env])

const testConnect = async () => {
	try {
    console.log("connect");
	} catch (error) {
    console.log(error);
	}
}

testConnect()

module.exports = {
	knex_front,
}
