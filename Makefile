
CONTAINER_USER="$(shell id -u):$(shell id -g)"

IMAGE="klakegg/hugo:0.93.2-ext-alpine"

CONTAINER_NAME="corentin.wdes.fr"
PROJECT_NAME="corentin.wdes.fr"

version:
	docker run --name ${CONTAINER_NAME} --rm -it ${IMAGE} --version

init:
	docker run --name ${CONTAINER_NAME} --rm -it --user ${CONTAINER_USER} -v ${PWD}:/app --workdir /app ${IMAGE} new site ${PROJECT_NAME}

build:
	docker run --name ${CONTAINER_NAME} --rm --user ${CONTAINER_USER} -v ${PWD}:/app --workdir /app/${PROJECT_NAME} ${IMAGE} build

serve:
	docker run --name ${CONTAINER_NAME} --rm --user ${CONTAINER_USER} -v ${PWD}:/app --workdir /app/${PROJECT_NAME} -p 8111:8111 ${IMAGE} serve --bind 0.0.0.0 --port 8111 --baseURL localhost

date:
	date +'%Y-%m-%dT%H:%M:%SZ' --utc
