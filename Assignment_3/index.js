
const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true}))

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');


//3.1
app.get('/', (req, res) => {
    obj = req.query;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.post('/', (req, res) => {
    obj = req.body;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.put('/', (req, res) => {
    obj = req.body;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.delete('/', (req, res) => {
    obj = req.body;
    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

//3.2
app.get('/board/page/:page', (req, res) => {
    console.log(req.params.page);
    res.send(`This is page #${req.params.page}`);
});

//3.3
app.get('/factorial', (req,res) =>{
    n = req.query.number;
    res.redirect(`/factorial/${n}`);
});

app.get('/factorial/:number', (req,res) => {
    n = req.params.number;
    for(let i = n-1; i > 1; i-- ){
        n *= i;
    }
    res.send(`factorial: ${n}`);
});

//3.4
app.get('/3.4', (req,res) =>{
    res.render('index.pug');
})
app.post('/login', (req, res)=> {
    username = req.body.username;
    password = req.body.password;

    res.send(`username: ${username}\npassword: ${password}`);
});



app.listen(port, () => console.log(`Server listening on port ${port}!`));