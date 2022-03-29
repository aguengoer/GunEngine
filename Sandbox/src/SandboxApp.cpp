#include <GunEngine.h>

class ExampleLayer :public GunEngine::Layer
{
public:
	ExampleLayer() :Layer("Example")
	{
	}

	void OnUpdate() override
	{
		GE_INFO("ExampleLayer::Update");
	}

	void OnEvent(GunEngine::Event& event) override
	{
		GE_TRACE("{0}", event);
	}
};

class Sandbox : public GunEngine::Application {
public:
	Sandbox() {
		PushLayer(new ExampleLayer());
	}

	~Sandbox() {

	}
};

GunEngine::Application* GunEngine::CreateApplication() {
	return new Sandbox();
}