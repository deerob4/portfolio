defmodule Portfolio do
  @moduledoc """
  My portfolio.
  """

  @out_dir Path.join(".", "out")

  use Phoenix.Component
  import Phoenix.HTML

  use NimblePublisher,
    build: Portfolio.Project,
    from: Application.app_dir(:portfolio, "priv/projects/**/*.md"),
    as: :projects

  def layout(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Dee Roberts</title>
        <link rel="stylesheet" href="./assets/app.css" />
        <script defer type="text/javascript" src="./assets/app.js">
        </script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Kalnia:wdth,wght@109.5,524&family=Rubik:wght@300;400&display=swap"
          rel="stylesheet"
        />
      </head>
      <body>
        <div class="container">
          <.header />
          <main>
            <%= render_slot(@inner_block) %>
          </main>
        </div>
        <%= if Mix.env() === :dev do %>
          <script type="text/javascript">
            const socket = new WebSocket("ws://localhost:4000/live_reload")

            socket.onopen = () => {
              console.log("Connected to reload server")
            }

            socket.onmessage = (e) => {
              if (e.data === "reload") {
                location.reload();
              }
            }
          </script>
        <% end %>
      </body>
    </html>
    """
  end

  defp header(assigns) do
    ~H"""
    <header class="flex justify-between mb-10 items-center">
      <h1 class="text-2xl font-display">
        <a href="/" class="logo">Dee Roberts!</a>
      </h1>

      <div>
        <button>🇳🇴</button>
      </div>

      <%!-- <nav>
        <ul class="flex gap-5">
          <li><a href="/blog">Thoughts</a></li>
          <li><a href="/projects">Projects</a></li>
          <li><a href="/contact">Contact</a></li>
        </ul>
      </nav> --%>
    </header>
    """
  end

  def index(assigns) do
    ~H"""
    <.layout>
      <p>
        Hi! I'm Dee, a full-stack software developer.
      </p>

      <p>
        I love working on digital products. I take pride in ensuring that every part of a project, from the design of the UI to the code, is done with a high degree of quality and care. Often this means simplicity. Why make something complicated when it doesn't need to be?
      </p>

      <p>
        I'm originally from a <a href="https://en.wikipedia.org/wiki/Shrewsbury">smallish town</a>
        in the UK, but I've lived in Trondheim, Norway since 2019. In my spare time I enjoy baking (especially bread), reading, and learning Norwegian.
      </p>

      <p>
        I'm currently working as a consultant at <a href="https://kodeworks.no/">KodeWorks</a>.
        Before that I was an R&D engineer at <a href="https://nordicsemi.com">Nordic Semiconductor</a>,
        and before that a software developer at <a href="https://asolvi.com">Asolvi</a>. I graduated with a Bachelors degree in Computer Science from Keele University in 2019.
      </p>

      <p>
        You can see some of the projects I've worked on below, or you can read a bit more about my background.
      </p>

      <h2 class="text-xl mt-5 mb-5">Projects</h2>

      <.projects />
    </.layout>
    """
  end

  def project_page(assigns) do
    ~H"""
    <.layout>
      <h2 class="mb-5">Projects</h2>
      <.projects />
    </.layout>
    """
  end

  defp projects(assigns) do
    ~H"""
    <%= for {category, projects} <- all_projects() do %>
      <%!-- <h3 class="text-2xl mb-2"><%= category_title(category) %></h3>
        <p class="mb-5"><%= category_description(category) %></p> --%>

      <ul class="flex flex-col gap-10">
        <%= for p <- projects do %>
          <.project project={p} />
        <% end %>
      </ul>
    <% end %>
    """
  end

  defp project(assigns) do
    ~H"""
    <li class="flex gap-4 flex-col">
      <h4 class="text-lg text-black">
        <%= @project.name %>
      </h4>
      <%= raw(@project.description) %>

      <a href={"./assets/images/#{@project.image}"}>
        <img
          class="rounded-[8px] outline-1 outline-[#00000036] outline w-fit"
          src={"./assets/images/#{@project.image}"}
          alt={"#{@project.name} screenshot"}
          draggable="false"
        />
      </a>
      <div>
        <%= if @project.visit_uri do %>
          <a href={@project.visit_uri}>Visit</a>
        <% end %>

        <%= if @project.repo_uri do %>
          <a href={@project.repo_uri}>Source</a>
        <% end %>
      </div>

      <%= unless Enum.empty?(@project.technologies) do %>
        <ul class="flex gap-2">
          <%= for t <- @project.technologies do %>
            <li class="technology">
              <%= t %>
            </li>
          <% end %>
        </ul>
      <% end %>
    </li>
    """
  end

  def all_projects(), do: Enum.group_by(@projects, & &1.category)

  defp category_title("nordic"), do: "Nordic Semiconductor"
  defp category_title("personal"), do: "Personal"

  defp category_description("nordic") do
    """
    Most of these projects are not open source, but the majority can be tried and downloaded from the VS Code Marketplace.
    """
  end

  def build() do
    render_file("index.html", index(%{}))
    render_file("projects.html", project_page(%{}))
    :ok
  end

  def render_file(path, %Phoenix.LiveView.Rendered{} = rendered) do
    safe = Phoenix.HTML.Safe.to_iodata(rendered)
    output = Path.join([@out_dir, path])
    output |> Path.dirname() |> File.mkdir_p!()
    File.write!(output, safe)
  end
end
