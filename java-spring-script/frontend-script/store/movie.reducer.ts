import { State } from "@ngrx/store";
import * as movieAction from "./action/movie.action"
export interface movieState {
};
export const  movieInitialState:  movieState = {
};
export function reducer(
  state = movieInitialState,
  action: movieAction.action
): movieState {
  switch (action.type) {
      case movieAction.movieTypes.loadmovie: { 
          return {
           ...state,
           };
      }
      case movieAction.movieTypes.removemovie: { 
          return {
           ...state,
           };
      }
      default: {
             return movieInitialState;
        }
      }
}
