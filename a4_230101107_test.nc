/* a4_230101107_test.nc
   Test file for nanoC Parser - Assignment 4
   CS348 - IIT Guwahati
   Tests all grammar rules in the nanoC specification.
*/

/* -------------------------------------------------------
   1. DECLARATIONS: type-specifiers, storage-class, init
   ------------------------------------------------------- */

/* Basic type specifiers */
int a;
char b;
short c;
long d;
float e;
double f;
signed g;
unsigned h;
void dummy;
_Bool flag;

/* Static storage class */
static int counter;

/* Multiple declarators */
int x, y, z;

/* Declarator with initializer */
int n = 10;
float pi = 3.14;
char ch = 'A';

/* Array declarators */
int arr[10];
int arr2[5 + 3];

/* Initializer list */
int matrix[2] = {1, 2};
int nums[] = {10, 20, 30,};

/* Designated initializer */
int vec[3] = {[1] = 5};

/* Multiple type-specifiers */
unsigned int count;
long int size;
signed char byte;

/* -------------------------------------------------------
   2. FUNCTION DEFINITIONS
   ------------------------------------------------------- */

/* Simple function, no params */
int getZero()
{
    return 0;
}

/* Function with parameter type list */
int add(int p, int q)
{
    return p + q;
}

/* Function with void return */
void printChar(char c)
{
    return;
}

/* Function with ellipsis */
int sumAll(int first, ...)
{
    return first;
}

/* Function with identifier-list style (K&R) */
int oldStyle(a, b)
{
    return a;
}

/* Nested function declaration (static) */
static double computePi(int iterations)
{
    double result;
    result = 3.14;
    return result;
}

/* -------------------------------------------------------
   3. EXPRESSIONS - All kinds
   ------------------------------------------------------- */

int exprTests()
{
    int i, j, k;
    float f2;

    /* Primary expressions */
    i = 42;
    f2 = 3.14;
    j = 'Z';

    /* Postfix: array subscript */
    int buf[10];
    k = buf[2];

    /* Postfix: function call */
    k = add(1, 2);
    k = getZero();

    /* Postfix: increment / decrement */
    i++;
    j--;

    /* Prefix increment / decrement */
    ++i;
    --j;

    /* Unary operators */
    k = -i;
    k = +i;
    k = ~i;
    k = !i;
    int *ptr;
    ptr = &i;
    k = *ptr;

    /* Multiplicative */
    k = i * j;
    k = i / j;
    k = i % j;

    /* Additive */
    k = i + j;
    k = i - j;

    /* Shift */
    k = i << 2;
    k = j >> 1;

    /* Relational */
    k = (i < j);
    k = (i > j);
    k = (i <= j);
    k = (i >= j);

    /* Equality */
    k = (i == j);
    k = (i != j);

    /* Bitwise AND */
    k = i & j;

    /* Bitwise XOR */
    k = i ^ j;

    /* Bitwise OR */
    k = i | j;

    /* Logical AND / OR */
    k = (i && j);
    k = (i || j);

    /* Conditional (ternary) */
    k = (i > 0) ? i : j;

    /* Assignment operators */
    i = 5;
    i += 3;
    i -= 1;
    i *= 2;
    i /= 2;
    i %= 3;
    i <<= 1;
    i >>= 1;
    i &= 7;
    i ^= 3;
    i |= 1;

    /* Comma expression */
    k = (i = 1, j = 2, i + j);

    /* Parenthesized expression */
    k = (i + j) * 2;

    return k;
}

/* -------------------------------------------------------
   4. STATEMENTS
   ------------------------------------------------------- */

int stmtTests()
{
    int x;
    x = 0;

    /* Labeled statement */
    myLabel: x = 1;

    /* Expression statement */
    x = 2;

    /* Empty expression statement */
    ;

    /* Compound statement */
    {
        int local;
        local = 99;
    }

    /* ---- selection statements ---- */

    /* if without else */
    if (x > 0)
        x = x - 1;

    /* if-else */
    if (x == 0)
        x = 10;
    else
        x = 20;

    /* Nested if-else (dangling-else test) */
    if (x > 5)
        if (x > 10)
            x = 100;
        else
            x = 50;

    /* ---- iteration statements ---- */

    /* while */
    while (x > 0)
        x--;

    /* do-while */
    do {
        x++;
    } while (x < 5);

    /* for with all three expressions */
    int i;
    for (i = 0; i < 10; i++)
        x += i;

    /* for with empty expressions */
    for (;;)
    {
        break;
    }

    /* for with declaration */
    for (int j = 0; j < 5; j++)
        x -= j;

    /* ---- jump statements ---- */

    /* continue */
    for (i = 0; i < 3; i++) {
        if (i == 1) continue;
        x++;
    }

    /* break */
    while (1) {
        break;
    }

    /* return with expression */
    return x;
}

/* -------------------------------------------------------
   5. SWITCH-LIKE: case and default labels
   ------------------------------------------------------- */

int switchTest(int val)
{
    int result;
    result = 0;

    /* Test case and default labels (labeled-statements in nanoC) */
    case 1: result = 100;
    case 2: result = 200;
    default: result = -1;

    return result;
}

/* -------------------------------------------------------
   6. COMPLEX / COMBINED TESTS
   ------------------------------------------------------- */

/* Recursive function */
int factorial(int n)
{
    if (n <= 1)
        return 1;
    return n * factorial(n - 1);
}

/* Multi-dimensional array and nested loops */
int matMul()
{
    int A[3];
    int B[3];
    int C[3];
    int i;

    for (i = 0; i < 3; i++) {
        C[i] = A[i] + B[i];
    }
    return C[0];
}

/* String literal */
void hello()
{
    char *s;
    s = "Hello, nanoC!";
    return;
}

/* Multiple chained postfix */
int chainedCall()
{
    int arr[5];
    arr[0] = getZero();
    return arr[0];
}

/* Pointer and address-of */
void pointerTest()
{
    int v;
    int *p;
    v = 7;
    p = &v;
    *p = 42;
    return;
}

/* Complex initializer */
int initTest()
{
    int a2 = 1 + 2 * 3;
    int b2 = (4 > 3) ? 10 : 20;
    return a2 + b2;
}

/* Signed / unsigned specifiers combined */
unsigned long int bigNum;
signed short int smallNum;

/* Static local variable */
int counter2()
{
    static int cnt;
    cnt = cnt + 1;
    return cnt;
}
