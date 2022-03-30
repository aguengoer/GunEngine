#pragma once

#include "GunEngine/Layer.h"
#include "GunEngine/Layer.h"

namespace GunEngine {

	class GE_ENGINE_API ImGuiLayer : public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();

		void OnAttach();
		void OnDetach();
		void OnUpdate();
		void OnEvent(Event& e);
	private:
		float m_Time = 0.0f;
	};
}