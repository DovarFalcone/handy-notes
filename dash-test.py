import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
import pandas as pd
from sklearn.linear_model import LinearRegression
import plotly.graph_objs as go
import joblib

# load the pre-trained machine learning model
model = joblib.load('model.pkl')

# define the app
app = dash.Dash(__name__)
app.title = 'Quick Dash App'

# set the dark theme
app.layout = html.Div(style={'backgroundColor': '#1E1E1E', 'color': '#FFFFFF'}, children=[
    html.H1('Quick Dash App', style={'textAlign': 'center'}),
    html.H2('Enter some values:', style={'textAlign': 'center'}),
    dcc.Input(id='input1', type='number', placeholder='Input 1'),
    dcc.Input(id='input2', type='number', placeholder='Input 2'),
    dcc.Input(id='input3', type='number', placeholder='Input 3'),
    html.Br(),
    html.Div(id='output', style={'textAlign': 'center', 'fontSize': 24}),
    dcc.Graph(id='visualization')
])

# define the callback function for making the prediction
@app.callback(
    Output('output', 'children'),
    Input('input1', 'value'),
    Input('input2', 'value'),
    Input('input3', 'value')
)
def make_prediction(input1, input2, input3):
    if input1 is not None and input2 is not None and input3 is not None:
        # make a prediction using the pre-trained model
        prediction = model.predict([[input1, input2, input3]])
        return f'The predicted value is {prediction[0]:.2f}'

# define the callback function for displaying the visualization
@app.callback(
    Output('visualization', 'figure'),
    Input('input1', 'value'),
    Input('input2', 'value'),
    Input('input3', 'value')
)
def display_visualization(input1, input2, input3):
    if input1 is not None and input2 is not None and input3 is not None:
        # generate some data based on the input values
        data = pd.DataFrame({'input1': [input1], 'input2': [input2], 'input3': [input3]})
        data['output'] = model.predict(data[['input1', 'input2', 'input3']])
        
        # create the visualization
        fig = go.Figure(data=[
            go.Bar(name='Input 1', x=['Input 1'], y=[input1]),
            go.Bar(name='Input 2', x=['Input 2'], y=[input2]),
            go.Bar(name='Input 3', x=['Input 3'], y=[input3]),
            go.Scatter(name='Output', x=['Output'], y=[data['output'][0]])
        ])
        fig.update_layout(
            title='Inputs and Output',
            xaxis_title='Parameter',
            yaxis_title='Value',
            template='plotly_dark'
        )
        return fig

# start the app
if __name__ == '__main__':
    app.run_server(debug=True)
