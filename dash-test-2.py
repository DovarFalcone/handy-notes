import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.express as px
import numpy as np
import pandas as pd

app = dash.Dash(__name__)

# Generate data for each distribution
normal_data = np.random.normal(0, 1, 1000)
uniform_data = np.random.uniform(-1, 1, 1000)
exponential_data = np.random.exponential(1, 1000)
poisson_data = np.random.poisson(5, 1000)

# Create data frames for each distribution
normal_df = pd.DataFrame({'values': normal_data})
uniform_df = pd.DataFrame({'values': uniform_data})
exponential_df = pd.DataFrame({'values': exponential_data})
poisson_df = pd.DataFrame({'values': poisson_data})

# Create histograms for each distribution
normal_hist = px.histogram(normal_df, x='values', nbins=30, title='Normal Distribution')
uniform_hist = px.histogram(uniform_df, x='values', nbins=30, title='Uniform Distribution')
exponential_hist = px.histogram(exponential_df, x='values', nbins=30, title='Exponential Distribution')
poisson_hist = px.histogram(poisson_df, x='values', nbins=30, title='Poisson Distribution')

# Create app layout
app.layout = html.Div(children=[
    html.H1(children='Data Distribution Visualization'),

    html.Div(children='''
        Exploring 4 different data distribution types
    '''),

    dcc.Graph(
        id='normal-hist',
        figure=normal_hist
    ),

    dcc.Graph(
        id='uniform-hist',
        figure=uniform_hist
    ),

    dcc.Graph(
        id='exponential-hist',
        figure=exponential_hist
    ),

    dcc.Graph(
        id='poisson-hist',
        figure=poisson_hist
    )
])

if __name__ == '__main__':
    app.run_server(debug=True)
