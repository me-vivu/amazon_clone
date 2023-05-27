const jwt = require('jsonwebtoken');

const auth = async(req, res, next) =>{
    try{
        const token = req.header('auth-token');
        
        if(!token){
            return res.status(401).json({msg: "No auth token, access denied"});
        }

        const verified = jwt.verify(token, "passwordKey");
        if(!verified){
            return res.status(401)
            .json({msg: "Token Authentication failed, authorized denied."});
        }

        req.user = verified.id;
        req.token = token;
        next();

    }catch(err){

    }
}

module.exports = auth;