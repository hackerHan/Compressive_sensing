% genetic algorithm

function[m,n,p]= genetic_algorithm(population_size,chromo_size,generation_size,D,Y,option,power,Max,k)

global G ;              
global fitness_value;  
global best_fitness;    
global fitness_average;
global best_individual;
global best_generation; 
global population_new;
global population;


fitness_average = zeros(generation_size,1); 

fitness_value(2.5*population_size) = 0;
best_fitness = Inf;
best_generation = 0;

init(population_size, chromo_size,k); % initialization
population_new = [population;zeros(1.5*population_size,chromo_size)];
for G=1:generation_size   
    fitness(population_size,D,Y,option,power,Max);              
    rank(population_size, chromo_size);                  
    selection(population_size, chromo_size);   
    crossover(population_size, chromo_size,k);
    mutation(population_size);
end

m = best_individual;
n = best_fitness;
p = best_generation;

plotGA(generation_size);



