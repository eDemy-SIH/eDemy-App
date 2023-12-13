# from flask import Flask, request, jsonify, render_template
# import pickle
# import numpy as np
# import json

# app = Flask(__name__)

# # Load the trained SVM model
# with open('svm_model_.pkl', 'rb') as model_file:
#     model = pickle.load(model_file)


# @app.route("/")
# def index():
#     return render_template('index.html')




# # Load the SVM model
# svm_model = pickle.load(open('svm_model_.pkl', 'rb'))

# with open('numbers.json', 'r') as file:
#     numbers = json.load(file)


# data = np.array([numbers])

# try:
#     # Use the predict method to make predictions
#     prediction = svm_model.predict(data)
#     print(f'The model predicts: {prediction[0]}')
# except Exception as e:
#     print("Error:",e)


# if __name__ == "__main__":    
#     app.run(host="0.0.0.0", port=8080,debug='True')












# from flask import Flask, request, jsonify, render_template
# import pickle
# import numpy as np

# app = Flask(__name__)

# # Load the trained SVM model
# with open('svm_model_.pkl', 'rb') as model_file:
#     model = pickle.load(model_file)

# @app.route("/")
# def index():
#     return render_template('index.html')


# svm_model = pickle.load(open('svm_model_.pkl', 'rb'))

# @app.route('/predict', methods=['POST'])
# def predict():
#     data = request.get_json(force=True)
#     features = data['features']

#     # Perform any necessary preprocessing on the features
#     # ...

#     # Make predictions using the SVM model
#     prediction = svm_model.predict([features])[0]

#     # Convert the prediction to a string or any format you prefer
#     prediction_str = str(prediction)

#     return jsonify({'prediction': prediction_str})



# if __name__ == "__main__":    
#     app.run(host="0.0.0.0", port=8080, debug=True)


# from flask import Flask, jsonify
# import json

# app = Flask(__name__)

# @app.route('/', methods=['GET'])
# def get_numbers():
#     try:
#         # Read the JSON file
#         with open('numbers.json', 'r') as file:
#             numbers = json.load(file)
#         return jsonify({'numbers': numbers})
#     except FileNotFoundError:
#         return jsonify({'error': 'Numbers file not found'}), 404

# if __name__ == '__main__':
#     app.run(debug=True)



# from flask import Flask, request, jsonify
# from flask_cors import CORS
# import pickle
# import numpy as np

# app = Flask(__name__)
# CORS(app)  

# # Load the trained SVM model
# with open('svm_model_.pkl', 'rb') as model_file:
#     svm_model = pickle.load(model_file)

# @app.route('/predict', methods=['POST'])
# def predict():
#     print("input_data")
#     try:
#         data = request.get_json()
#         numbers = data.get('numbers', [])
#         input_data = np.array([numbers])

#         # Use the predict method to make predictions
#         prediction = svm_model.predict(input_data)
#         print(input_data)
#         result = {'prediction': int(prediction[0])}
#         return jsonify(result)
#     except Exception as e:
#         print("Error:", e)
#         return jsonify({'error': 'Prediction failed'})

# if __name__ == '__main__':
#     app.run(host='0.0.0.0', port=8080, debug=True)