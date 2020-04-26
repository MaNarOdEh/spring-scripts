import { Action } from "@ngrx/store";
export enum EMovieTypes {
  "loadmovie" = "[loadmovie Page] loadmovie", 
}
export class loadmovie implements Action {
  readonly type = EMovieTypes.loadmovie;
};
export type action = loadmovie ;
