defmodule Raw do
  use GenServer

  def init(_) do
    {:ok, %{}}
  end

  def connect_addr(address, port) do
    {address, port}
  end

  def on_connect(socket) do
    :inet.setopts(socket, [{:active, true}, :binary])
    socket
  end

  def on_close(_socket, state) do
    state
  end

  def proc_packet(_side, p, s) do
    {:send, p, s}
  end
end
