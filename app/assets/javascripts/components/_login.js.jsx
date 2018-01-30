class Login extends React.Component {
    constructor (props) {
        super(props)

        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleSubmit (username, password) {
        const { onLogin } = this.props
        $.post('/api/v1/authenticate', { username: username, password: password })
        .done(function (data) {
            if (data.auth_token) {
                onLogin(data.auth_token)
            }
        })
        .fail(function () {
            console.log('Username or Password are incorrect')
        })
    }

    render () {
        return (
            <div className="content card-white">
                <Options />

                <div className="frame-form">
                    <LoginForm 
                        onSubmit={this.handleSubmit} />
                </div>
            </div>
        )
    }
}