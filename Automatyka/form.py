import dash
from dash import dcc, html
import dash_bootstrap_components as dbc
from dash.dependencies import Input, Output, State
import json
import math
import os
import plotly.graph_objects as go
import numpy as np

app = dash.Dash(__name__, external_stylesheets=[dbc.themes.BOOTSTRAP])

# Layout aplikacji
app.layout = html.Div(
    [
        dbc.Container(
            fluid=True,
            children=[
                # Wyświetlanie wykresów w jednym wierszu (pełna szerokość)
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Graph(id="velocity_plot"),
                            width=6,  # 50% szerokości
                            className="mb-4",
                        ),
                        dbc.Col(
                            dcc.Graph(id="force_plot"),
                            width=6,  # 50% szerokości
                            className="mb-4",
                        ),
                    ]
                ),
                # Sekcja suwaki i listy rozwijane
                # Prędkość początkowa
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Prędkość początkowa:** $v_0 \; [\text{m/s}]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="v0_slider",
                                min=0,
                                max=100,
                                step=1,
                                value=50,
                                marks={i: f"{i}" for i in range(0, 101, 20)},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Prędkość docelowa
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Prędkość docelowa:** $v \; [\text{m/s}]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="v_slider",
                                min=0,
                                max=100,
                                step=1,
                                value=50,
                                marks={i: f"{i}" for i in range(0, 101, 20)},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Kąt nachylenia drogi
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Kąt nachylenia drogi:** $\theta \; [^\circ]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="angle_slider",
                                min=0,
                                max=35,
                                step=1,
                                value=0,
                                marks={i: f"{i}" for i in range(0, 36, 5)},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Powierzchnia czołowa pojazdu
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Powierzchnia czołowa pojazdu:** $A \; [\text{m}^2]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="area_slider",
                                min=1,
                                max=6,
                                step=0.1,
                                value=2.5,
                                marks={i: f"{i:.1f}" for i in np.arange(1, 6, 1)},
                            ),
                            width=8,
                        ),
                    ],
                    className="mb-4",
                ),
                # Współczynnik oporu aerodynamicznego
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Współczynnik oporu aerodynamicznego:** $C_d$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="drag_slider",
                                min=0.1,
                                max=1.0,
                                step=0.05,
                                value=0.2,
                                marks={i: f"{i:.2f}" for i in np.arange(0.1, 1.01, 0.2)},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Masa pojazdu
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Masa pojazdu:** $M \; [\text{kg}]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Dropdown(
                                id="mass_dropdown",
                                options=[{"label": f"{i} kg", "value": i} for i in range(500, 3001, 500)],
                                value=1500,
                                style={"width": "100%"},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Masa pasażerów
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Masa pasażerów:** $m \; [\text{kg}]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Dropdown(
                                id="passenger_mass_dropdown",
                                options=[{"label": f"{i} kg", "value": i} for i in range(0, 501, 100)],
                                value=200,
                                style={"width": "100%"},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Parametry kontrolera PID
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Wzmocnienie kontrolera:** $k_p$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="kp_slider",
                                min=0.1,
                                max=5.0,
                                step=0.1,
                                value=0.5,
                                marks={i: f"{i:.1f}" for i in np.arange(0.1, 5.1, 1)},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Czas całkowania
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Czas całkowania:** $t_i \; [\text{s}]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="ti_slider",
                                min=0.1,
                                max=20.0,
                                step=0.1,
                                value=6.0,
                                marks={i: f"{i:.1f}" for i in range(0, 21, 5)},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                # Czas różniczkowania
                dbc.Row(
                    [
                        dbc.Col(
                            dcc.Markdown(r"**Czas różniczkowania:** $t_d \; [\text{s}]$", mathjax=True),
                            width=3,
                        ),
                        dbc.Col(
                            dcc.Slider(
                                id="td_slider",
                                min=0.01,
                                max=2.0,
                                step=0.01,
                                value=0.1,
                                marks={i: f"{i:.2f}" for i in np.arange(0.01, 2.01, 0.5)},
                            ),
                            width=9,
                        ),
                    ],
                    className="mb-4",
                ),
                dbc.Row(
                    [
                        dbc.Col(
                            dbc.Button(
                                "Wygeneruj wykresy",
                                id="generate_plot_button",
                                color="primary",
                                className="mt-4",
                            ),
                            width={"size": 9, "offset": 3},
                        ),
                    ],
                    className="d-grid gap-2",
                ),
                # Wyświetlanie danych (opcjonalne)
                html.Pre(id="output_data", style={"whiteSpace": "pre-wrap", "wordBreak": "break-all"}),
            ],
            className="p-4",
            style={
                "backgroundColor": "#f8f9fa",
                "borderRadius": "15px",
               "boxShadow": "0 4px 10px rgba(0, 0, 0, 0.2)",
            },
        )
    ],
    style={
        "display": "flex",
        "justifyContent": "center",
        "alignItems": "center",
        "minHeight": "100vh",
        "backgroundColor": "#e9ecef",
    },
)

