# seeder
A Raspberry Pi DAT seeder (early-development stage).

![seeder ui](image.png)

It's just a seeder, without HTTP mirroring or anything special, yet.

## installation
```
$ curl -o- https://raw.githubusercontent.com/new-computers/seeder/master/install.sh | bash
```
It'll install everything you need.

## usage
The installation script should add a service to ```systemd```: a web server running on port 80 that's the frontend for the seeder and that also handles and seeds the archives.

Navigate to the Pi's address (in my case it's ```seeder.local```) and manage your sources.

After you remove a source it'll still seed it until you restart the Pi or the service.

## development

Clone the repo, then:
```
npm install
npm run build
npm start dev
```
