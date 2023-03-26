# SPDX-License-Identifier: GPL-2.0-or-later
# PreSheaves: Categories of (co)presheaves
#
# Declarations
#

#! @Chapter Category of presheaves of a (linear) category

####################################
#
#! @Section &GAP; categories
#
####################################

#! @Description
#!  The &GAP; category of a presheaf category.
#! @Arguments category
DeclareCategory( "IsPreSheafCategory",
        IsCapCategory );

#! @Description
#!  The &GAP; category of cells in a presheaf category.
#! @Arguments cell
DeclareCategory( "IsCellInPreSheafCategory",
        IsCapCategoryCell );

#! @Description
#!  The &GAP; category of objects in a presheaf category.
#! @Arguments obj
DeclareCategory( "IsObjectInPreSheafCategory",
        IsCellInPreSheafCategory and
        IsCapCategoryObject );

#! @Description
#!  The &GAP; category of morphisms in a presheaf category.
#! @Arguments mor
DeclareCategory( "IsMorphismInPreSheafCategory",
        IsCellInPreSheafCategory and
        IsCapCategoryMorphism );

####################################
#
#! @Section Global variables
#
####################################

DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_PRESHEAF_CATEGORY" );

DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY" );

DeclareGlobalVariable( "CAP_INTERNAL_METHOD_NAME_LIST_FOR_MONOIDAL_PRESHEAF_CATEGORY_WITH_DUALS" );

####################################
#
#! @Section Attributes
#
####################################

#! @Description
#!  The source category $C$ of the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$).
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsPreSheafCategory );

CapJitAddTypeSignature( "Source", [ IsPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The range category $V$ of the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$).
#! @Arguments PSh
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsPreSheafCategory );

CapJitAddTypeSignature( "Range", [ IsPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Range( input_types[1].category ) );
    
end );

#! @Description
#!  The opposite $C^\mathrm{op}$ of the source category $C$ of the presheaf category <A>PSh</A>=<C>PSh</C>($C,V$).
#! @Arguments Hom
#! @Returns a &CAP; category
DeclareAttribute( "OppositeOfSource",
        IsPreSheafCategory );

#! @Description
#!  The source of the presheaf <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Source",
        IsObjectInPreSheafCategory );

CapJitAddTypeSignature( "Source", [ IsObjectInPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Source( input_types[1].category ) );
    
end );

#! @Description
#!  The target of the presheaf <A>F</A>.
#! @Arguments F
#! @Returns a &CAP; category
DeclareAttribute( "Range",
        IsObjectInPreSheafCategory );

CapJitAddTypeSignature( "Range", [ IsObjectInPreSheafCategory ],
  function ( input_types )
    
    return CapJitDataTypeOfCategory( Range( input_types[1].category ) );
    
end );

##
DeclareAttribute( "PairOfFunctionsOfPreSheaf",
        IsObjectInPreSheafCategory );

CapJitAddTypeSignature( "PairOfFunctionsOfPreSheaf", [ IsObjectInPreSheafCategory ],
  function ( input_types )
    
    Assert( 0, IsPreSheafCategory( input_types[1].category ) );
    
    return rec( filter := IsNTuple,
                element_types :=
                [ rec( filter := IsFunction,
                       signature :=
                       [ [ CapJitDataTypeOfObjectOfCategory( Source( input_types[1].category ) ) ],
                         CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ] ),
                  rec( filter := IsFunction,
                       signature :=
                       [ [ CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ),
                           CapJitDataTypeOfMorphismOfCategory( Source( input_types[1].category ) ),
                           CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ],
                         CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) ] ) ] );
    
end );

##
DeclareAttribute( "FunctionOfPreSheafMorphism",
        IsMorphismInPreSheafCategory );

CapJitAddTypeSignature( "FunctionOfPreSheafMorphism", [ IsMorphismInPreSheafCategory ],
  function ( input_types )
    
    Assert( 0, IsPreSheafCategory( input_types[1].category ) );
    
    return rec( filter := IsFunction,
                signature :=
                [ [ CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ),
                    CapJitDataTypeOfObjectOfCategory( Source( input_types[1].category ) ),
                    CapJitDataTypeOfObjectOfCategory( Range( input_types[1].category ) ) ],
                  CapJitDataTypeOfMorphismOfCategory( Range( input_types[1].category ) ) ] );
    
end );

##
DeclareAttribute( "YonedaEmbeddingFunctionalData",
        IsPreSheafCategory );

#! @Arguments B
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbedding",
        IsCapCategory );

#! @Arguments PSh
#! @Returns a &CAP; functor
DeclareAttribute( "YonedaEmbeddingOfSourceCategory",
        IsPreSheafCategory );

#! @Description
#!  Apply the presheaf <A>F</A> to the object <A>obj</A>.
#!  The shorthand is <A>F</A>(<A>obj</A>).
#! @Arguments F, obj
#! @Returns a &CAP; object
DeclareOperation( "ApplyObjectInPreSheafCategoryToObject",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryObject ] );

#! @Description
#!  Apply the presheaf <A>F</A> to the morphism <A>mor</A>.
#!  The shorthand is <A>F</A>(<A>mor</A>).
#! @Arguments F, mor
#! @Returns a &CAP; morphism
DeclareOperation( "ApplyObjectInPreSheafCategoryToMorphism",
        [ IsPreSheafCategory, IsObjectInPreSheafCategory, IsCapCategoryMorphism ] );

#! @Description
#!  Apply the presheaf morphism <A>eta</A> to the object <A>obj</A>.
#!  The shorthand is <A>eta</A>(<A>o</A>).
#! @Arguments eta, obj
#! @Returns a &CAP; morphism
DeclareOperation( "ApplyMorphismInPreSheafCategoryToObject",
        [ IsPreSheafCategory, IsMorphismInPreSheafCategory, IsCapCategoryObject ] );

#! @Arguments F
DeclareAttribute( "CoYonedaLemmaOnObjects",
        IsObjectInPreSheafCategory );

#! @Arguments phi
DeclareAttribute( "CoYonedaLemmaOnMorphisms",
        IsMorphismInPreSheafCategory );

####################################
#
#! @Section Constructors
#
####################################

#! @Description
#!  Construct the category <C>Hom( <A>B</A>^op, <A>C</A> )</C> of
#!  functors from the opposite of the small category <A>B</A> to the category <A>C</A> as objects
#!  and their natural transformations as morphisms.
#! @Arguments B, C
#! @Returns a &CAP; category
#! @Group PreSheaves
DeclareOperationWithCache( "PreSheaves",
        [ IsCapCategory, IsCapCategory ] );

CapJitAddTypeSignature( "PreSheaves", [ IsCapCategory, IsCapCategory ], IsPreSheafCategory );

#! @Arguments B
#! @Group PreSheaves
DeclareOperationWithCache( "PreSheaves",
        [ IsCapCategory ] );

CapJitAddTypeSignature( "PreSheaves", [ IsCapCategory ], IsPreSheafCategory );
