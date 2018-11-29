defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do

  end

  def call(conn, _params) do #_params here is whatever is returned from the init function || must return connection from here
    user_id = get_session(conn, :user_id)
    cond do
      user = user_id && Repo.get(User, user_id) -> # STILL A DOUBT
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end
