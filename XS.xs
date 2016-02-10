#include <cstdlib>
#include <ctime>
#include <ios>
#include <iostream>
#include <iterator>

#include <string>
#include <typeinfo>
#include <vector>
#include "src/simstring/simstring.h"

#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "const-c.inc"


MODULE = SimString::XS		PACKAGE = SimString::XS

PROTOTYPES: DISABLE		

INCLUDE: const-xs.inc

PROTOTYPES: ENABLE

void
loaddb(filename)
    char* filename

void
retrieve()
    PPCODE:
        while(!pqResults.empty()) {
            curResult = pqResults.top();
            pqResults.pop();
            EXTEND(SP, 2);
            PUSHs(sv_2mortal(newSViv(curResult.id)));
            PUSHs(sv_2mortal(newSVnv(curResult.score)));
        }
