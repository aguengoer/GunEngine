#pragma once
#include "Core.h"
#include "Events/Event.h"
#include "GunEngine/Events/ApplicationEvent.h"
#include "Window.h"
#include "GunEngine/Layer.h"
#include <GunEngine/LayerStack.h>

namespace GunEngine {
	class GE_ENGINE_API Application
	{
	public:
		Application();
		virtual ~Application();
		

		void Run();

		void OnEvent(Event& e);
		void PushLayer(Layer* layer);
		void PushOverlay(Layer* overlay);

	private:
		bool OnWindowClose(WindowCloseEvent& e);
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;

		LayerStack m_LayerStack;

	};

	//To be defined in Client
	Application* CreateApplication();
}


