# codegen: do not edit
defmodule GenLSP.Requests.WorkspaceDiagnostic do
  @moduledoc """
  The workspace diagnostic request definition.

  @since 3.17.0
  """

  import Schematic, warn: false

  use TypedStruct

  @derive Jason.Encoder
  typedstruct do
    field :method, String.t(), default: "workspace/diagnostic"
    field :jsonrpc, String.t(), default: "2.0"
    field :id, integer(), enforce: true
    field :params, GenLSP.Structures.WorkspaceDiagnosticParams.t()
  end

  @doc false
  @spec schematic() :: Schematic.t()
  def schematic() do
    schema(__MODULE__, %{
      method: str("workspace/diagnostic"),
      jsonrpc: str("2.0"),
      id: int(),
      params: GenLSP.Structures.WorkspaceDiagnosticParams.schematic()
    })
  end
end