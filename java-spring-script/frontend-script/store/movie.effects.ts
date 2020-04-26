import { Action } from "@ngrx/store";
import { Injectable } from "@angular/core";
import { Actions, ofType, Effect } from "@ngrx/effects";
import { of, Observable } from "rxjs";
import { map, mergeMap, catchError } from "rxjs/operators";
import * as movieAction from "./action/movie.action";


@Injectable({ providedIn: "root" })
export class movieEffects {
  constructor(
      private actions$: Actions
  ){}
  @Effect()
  connectToService$: Observable<Action> = this.actions$.pipe();
}
