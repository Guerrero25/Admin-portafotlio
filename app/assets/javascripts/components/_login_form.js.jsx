class LoginForm extends React.Component {
    render () {
        return (
            <div className="login-option-form">
                <div className="form-group">
                    <label htmlFor="username">Username:</label>
                    <input className="form-control" type="text" name="username" id="username" />
                </div>
                <div className="form-group">
                    <label htmlFor="password">Password:</label>
                    <input className="form-control" type="password" name="password" id="password"/>
                </div>
                <div className="form-group">
                    <button className="form-submit" >LOGIN</button>
                </div>
            </div>
        )
    }
}