/*
 * ADTs for non-terminals.
 */

/*
 * Since an atom can be either an alpha or a number and not both, it's suitably
 * represented by a union.
 */
union atom_u {
	char *alpha;
	int number;
};

/*
 * ADT representing a sequence.
 */
struct sequence_t {
	union sexpression_u sexpression[];
};

union sexpression_u {
	char *alpha;
	struct sequence_t sequence;
};

/*
 * ADT representing a result.
 */
union result_u {
	int number;
	char *alpha;
	union atom_u atom;
	struct sequence_t sequence;
};
