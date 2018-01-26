class Options extends React.Component {
    render () {
        return (
            <div className="log-options">
                <div 
                    id="login-option" 
                    className="log-option active">
                    <span>Login</span>
                </div>
                <div 
                    id="signup-option" 
                    className="log-option">
                    <span>Sign Up</span>
                </div>
            </div>
        )
    }
}