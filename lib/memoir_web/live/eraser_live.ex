defmodule MemoirWeb.EraserLive do
  use MemoirWeb, :live_view
  alias Memoir.Eraser

  def mount(_params, _session, socket) do
    {
      :ok, 
      assign(
        socket, 
        eraser: Eraser.new(Speech.hamlet(), 3), 
        message: ""
      )
    }
  end
  
  def render(assigns) do
    ~L"""
    <h1>Memoir it!!!</h1>
    <h2>Memorize this:</h2>
    <p><%= @message %></p>
    <pre>
    <%= @eraser.text %>
    </pre>
    <button phx-click="memorize">Memorize...</button>
    <pre>
      <%= inspect @eraser %>
    </pre>
    """
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