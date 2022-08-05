const { groupBy } = require('lodash')
const { knex_front } = require('../../knex')

class authenModel {
	constructor() {
		this.tableuser = `user`
		this.tableStdReg = `stadent_register`
	}

	getProfile() {
		return knex_front(this.tableuser).select('*').where({ status: null })
	}

	onregister(obj) {
		return knex_front(this.tableStdReg).insert(obj)
	}

	createUser(obj) {
		return knex_front(this.tableuser).insert(obj)
	}

	updateUser(obj) {
		return knex_front(this.tableuser).update(obj).where({ id: obj.id })
	}

	getDetailY(startDate, endDate) {
		return knex_front(this.tableStdReg)
			.select('*')
			.whereBetween('date', [startDate, endDate])
	}

	getBodyTable(startDate, endDate) {
		return knex_front.raw(`
      select *, count(id) as count
      from library.stadent_register
      where date between '${startDate}' and '${endDate}'
      group by no
      order by count(id) desc;
    `)
	}
}

module.exports = new authenModel()
