from sklearn.base import BaseEstimator, ClassifierMixin
import numpy as np
import math

class SoftmaxClassifier(BaseEstimator, ClassifierMixin):  
    """A softmax classifier"""

    def __init__(self, lr = 0.1, alpha = 100, n_epochs = 1000, eps = 1.0e-5,threshold = 1.0e-10 , regularization = True, early_stopping = True):
       
        """
            self.lr : the learning rate for weights update during gradient descent
            self.alpha: the regularization coefficient 
            self.n_epochs: the number of iterations
            self.eps: the threshold to keep probabilities in range [self.eps;1.-self.eps]
            self.regularization: Enables the regularization, help to prevent overfitting
            self.threshold: Used for early stopping, if the difference between losses during 
                            two consecutive epochs is lower than self.threshold, then we stop the algorithm
            self.early_stopping: enables early stopping to prevent overfitting
        """

        self.lr = lr 
        self.alpha = alpha
        self.n_epochs = n_epochs
        self.eps = eps
        self.regularization = regularization
        self.threshold = threshold
        self.early_stopping = early_stopping
        


    """
        Public methods, can be called by the user
        To create a custom estimator in sklearn, we need to define the following methods:
        * fit
        * predict
        * predict_proba
        * fit_predict        
        * score
    """


    """
        In:
        X : the set of examples of shape nb_example * self.nb_features
        y: the target classes of shape nb_example *  1

        Do:
        Initialize model parameters: self.theta_
        Create X_bias i.e. add a column of 1. to X , for the bias term
        For each epoch
            compute the probabilities
            compute the loss
            compute the gradient
            update the weights
            store the loss
        Test for early stopping

        Out:
        self, in sklearn the fit method returns the object itself


    """

    def fit(self, X, y=None):
        
        prev_loss = np.inf
        self.losses_ = []

        self.nb_feature = X.shape[1]
        self.nb_classes = len(np.unique(y))

        self.theta_ = np.random.rand(self.nb_feature + 1, self.nb_classes)

        self.nb_examples = X.shape[0]
        X_bias = np.c_[ X, np.ones(X.shape[0]) ]

        for epoch in range( self.n_epochs):

            z = np.dot(X_bias, self.theta_)

            probabilities = self._softmax(z)
            
            loss = self._cost_function(probabilities, y)                
            self.theta_ = self.theta_ - self.lr * self._get_gradient(X_bias, y, probabilities)
            
            if (len(self.losses_) > 0):
                last_loss = self.losses_[-1]

                if self.early_stopping:
                    if (self.losses_[-1] - last_loss) < self.threshold:
                        break;
            self.losses_.append(loss)
        return self
    
    """
        In: 
        X without bias

        Do:
        Add bias term to X
        Compute the logits for X
        Compute the probabilities using softmax

        Out:
        Predicted probabilities
    """

    def predict_proba(self, X, y=None):
        try:
            getattr(self, "theta_")

            X_bias = np.c_[ X, np.ones(X.shape[0]) ]

            z = np.dot(X_bias, self.theta_)
            
            probabilities = self._softmax(z)

            return probabilities

        except AttributeError:
            raise RuntimeError("You must train classifer before predicting data!")

        """
        In: 
        X without bias

        Do:
        Add bias term to X
        Compute the logits for X
        Compute the probabilities using softmax
        Predict the classes

        Out:
        Predicted classes
    """

    
    def predict(self, X, y=None):
        try:
            getattr(self, "theta_")
            probabilities = self.predict_proba(X, y)

            predict_classes = []
            for p in probabilities:
                i = np.argmax(p)
                predict_classes.append(i)

            return predict_classes

        except AttributeError:
            raise RuntimeError("You must train classifer before predicting data!")
    

    def fit_predict(self, X, y=None):
        self.fit(X, y)
        return self.predict(X,y)


    """
        In : 
        X set of examples (without bias term)
        y the true labels

        Do:
            predict probabilities for X
            Compute the log loss without the regularization term

        Out:
        log loss between prediction and true labels

    """    

    def score(self, X, y=None):
        probabilities = self.predict_proba(X, y)
        cost = self._cost_function(probabilities, y)
        return cost

    

    """
        Private methods, their names begin with an underscore
    """

    """
        In :
        y without one hot encoding
        probabilities computed with softmax

        Do:
        One-hot encode y
        Ensure that probabilities are not equal to either 0. or 1. using self.eps
        Compute log_loss
        If self.regularization, compute l2 regularization term
        Ensure that probabilities are not equal to either 0. or 1. using self.eps

        Out: cost (real number)
    """
    
    def _cost_function(self,probabilities, y ): 
        J = 0
        e = 10**-9
        y_encoded = self._one_hot(y)
        for i in range(1, self.nb_examples):
            for k in range(1, self.nb_classes):
                p = probabilities[i][k]
                if (p == 0):
                    p += e
                if (p == 1):
                    p -= e
                J += y_encoded[i][k] * math.log(p)

        J *= -1/self.nb_examples

        if self.regularization:
            l2 = 0
            for i in range(1, self.nb_feature):
                for j in range(0, self.nb_classes):
                    l2 += self.theta_[i][j] * self.theta_[i][j]
            l2 *= self.alpha/self.nb_examples
            J += l2

        return J

    """
        In :
        Target y: nb_examples * 1

        Do:
        One hot-encode y
        [1,1,2,3,1] --> [[1,0,0],
                         [1,0,0],
                         [0,1,0],
                         [0,0,1],
                         [1,0,0]]
        Out:
        y one-hot encoded
    """

    
    
    def _one_hot(self,y):
        one_hot_targets = np.eye(self.nb_classes)[y.reshape(-1)]
        return one_hot_targets


    """
        In :
        Logits: nb_exemples * self.nb_classes

        Do:
        Compute softmax on logits

        Out:
        Probabilities
    """
    
    def _softmax(self,z):
        probabilities = []
        for x in z:
            exp = np.exp(x)
            somme = np.sum(exp)
            p = np.divide(exp, somme)
            probabilities.append(p)

        return np.array(probabilities)

    """
        In:
        X with bias
        y without one hot encoding
        probabilities resulting of the softmax step

        Do:
        One-hot encode y
        Compute gradients
        If self.regularization add l2 regularization term

        Out:
        Gradient

    """

    def _get_gradient(self,X,y, probas):
        J = 0
        y_encoded = self._one_hot(y)
        subs = np.subtract(probas, y_encoded)
        J = np.matmul(X.T, subs)
        J = np.dot(J, 1/X.shape[0])
        
        if self.regularization:
            R = np.dot(self.theta_, 2 * self.alpha/1/X.shape[0])
            for i in range(0, J.shape[0]):
                for j in range(0, J.shape[1]):
                    J[i][j] += R[i][j]

        return J