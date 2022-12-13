defmodule VisualPrompts.Repo do
  use Ecto.Repo,
    otp_app: :visual_prompts,
    adapter: Ecto.Adapters.Postgres
end
