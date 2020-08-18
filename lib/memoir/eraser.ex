defmodule Memoir.Eraser do
  defstruct [:text, :schedule]
  
  def new(text, steps) do
    %__MODULE__{text: text, schedule: build_schedule(text, steps)}
  end
  
  defp build_schedule(text, steps) do
    size = String.length(text)
    
    (1..size)
    |> Enum.shuffle
    |> Enum.chunk_every(step_size(size, steps))
  end
  
  defp step_size(size, steps) do
    size
    |> Kernel./(steps)
    |> ceil
  end
  
  def erase(%{text: text, schedule: [step|schedule]}=eraser) do
    erased_text = 
      text
      |> String.graphemes
      |> Enum.with_index(1)
      |> Enum.map(fn {char, index} -> 
        maybe_erase(char, (index in step)) 
      end)
      |> Enum.join
    
    %{eraser | text: erased_text, schedule: schedule}
  end
  
  defp maybe_erase(_char, true=_should_replace), do: "_"
  defp maybe_erase(char, false=_should_replace), do: char
end


# constructor(steps, passage)
# |> erase
# |> erase


# schedule: [[5, 3, 12, 10], [5, 3, 12, 10], [5, 3, 12, 10]]