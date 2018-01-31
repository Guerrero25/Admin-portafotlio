class Login extends React.Component {
    constructor (props) {
        super(props)

        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleSubmit (username, password) {
        const { onLogin, onError } = this.props
        $.post('/api/v1/authenticate', { username: username, password: password })
        .done(function (data) {
            if (data.auth_token) {
                onLogin(data.auth_token)
            }
        })
        .fail(function (error) {
            onError(error.responseJSON)
        })
    }

    render () {
        let errors = this.props.errors.map(error => {
            return (
                <li key={error} >{error.error}</li>
            )
        })

        return (
            <div className="content card-white">
                <Options />

                <div className="frame-form">
                    {errors ? <ul>{errors}</ul> : ''}
                    <LoginForm 
                        onSubmit={this.handleSubmit} />
                </div>
            </div>
        )
    }
}