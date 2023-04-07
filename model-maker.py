import joblib
from sklearn.linear_model import LinearRegression

# create a LinearRegression model
model = LinearRegression()

# train the model on some data
X = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
y = [10, 20, 30]
model.fit(X, y)

# save the model as a pkl file
joblib.dump(model, 'model.pkl')
