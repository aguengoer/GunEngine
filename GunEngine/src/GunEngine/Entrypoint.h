#pragma once
extern GunEngine::Application* GunEngine::CreateApplication();
#ifdef GE_PLATFORM_WINDOWS
int main(int argc, char** argv)
{
	GunEngine::Log::Init();
	GE_CORE_WARN("init log!");
	GE_INFO("client log");

	auto app = GunEngine::CreateApplication();
	app->Run();
	delete app;
}

#else
	#error GunEngine only supports Windows!
#endif
