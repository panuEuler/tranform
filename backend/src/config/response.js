exports.success = (res, message, result, code) =>
	res.status(code || 200).json({ success: true, message, result })

exports.failed = (res, message, path, error, code) => {
	return res.status(code || 400).json({ success: false, message })
}