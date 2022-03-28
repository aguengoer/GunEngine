#include <GunEngine.h>

class Sandbox : public GunEngine::Application {
public:
	Sandbox() {

	}

	~Sandbox() {

	}
};

GunEngine::Application* GunEngine::CreateApplication() {
	return new Sandbox();
}