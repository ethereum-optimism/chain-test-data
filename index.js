const {getToken} = require('github-app-installation-token');

const appId = process.env.GITHUB_APP_ID
const privKey = process.env.GITHUB_APP_PRIVKEY.replaceAll('\\n', '\n')
const installationId = process.env.GITHUB_APP_INSTALLATION_ID

async function go() {
    const res = await getToken({
        appId: appId,
        installationId: installationId,
        privateKey: privKey,
    });``
    console.log(res.token);
}

go();
