class Admin extends React.Component {
    constructor (props) {
        super(props)

        this.state = {
            auth_token: '',
            user: {}
        }

        this.setState = this.setState.bind(this)
    }

    componentDidMount () {
        const { setState } = this , { auth_token, onError } = this.props
        let user = {}

        $.ajax({
            url: '/api/v1/users/information',
            type: 'GET',
            headers: { 'Authorization': auth_token }
        }).done(function (response) {
            user = response.user

            setState({
                auth_token: auth_token,
                user
            })
        }).fail(function (error) {
            onError(error.responseJSON)
        })
    }

    render () {
        return (
            <h1>Este es Admin: {this.state.user.fullname} </h1>
        )
    }
}