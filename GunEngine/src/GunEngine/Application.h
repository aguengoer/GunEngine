#pragma once
#include "Core.h"

namespace GunEngine {
	class GE_ENGINE_API Application
	{
	public:
		Application();
		virtual ~Application();
		

		void Run();
	};

	//To be defined in Client
	Application* CreateApplication();
}


