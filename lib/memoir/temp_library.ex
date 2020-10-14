defmodule Temporary.Library do
  def list_speeches() do
    Speech.list()
    |> Enum.map(&Speech.text/1)
  end
  
  def get_speech(id) do
    %{
      text: Speech.text(id), 
      steps: 3
    }
    
  end
  
  def first_speech, do: hd(Speech.list())

  def next_speech(target) do
    find_next_speech(Speech.list(), target)
  end
  
  def previous_speech(target) do
    Speech.list()
    |> Enum.reverse
    |> find_next_speech(target)
  end
  
  defp find_next_speech(speeches, target) do
    speeches 
    |> Enum.drop_while(fn x -> x != target end) 
    |> tl 
    |> List.first
    |> Kernel.||(List.first(speeches))
  end
end