version = $(shell git describe --always --tags)

# common tasks
obtain_image_url:
	@ echo gcr.io/airasia-checkin-${env}/adhoc-payment-fe

obtain_image_version:
	@ echo ${version}
# end - common tasks

# docker image build tasks
build:
	@ echo "Building docker image: ${image_url}:${version}"
	@ docker build --build-arg ENV="${env}" -t "${image_url}":"${version}" .
# end - docker image build tasks

# docker publish image tasks
publish: build
	@ echo "Publishing image: ${image_url}"
	@ docker push ${image_url}:${version}
	@ echo "Done publishing"
# end - docker publish image tasks

# configuration tasks
# should only be invoked by ci-cd pipeline
configure_docker:
	@ gcloud auth activate-service-account --key-file ${GOOGLE_APPLICATION_CREDENTIALS}
	@ gcloud auth configure-docker gcr.io --quiet

configure_k8s:
	@ gcloud container clusters get-credentials ${cluster} --region ${region} --project ${project}
	@ kubectl config set-context --current --namespace=${namespace}
# end - configuration tasks

# k8s deployment tasks
install:
	@ echo "Deploying image into k8s: ${image_url}:${version}"
	@ cd k8s/overlays/${overlay} && \
		kustomize edit set image IMAGE_PLACEHOLDER=${image_url}:${version} && \
		kustomize build ./  | \
		kubectl apply -f -