# Callback do generowania wykresów
@app.callback(
    [
        Output("output_data", "children"),
        Output("velocity_plot", "figure"),
        Output("force_plot", "figure"),
    ],
    [Input("generate_plot_button", "n_clicks")],
    [
        State("v0_slider", "value"),
        State("v_slider", "value"),
        State("angle_slider", "value"),
        State("area_slider", "value"),
        State("drag_slider", "value"),
        State("mass_dropdown", "value"),
        State("passenger_mass_dropdown", "value"),
        State("kp_slider", "value"),
        State("ti_slider", "value"),
        State("td_slider", "value"),
    ],
    prevent_initial_call=True,
)
def generate_plots(n_clicks, v0, v_set, angle, area, drag, mass, passenger_mass, kp, ti, td):
    total_mass = mass + passenger_mass
    g = 9.81  # przyspieszenie ziemskie
    air_density = 1.225  # gęstość powietrza

    angle_rad = math.radians(angle)

    # Symulacja
    dt = 0.1  # krok czasowy
    time = np.arange(0, 10, dt)

    velocity = np.zeros_like(time)
    velocity[0] = v0

    force = np.zeros_like(time)

    error_prev = 0
    integral = 0

    for i in range(1, len(time)):
        error = v_set - velocity[i - 1]

        integral += error * dt

        derivative = (error - error_prev) / dt

        control_force = kp * (error + (1 / ti) * integral + td * derivative)

        force_gravity = total_mass * g * math.sin(angle_rad)
        force_drag = 0.5 * air_density * drag * area * velocity[i - 1] ** 2

        total_force = control_force - force_gravity - force_drag

        acceleration = total_force / total_mass

        velocity[i] = velocity[i - 1] + acceleration * dt
        force[i] = total_force
        error_prev = error

    # Generowanie wykresów
    velocity_fig = go.Figure()
    velocity_fig.add_trace(go.Scatter(y=velocity, x=time, mode="lines", name="Prędkość"))
    velocity_fig.update_layout(title="Prędkość od czasu", xaxis_title="Czas [s]", yaxis_title="Prędkość [m/s]")

    force_fig = go.Figure()
    force_fig.add_trace(go.Scatter(y=force, x=time, mode="lines", name="Siła"))
    force_fig.update_layout(title="Siła od czasu", xaxis_title="Czas [s]", yaxis_title="Siła [N]")

    data = {
        "v0": v0,
        "v_set": v_set,
        "angle": angle,
        "area": area,
        "drag": drag,
        "mass": mass,
        "passenger_mass": passenger_mass,
        "kp": kp,
        "ti": ti,
        "td": td,
    }
    return json.dumps(data, indent=4), velocity_fig, force_fig


if __name__ == "__main__":
    app.run_server(debug=True, port=8052)