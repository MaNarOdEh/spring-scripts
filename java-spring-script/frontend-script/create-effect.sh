#!/bin/bash


#varaibels
effect_name=$1;
#create store folder
mkdir -p store
#change first char from capital to small
effect_name=$(tr A-Z a-z <<< ${effect_name:0:1})${effect_name:1};
effect_dir=store/${effect_name}.effects.ts;
test -f ${effect_dir} || touch ${effect_dir};

echo 'import { Action } from "@ngrx/store";' >> ${effect_dir};
echo 'import { Injectable } from "@angular/core";' >> ${effect_dir};
echo 'import { Actions, ofType, Effect } from "@ngrx/effects";' >> ${effect_dir};
echo 'import { of, Observable } from "rxjs";' >> ${effect_dir};
echo 'import { map, mergeMap, catchError } from "rxjs/operators";' >> ${effect_dir};
echo "import * as ${effect_name}Action from \"./action/${effect_name}.action\";" >> ${effect_dir};
echo "" >> ${effect_dir};
echo "" >> ${effect_dir};
echo "@Injectable({ providedIn: \"root\" })" >> ${effect_dir};

echo "export class ${effect_name}Effects {" >> ${effect_dir};

echo "  constructor("  >> ${effect_dir};
echo "      private actions$: Actions"  >> ${effect_dir};
echo "  ){}"  >> ${effect_dir};
echo "  @Effect()"  >> ${effect_dir};
echo "  connectToService$: Observable<Action> = this.actions$.pipe(" >> ${effect_dir};
echo "      ofType<>()" >> ${effect_dir};
echo "      mergeMap((actions:${effect_name}Action) => " >> ${effect_dir};
echo "   )" >> ${effect_dir};
echo " )" >> ${effect_dir};

echo "}" >> ${effect_dir};

