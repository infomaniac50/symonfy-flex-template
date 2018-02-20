# Symfony v3.4 Flex Template

A template for Symfony 3.4 + Flex including FOSUserBundle and NelmioSecurityBundle.

These tools are installed globally:
- Composer
- GNU Make (Not a hard requirement but it makes life easier)
- Yarn - Used with Symfony Encore dev-server (https://yarnpkg.com/)
- docker (Only required if you need the User entity)
- docker-compose (Only required if you need the User entity)

*QuickStart*:
```bash
cp www/.env.dist www/.env
make
bin/dev-server.sh
```
