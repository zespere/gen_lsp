# codegen: do not edit
defmodule GenLSP.Structures.InlineValueRegistrationOptions do
  @moduledoc """
  Inline value options used during static or dynamic registration.

  @since 3.17.0
  """

  import Schematic, warn: false

  use TypedStruct

  @doc """
  ## Fields

  * id: The id used to register the request. The id can be used to deregister
    the request again. See also Registration#id.
  * document_selector: A document selector to identify the scope of the registration. If set to null
    the document selector provided on the client side will be used.
  """
  @derive Jason.Encoder
  typedstruct do
    field :id, String.t()
    field :document_selector, GenLSP.TypeAlias.DocumentSelector.t() | nil, enforce: true
  end

  @doc false
  @spec schematic() :: Schematic.t()
  def schematic() do
    schema(__MODULE__, %{
      optional({"id", :id}) => str(),
      {"documentSelector", :document_selector} =>
        oneof([GenLSP.TypeAlias.DocumentSelector.schematic(), null()])
    })
  end
end
