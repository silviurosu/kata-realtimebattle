.PHONY: docker-build docker-run logwatch start test-protocol


start:
	make docker-build docker-run

docker-build:
	sudo docker build -t hhex-rtb .

docker-run:
	sudo docker run -ti --rm -e DISPLAY=${DISPLAY} -v /tmp/.X11-unix:/tmp/.X11-unix -v `pwd`:/home/developer/bot  hhex-rtb

logwatch:
	tail -f bot.log

test-protocol:
	./elixir.robot < priv/messages-to-robot.txt
