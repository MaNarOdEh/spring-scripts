import { Action } from "@ngrx/store";
export enum EMovieTypes {
  "loadmovie" = "[loadmovie Page] loadmovie", 
  "removemovie" = "[removemovie Page] removemovie", 
}
export class loadmovie implements Action {
  readonly type = EMovieTypes.loadmovie;
};
export class removemovie implements Action {
  readonly type = EMovieTypes.removemovie;
};
export type action = loadmovie | removemovie ;
