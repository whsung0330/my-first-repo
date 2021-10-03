const fs = require('fs');
const path = require('path');
const util = require('util');

const readDir = util.promisify(fs.readdir);
const prStat = util.promisify(fs.stat);

const getJS = async (dir) => {
    try{
        const files = await readDir(dir);
        files.forEach( async file => {
            const pathName = path.join(dir, file);
            const stat = await prStat(pathName);
            if(stat.isDirectory()) getJS(pathName);
            if(path.extname(file) == ".js") console.log(pathName);
        });
    }
    catch (err){
        console.error(err);
    }
}

getJS("test");