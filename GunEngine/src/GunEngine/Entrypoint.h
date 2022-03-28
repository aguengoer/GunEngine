#pragma once
extern GunEngine::Application* GunEngine::CreateApplication();
#ifdef GE_PLATFORM_WINDOWS
int main(int argc, char** argv)
{
	printf("GunEngine started....\n");
	auto app = GunEngine::CreateApplication();
	app->Run();
	delete app;
}

#else
	#error GunEngine only supports Windows!
#endif
