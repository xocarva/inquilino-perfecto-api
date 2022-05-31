const transporter = require('./transporter')
const { SENDER_EMAIL, FRONTEND_URL } = process.env

const sendActivationCode = async (user) => {
    const { email, activationCode } = user
    await transporter.sendMail({
        from: `${SENDER_EMAIL} <${SENDER_EMAIL}>`,
        to: email,
        subject: "Inquilino Perfecto - Activa tu usuario",
        html: `<p>Click <a href="${FRONTEND_URL}/activate/${activationCode}">aquí</a> para activar tu usuario.</p>`
    })
  }

module.exports = sendActivationCode

