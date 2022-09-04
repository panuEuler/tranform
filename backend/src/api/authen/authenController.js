const authenModel = require('./authenModel.js')
const { success, failed } = require('../../config/response')
const tokenManager = require('../../token/token_manager')
const hasher = require('wordpress-hash-node')
const moment = require('moment')
const _ = require('lodash')

class authenController {
	async onLogin(req, res) {
		const { username, password } = req.body
		console.log(username, password)
		const user = JSON.parse(JSON.stringify(await authenModel.getProfile()))
		const userLoginData = user.find((e) => {
			return e.username === username
		})
		if (userLoginData) {
			const isCorrect = hasher.CheckPassword(password, userLoginData.password)
			if (isCorrect) {
				let accessToken = tokenManager.getGenerateAccessToken({
					id: userLoginData.id,
				})
				const params = {
					...userLoginData,
					activeDate: moment().format('YYYY-MM-DD HH:mm:ss'),
				}
				await authenModel.updateUser(params)
				res.send(JSON.stringify({ status: '1', access_token: accessToken }))
			} else {
				res.send(JSON.stringify({ status: '0' }))
			}
		} else {
			res.send(JSON.stringify({ status: '0' }))
		}
	}

	async checkAuthen(req, res) {
		let jwtStatus = tokenManager.checkAuthentication(req)
		if (jwtStatus !== false) {
			res.send(jwtStatus)
		} else {
			res.send(false)
		}
	}

	async getProfile(req, res) {
		try {
			const query = await authenModel.getProfile()
			success(res, 'ดึงข้อมูลสำเร็จ', query)
		} catch (error) {
			console.log(error)
			failed(res, 'ดึงข้อมูลไม่สำเร็จ')
		}
	}

	async onregister(req, res) {
		try {
			const params = {
				...req.body,
				date: moment().format('YYYY-MM-DD HH:mm:ss'),
			}
			const query = await authenModel.onregister(params)
			success(res, 'ดึงข้อมูลสำเร็จ', query)
		} catch (error) {
			console.log(error)
			failed(res, 'ดึงข้อมูลไม่สำเร็จ')
		}
	}

	async createUser(req, res) {
		try {
			const { username, password } = req.body
			const params = {
				...req.body,
				activeDate: moment().format('YYYY-MM-DD HH:mm:ss'),
			}

			const user = await authenModel.getProfile()
			const userLoginData = user.find((e) => {
				return e.username === username
			})

			if (userLoginData) {
				success(res, 'มีผู้ใช้งาน username นี้แล้ว')
			} else {
				// hashPass
				const user_hash_pass = hasher.HashPassword(password)
				params.password = user_hash_pass
				const query = await authenModel.createUser(params)
				success(res, 'ดึงข้อมูลสำเร็จ', query)
			}
		} catch (error) {
			console.log(error)
			failed(res, 'ดึงข้อมูลไม่สำเร็จ')
		}
	}

	async updateUser(req, res) {
		try {
			const { username, password } = req.body
			const params = {
				...req.body,
			}

			let user = await authenModel.getProfile()
			user = await user.filter((e) => e.username !== username)
			const userLoginData = user.find((e) => {
				return e.username === username
			})

			if (userLoginData) {
				success(res, 'มีผู้ใช้งาน username นี้แล้ว')
			} else {
				// hashPass
				const user_hash_pass = hasher.HashPassword(password)
				params.password = user_hash_pass
				const query = await authenModel.updateUser(params)
				success(res, 'ดึงข้อมูลสำเร็จ', query)
			}
		} catch (error) {
			console.log(error)
			failed(res, 'ดึงข้อมูลไม่สำเร็จ')
		}
	}

	async changStatusUser(req, res) {
		try {
			const params = {
				...req.body,
				status: 'InActive',
			}

			const query = await authenModel.updateUser(params)
			success(res, 'ดึงข้อมูลสำเร็จ', query)
		} catch (error) {
			console.log(error)
			failed(res, 'ดึงข้อมูลไม่สำเร็จ')
		}
	}

	async getDashboard(req, res) {
		try {
			const { startDate, endDate } = req.query
			const query = {
				detailY: [0, 0, 0, 0, 0, 0],
				bodyTable: [],
				userRegis: 0,
				allStd: 0,
			}
			const currstart = moment(startDate).format('YYYY-DD-MM')
			const currend = moment(endDate).format('YYYY-DD-MM')
			let startDates = moment(`${currstart} 00:00:00`).format(
				'YYYY-MM-DD HH:mm:ss'
			)
			const endDates = moment(
				`${currend} 23:59:59`
			).format('YYYY-MM-DD HH:mm:ss')

			console.log(startDates, endDates);
			// dashboard
			const q1 = await authenModel.getDetailY(startDates, endDates)
			const result = JSON.parse(JSON.stringify(q1))
			const group_data = _.groupBy(result, 'class')
			for (const obj in group_data) {
				if (obj === 'ชั้นมัธยมศึกษาปีที่ 1') {
					query.detailY[0] = group_data[obj].length
				} else if (obj === 'ชั้นมัธยมศึกษาปีที่ 2') {
					query.detailY[1] = group_data[obj].length
				} else if (obj === 'ชั้นมัธยมศึกษาปีที่ 3') {
					query.detailY[2] = group_data[obj].length
				} else if (obj === 'ชั้นมัธยมศึกษาปีที่ 4') {
					query.detailY[3] = group_data[obj].length
				} else if (obj === 'ชั้นมัธยมศึกษาปีที่ 5') {
					query.detailY[4] = group_data[obj].length
				} else if (obj === 'ชั้นมัธยมศึกษาปีที่ 6') {
					query.detailY[5] = group_data[obj].length
				}
			}

			// getBody
			const q2 = await authenModel.getBodyTable(startDates, endDates)
			const all_std = await authenModel.getAllStudent()
			const result2 = JSON.parse(JSON.stringify(q2[0]))
			if (result2.length > 0) {
				query.bodyTable = result2
				query.userRegis = result2.length
				query.allStd = all_std.count 
			}

			console.log(query);
			success(res, 'ดึงข้อมูลสำเร็จ', query)
		} catch (error) {
			console.log(error)
			failed(res, 'ดึงข้อมูลไม่สำเร็จ')
		}
	}

	async updateAllStudent(req, res) {
		try {
			await authenModel.updateAllStudent(req.body)
			success(res, 'ดึงข้อมูลสำเร็จ')
		} catch (error) {
			console.log(error)
			failed(res, 'ดึงข้อมูลไม่สำเร็จ')
		}
	}
}

module.exports = new authenController()
