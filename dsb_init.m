clear all;
close all;
clc;

load handel

data = [(1:length(y))', y];
data(:,1) = data(:,1)/8192;


