class Main extends React.Component {
    constructor () {
        super();
        this.state = {
            user: {},
            auth_token: ''
        }
    }

    loginUpdate (user, auth_token) {
        this.setState({
            user,
            auth_token
        })
    }

    render () {
        return (
            this.state.auth_token !== ''  ? <Admin /> : <Login loginUpdate={this.loginUpdate} />
        )
    }
}