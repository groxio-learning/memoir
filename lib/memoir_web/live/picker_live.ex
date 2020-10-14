defmodule MemoirWeb.PickerLive do
  use MemoirWeb, :live_view
  alias Memoir.Eraser
  alias Temporary.Library

  def mount(_params, _session, socket) do
    {
      :ok, 
      assign(
        socket, 
        speeches: Library.list_speeches(), 
        chosen_speech: Library.first_speech(), 
      )
      |> set_speech
    }
  end
  
  def render(assigns) do
    ~L"""
    <h1>Erase your Brain!</h1>
    <button phx-click="previous">&larr;left</button> 
      <%= @chosen_speech %>
    <button phx-click="next">right&rarr;</button>
    <pre>
    <%= @speech.text %>
    </pre>
    <button phx-click="choose">Choose</button>
    """
  end
  
  defp set_speech(socket) do
    assign(
      socket, 
      speech: Library.get_speech(socket.assigns.chosen_speech)
    )
  end
  
  defp next(socket) do
    assign(
      socket, 
      chosen_speech: Library.next_speech(socket.assigns.chosen_speech)
    )
    |> set_speech
  end
  
  defp previous(socket) do
    assign(
      socket, 
      chosen_speech: Library.previous_speech(socket.assigns.chosen_speech)
    )
    |> set_speech
  end
  
  def handle_event("next", _meta, socket) do
    {:noreply, next(socket)}
  end 

  def handle_event("previous", _meta, socket) do
    {:noreply, previous(socket)}
  end 
  
  def handle_event("choose", _meta, socket) do
    {
      :noreply, 
      push_redirect(
        socket, 
        to: "/game/#{socket.assigns.chosen_speech}"
      )
    }
  end
  
end