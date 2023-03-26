# codegen: do not edit
defmodule GenLSP.Structures.ImplementationClientCapabilities do
  @moduledoc """
  @since 3.6.0
  """

  import Schematic, warn: false

  use TypedStruct

  @doc """
  ## Fields

  * dynamic_registration: Whether implementation supports dynamic registration. If this is set to `true`
    the client supports the new `ImplementationRegistrationOptions` return value
    for the corresponding server capability as well.
  * link_support: The client supports additional metadata in the form of definition links.

    @since 3.14.0
  """
  @derive Jason.Encoder
  typedstruct do
    field :dynamic_registration, boolean()
    field :link_support, boolean()
  end

  @doc false
  @spec schematic() :: Schematic.t()
  def schematic() do
    schema(__MODULE__, %{
      {"dynamicRegistration", :dynamic_registration} => oneof([null(), bool()]),
      {"linkSupport", :link_support} => oneof([null(), bool()])
    })
  end
end