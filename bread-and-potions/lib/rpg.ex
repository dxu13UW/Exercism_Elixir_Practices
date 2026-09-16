defmodule RPG do
  @moduledoc """
  Exercism exercise - RPG
  """

  defmodule Character do
    @moduledoc """
    Represents an RPG character with health and mana pools
    """
    defstruct health: 100, mana: 0
  end

  defmodule EmptyBottle do
    @moduledoc """
    By-product left behind after drinking liquid consumables
    """
    defstruct []
  end

  defprotocol Edible do
    @doc """
    Consumes the item, returning `{by_product, updated_character}`
    """
    def eat(item, character)
  end

  defmodule LoafOfBread do
    @moduledoc """
    A basic food item that restores 5 health and leaves no by-product
    """
    defstruct []

    defimpl RPG.Edible do
      def eat(_bread, %RPG.Character{} = character) do
        {nil, %{character | health: character.health + 5}}
      end
    end
  end

  defmodule ManaPotion do
    @moduledoc """
    A magical potion that restores mana based on strength and leaves an empty bottle 
    """
    defstruct strength: 10

    defimpl Edible do
      def eat(%RPG.ManaPotion{strength: strength}, %RPG.Character{} = character) do
        {%RPG.EmptyBottle{},
         %{
           character
           | mana: character.mana + strength
         }}
      end
    end
  end

  defmodule Poison do
    @moduledoc """
    A lethal substance that depletes character health to 0 and leaves an empty bottle
    """
    defstruct []

    defimpl Edible do
      def eat(_poison, %RPG.Character{} = character) do
        {%RPG.EmptyBottle{}, %{character | health: 0}}
      end
    end
  end
end
