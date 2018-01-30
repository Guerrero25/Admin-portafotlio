class Main extends React.Component {
    constructor (props) {
        super(props)

        this.state = {
            auth_token: ''
        }

        this.loginUpdate = this.loginUpdate.bind(this)
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

    render () {
        return (
            this.state.auth_token !== ''  ? <Admin /> : <Login onLogin={this.loginUpdate} />
        )
    }
}