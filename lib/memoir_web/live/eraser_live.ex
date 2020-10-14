defmodule MemoirWeb.EraserLive do
  use MemoirWeb, :live_view
  alias Memoir.Eraser
  alias Temporary.Library

  def mount(%{"speech" => speech_name}, _session, socket) do
    speech = Library.get_speech(String.to_existing_atom(speech_name))
    {
      :ok, 
      assign(
        socket, 
        eraser: Eraser.new(speech.text, speech.steps), 
        message: ""
      )
    }
  end
  
  defp set_message(socket) do
    assign(socket, message: "We've erased some! Now memorize again")
  end
  
  defp erase(socket) do
    assign(socket, eraser: Eraser.erase(socket.assigns.eraser))
  end
  
  def handle_event("memorize", %{"value" => ""}, socket) do
    {:noreply, socket |> set_message |> erase}
  end
  
  
end