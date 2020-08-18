defmodule Speech do
  def text(:hamlet) do
    """
    To be or not to be,
    that is the question.
    """
  end

  def text(:picard) do
    """
    Darmok and Jalad at Tanagra.
    Shaka, when the walls fell.
    """
  end

  def text(:logue) do
    """
    Come to the edge.
    We might fall.
    Come to the edge.
    It’s too high!
    COME TO THE EDGE!
    And they came,
    And he pushed,
    And they flew.
    """
  end

  def text(:shikibu) do
    """
    Although the wind
    blows terribly here,
    the moonlight also leaks
    between the roof planks
    of this ruined house.
    """
end

def text(:preamble) do
    """
    We the People of the United States, in Order to form a more perfect Union,
    establish Justice, insure domestic Tranquility, provide for the common
    defense, promote the general Welfare, and secure the Blessings of Liberty
    to ourselves and our Posterity, do ordain and establish this Constitution
    for the United States of America.
    """
  end
end
