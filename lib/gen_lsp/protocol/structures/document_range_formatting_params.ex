# codegen: do not edit
defmodule GenLSP.Structures.DocumentRangeFormattingParams do
  @moduledoc """
  The parameters of a {@link DocumentRangeFormattingRequest}.
  """

  import Schematic, warn: false

  use TypedStruct

  @doc """
  ## Fields

  * text_document: The document to format.
  * range: The range to format
  * options: The format options
  * work_done_token: An optional token that a server can use to report work done progress.
  """
  @derive Jason.Encoder
  typedstruct do
    field :text_document, GenLSP.Structures.TextDocumentIdentifier.t(), enforce: true
    field :range, GenLSP.Structures.Range.t(), enforce: true
    field :options, GenLSP.Structures.FormattingOptions.t(), enforce: true
    field :work_done_token, GenLSP.TypeAlias.ProgressToken.t()
  end

  @doc false
  @spec schematic() :: Schematic.t()
  def schematic() do
    schema(__MODULE__, %{
      {"textDocument", :text_document} => GenLSP.Structures.TextDocumentIdentifier.schematic(),
      {"range", :range} => GenLSP.Structures.Range.schematic(),
      {"options", :options} => GenLSP.Structures.FormattingOptions.schematic(),
      {"workDoneToken", :work_done_token} =>
        oneof([null(), GenLSP.TypeAlias.ProgressToken.schematic()])
    })
  end
end