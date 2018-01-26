class Login extends React.Component {
    constructor (props) {
        super(props)
        this.state = {
            
        }
    }

    render () {
        return (
            <div className="content card-white">
                <Options />

                <div className="frame-form">
                    <LoginForm />
                </div>
            </div>
        )
    }
}