import { Action } from "@ngrx/store";
import { Injectable } from "@angular/core";
import { Actions, ofType, Effect } from "@ngrx/effects";
import { of, Observable } from "rxjs";
import { map, mergeMap, catchError } from "rxjs/operators";
