class Main extends React.Component {
    constructor (props) {
        super(props)

        this.state = {
            auth_token: '',
            errors: []
        }

        this.loginUpdate = this.loginUpdate.bind(this)
        this.handleError = this.handleError.bind(this)
    }

    componentWillMount () {
        if (localStorage.getItem('auth_token')) {
            this.setState({
                auth_token: localStorage.auth_token
            })
        }
    }

    loginUpdate (auth_token) {
        localStorage.setItem('auth_token', auth_token)

        this.setState({
            auth_token
        })
    }

    handleError (error) {
        this.setState(prevState => ({
            errors: prevState.errors.concat(error),
            auth_token: ''
        }))
    }

    render () {
        return (
            this.state.auth_token != ''  ? <Admin auth_token={this.state.auth_token} onError={this.handleError} /> : <Login errors={this.state.errors} onLogin={this.loginUpdate} onError={this.handleError} />
        )
    }
}