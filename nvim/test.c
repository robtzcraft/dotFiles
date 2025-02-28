#include <stdio.h>
#include <stdlib.h>
#include <math.h>

// Estructura para una capa de la red neuronal
typedef struct {
    int num_inputs;
    int num_neurons;
    double** weights;
    double* biases;
    double* outputs;
} Layer;

// Función de activación sigmoid
double sigmoid(double x) {
    return 1.0 / (1.0 + exp(-x));
}

// Derivada de la función sigmoid
double sigmoid_derivative(double x) {
    double sx = sigmoid(x);
    return sx * (1 - sx);
}

// Inicializar una capa de la red
Layer* init_layer(int num_inputs, int num_neurons) {
    Layer* layer = (Layer*)malloc(sizeof(Layer));
    layer->num_inputs = num_inputs;
    layer->num_neurons = num_neurons;
    
    // Inicializar pesos
    layer->weights = (double**)malloc(num_neurons * sizeof(double*));
    for (int i = 0; i < num_neurons; i++) {
        layer->weights[i] = (double*)malloc(num_inputs * sizeof(double));
        for (int j = 0; j < num_inputs; j++) {
            // Inicialización aleatoria entre -1 y 1
            layer->weights[i][j] = ((double)rand() / RAND_MAX) * 2 - 1;
        }
    }
    
    // Inicializar biases
    layer->biases = (double*)malloc(num_neurons * sizeof(double));
    for (int i = 0; i < num_neurons; i++) {
        layer->biases[i] = 0.0;
    }
    
    // Espacio para las salidas
    layer->outputs = (double*)malloc(num_neurons * sizeof(double));
    
    return layer;
}

// Propagación hacia adelante para una capa
void forward_propagate(Layer* layer, double* inputs) {
    for (int i = 0; i < layer->num_neurons; i++) {
        double sum = layer->biases[i];
        for (int j = 0; j < layer->num_inputs; j++) {
            sum += inputs[j] * layer->weights[i][j];
        }
        layer->outputs[i] = sigmoid(sum);
    }
}

// Liberar memoria de una capa
void free_layer(Layer* layer) {
    for (int i = 0; i < layer->num_neurons; i++) {
        free(layer->weights[i]);
    }
    free(layer->weights);
    free(layer->biases);
    free(layer->outputs);
    free(layer);
}

// Ejemplo de uso
int main() {
    // Crear una red simple con 2 entradas y 1 neurona
    Layer* layer = init_layer(2, 1);
    
    // Datos de entrada de ejemplo
    double inputs[] = {0.5, 3.1};
    
    // Propagación hacia adelante
    forward_propagate(layer, inputs);
    
    // Imprimir resultado
    printf("Salida: %f\n", layer->outputs[0]);
    
    // Liberar memoria
    free_layer(layer);
    
    return 0;
}
