/*
    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) 2015  <copyright holder> <email>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#ifndef TESTSOLVER_H
#define TESTSOLVER_H

#include "ExternalSolver.h"
#include <string>
#include <vector>
#include <sstream>
#include <iomanip>
#include <queue>
#include <unordered_map>

using namespace std;

const int numWaypoints = 30;       // Total number of waypoints
const int numCoordinates = 3;      // Number of coordinates of the waypoint

class VisitSolver : public ExternalSolver
{
public:
    VisitSolver();
    ~VisitSolver();
    virtual void loadSolver(string* parameters, int n);
    virtual map<string,double> callExternalSolver(map<string,double> initialState, bool isHeuristic);
    virtual  list<string> getParameters();
    virtual  list<string> getDependencies();
    map<string, vector<double>> waypoint;
    map<string, vector<string>> region_mapping;
    
    vector <string> source, target;
    string starting_position;

    void parseWaypoint(string waypoint_file);
    void parseParameters(string parameters);  

private:
    list<string> affected;
    list<string> dependencies;

    int k;
    double dist_matrix[numWaypoints][numWaypoints] = {};
    double dist_array[numWaypoints] = {};
    double adj_matrix[numWaypoints][numWaypoints] = {};

    vector<string> findParameters(string line, int&n);

    double calculateExtern(double external, double total_cost);
    double distance_euc(string from, string to);
    void randWaypointGenerator(string waypoint_file);
    void buildGraph();
    double compute_path(string from, string to);
    int findMinimumIndex(double dist_array[]);
    int minDistance(int dist[], bool visited[]);
    int extract_num(string str);
};

#endif // TESTSOLVER_H
