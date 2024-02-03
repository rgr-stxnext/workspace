-include .make/Makefile.forces

rd:
	sudo docker rm -f nginx || true
	sudo docker run -v ./.nginx/conf.d/default.conf:/etc/nginx/conf.d/default.conf -v ./.devcontainer_user:/opt/devcontainer_user -itt --rm -p 80:80 -p 443:443 -d --name nginx nginx

test:
	curl localhost:80/files/
	curl localhost:80/files/devcontainer_user/
