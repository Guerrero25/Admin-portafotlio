class LoginForm extends React.Component {
    constructor (props) {
        super(props)

        this.state = {
            username: '',
            password: ''
        }

        this.handleUsername = this.handleUsername.bind(this)
        this.handlePassword = this.handlePassword.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleUsername (e) {
        let username = e.target.value

        this.setState({
            username
        })
    }

    handlePassword (e) {
        let password = e.target.value

        this.setState({
            password
        })
    }

    handleSubmit () {
        let username = this.state.username, password = this.state.password
        
        if (username !== '' && password !== '') {
            this.props.onSubmit(username, password)
        }
    }

    render () {
        return (
            <div className="login-option-form">
                <div className="form-group">
                    <label htmlFor="username">Username:</label>
                    <input 
                        className="form-control" 
                        type="text" 
                        name="username" 
                        id="username"
                        onChange={this.handleUsername} />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password:</label>
                    <input
                        className="form-control"
                        type="password"
                        name="password"
                        id="password"
                        onChange={this.handlePassword} />
                </div>
                <div className="form-group">
                    <button
                        className="form-submit"
                        onClick={this.handleSubmit} >
                        LOGIN
                    </button>
                </div>
            </div>
        )
    }
}