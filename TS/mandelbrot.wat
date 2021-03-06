(module
 (type $iii (func (param i32 i32) (result i32)))
 (type $ii (func (param i32) (result i32)))
 (type $iiiv (func (param i32 i32 i32)))
 (type $iFFFv (func (param i32 f64 f64 f64)))
 (type $FFii (func (param f64 f64 i32) (result i32)))
 (type $iiii (func (param i32 i32 i32) (result i32)))
 (type $i (func (result i32)))
 (type $v (func))
 (global $~lib/allocator/arena/startOffset (mut i32) (i32.const 0))
 (global $~lib/allocator/arena/offset (mut i32) (i32.const 0))
 (global $mandelbrot/data (mut i32) (i32.const 0))
 (memory $0 0)
 (export "memory" (memory $0))
 (export "mandelbrot" (func $mandelbrot/mandelbrot))
 (export "getData" (func $mandelbrot/getData))
 (export "getDataBuffer" (func $mandelbrot/getDataBuffer))
 (start $start)
 (func $~lib/allocator/arena/__memory_allocate (; 0 ;) (; has Stack IR ;) (type $ii) (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (if
   (i32.gt_u
    (get_local $0)
    (i32.const 1073741824)
   )
   (unreachable)
  )
  (if
   (i32.gt_u
    (tee_local $2
     (i32.and
      (i32.add
       (i32.add
        (tee_local $1
         (get_global $~lib/allocator/arena/offset)
        )
        (select
         (get_local $0)
         (i32.const 1)
         (i32.gt_u
          (get_local $0)
          (i32.const 1)
         )
        )
       )
       (i32.const 7)
      )
      (i32.const -8)
     )
    )
    (i32.shl
     (tee_local $3
      (current_memory)
     )
     (i32.const 16)
    )
   )
   (if
    (i32.lt_s
     (grow_memory
      (select
       (get_local $3)
       (tee_local $0
        (i32.shr_u
         (i32.and
          (i32.add
           (i32.sub
            (get_local $2)
            (get_local $1)
           )
           (i32.const 65535)
          )
          (i32.const -65536)
         )
         (i32.const 16)
        )
       )
       (i32.gt_s
        (get_local $3)
        (get_local $0)
       )
      )
     )
     (i32.const 0)
    )
    (if
     (i32.lt_s
      (grow_memory
       (get_local $0)
      )
      (i32.const 0)
     )
     (unreachable)
    )
   )
  )
  (set_global $~lib/allocator/arena/offset
   (get_local $2)
  )
  (get_local $1)
 )
 (func $~lib/internal/memory/memset (; 1 ;) (; has Stack IR ;) (type $iiiv) (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (if
   (i32.eqz
    (get_local $2)
   )
   (return)
  )
  (i32.store8
   (get_local $0)
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 1)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 2)
   )
   (return)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 1)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 2)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (tee_local $3
     (i32.add
      (get_local $0)
      (get_local $2)
     )
    )
    (i32.const 2)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (get_local $3)
    (i32.const 3)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 6)
   )
   (return)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 3)
   )
   (get_local $1)
  )
  (i32.store8
   (i32.sub
    (i32.add
     (get_local $0)
     (get_local $2)
    )
    (i32.const 4)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 8)
   )
   (return)
  )
  (set_local $2
   (i32.sub
    (get_local $2)
    (tee_local $3
     (i32.and
      (i32.sub
       (i32.const 0)
       (get_local $0)
      )
      (i32.const 3)
     )
    )
   )
  )
  (i32.store
   (tee_local $0
    (i32.add
     (get_local $0)
     (get_local $3)
    )
   )
   (tee_local $1
    (i32.mul
     (i32.and
      (get_local $1)
      (i32.const 255)
     )
     (i32.const 16843009)
    )
   )
  )
  (i32.store
   (i32.sub
    (i32.add
     (get_local $0)
     (tee_local $2
      (i32.and
       (get_local $2)
       (i32.const -4)
      )
     )
    )
    (i32.const 4)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 8)
   )
   (return)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 4)
   )
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (get_local $1)
  )
  (i32.store
   (i32.sub
    (tee_local $3
     (i32.add
      (get_local $0)
      (get_local $2)
     )
    )
    (i32.const 12)
   )
   (get_local $1)
  )
  (i32.store
   (i32.sub
    (get_local $3)
    (i32.const 8)
   )
   (get_local $1)
  )
  (if
   (i32.le_u
    (get_local $2)
    (i32.const 24)
   )
   (return)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 12)
   )
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 16)
   )
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 20)
   )
   (get_local $1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 24)
   )
   (get_local $1)
  )
  (i32.store
   (i32.sub
    (tee_local $3
     (i32.add
      (get_local $0)
      (get_local $2)
     )
    )
    (i32.const 28)
   )
   (get_local $1)
  )
  (i32.store
   (i32.sub
    (get_local $3)
    (i32.const 24)
   )
   (get_local $1)
  )
  (i32.store
   (i32.sub
    (get_local $3)
    (i32.const 20)
   )
   (get_local $1)
  )
  (i32.store
   (i32.sub
    (get_local $3)
    (i32.const 16)
   )
   (get_local $1)
  )
  (set_local $0
   (i32.add
    (get_local $0)
    (tee_local $3
     (i32.add
      (i32.and
       (get_local $0)
       (i32.const 4)
      )
      (i32.const 24)
     )
    )
   )
  )
  (set_local $2
   (i32.sub
    (get_local $2)
    (get_local $3)
   )
  )
  (set_local $4
   (i64.or
    (tee_local $4
     (i64.extend_u/i32
      (get_local $1)
     )
    )
    (i64.shl
     (get_local $4)
     (i64.const 32)
    )
   )
  )
  (loop $continue|0
   (if
    (i32.ge_u
     (get_local $2)
     (i32.const 32)
    )
    (block
     (i64.store
      (get_local $0)
      (get_local $4)
     )
     (i64.store
      (i32.add
       (get_local $0)
       (i32.const 8)
      )
      (get_local $4)
     )
     (i64.store
      (i32.add
       (get_local $0)
       (i32.const 16)
      )
      (get_local $4)
     )
     (i64.store
      (i32.add
       (get_local $0)
       (i32.const 24)
      )
      (get_local $4)
     )
     (set_local $2
      (i32.sub
       (get_local $2)
       (i32.const 32)
      )
     )
     (set_local $0
      (i32.add
       (get_local $0)
       (i32.const 32)
      )
     )
     (br $continue|0)
    )
   )
  )
 )
 (func $~lib/internal/typedarray/TypedArray<u8,u32>#constructor (; 2 ;) (; has Stack IR ;) (type $iii) (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (if
   (i32.gt_u
    (get_local $1)
    (i32.const 1073741816)
   )
   (unreachable)
  )
  (i32.store
   (tee_local $2
    (call $~lib/allocator/arena/__memory_allocate
     (i32.shl
      (i32.const 1)
      (i32.sub
       (i32.const 32)
       (i32.clz
        (i32.add
         (get_local $1)
         (i32.const 7)
        )
       )
      )
     )
    )
   )
   (get_local $1)
  )
  (call $~lib/internal/memory/memset
   (i32.add
    (get_local $2)
    (i32.const 8)
   )
   (i32.const 0)
   (get_local $1)
  )
  (if
   (i32.eqz
    (get_local $0)
   )
   (block
    (i32.store
     (tee_local $0
      (call $~lib/allocator/arena/__memory_allocate
       (i32.const 12)
      )
     )
     (i32.const 0)
    )
    (i32.store offset=4
     (get_local $0)
     (i32.const 0)
    )
    (i32.store offset=8
     (get_local $0)
     (i32.const 0)
    )
   )
  )
  (i32.store
   (get_local $0)
   (get_local $2)
  )
  (i32.store offset=4
   (get_local $0)
   (i32.const 0)
  )
  (i32.store offset=8
   (get_local $0)
   (get_local $1)
  )
  (get_local $0)
 )
 (func $mandelbrot/iterateEquation (; 3 ;) (; has Stack IR ;) (type $FFii) (param $0 f64) (param $1 f64) (param $2 i32) (result i32)
  (local $3 f64)
  (local $4 f64)
  (local $5 f64)
  (local $6 i32)
  (local $7 f64)
  (local $8 i32)
  (loop $continue|0
   (if
    (tee_local $8
     (i32.lt_s
      (get_local $6)
      (get_local $2)
     )
    )
    (set_local $8
     (f64.le
      (f64.add
       (f64.mul
        (get_local $7)
        (get_local $7)
       )
       (f64.mul
        (get_local $5)
        (get_local $5)
       )
      )
      (f64.const 4)
     )
    )
   )
   (if
    (get_local $8)
    (block
     (set_local $5
      (f64.add
       (f64.mul
        (f64.mul
         (f64.const 2)
         (get_local $3)
        )
        (get_local $4)
       )
       (get_local $1)
      )
     )
     (set_local $3
      (tee_local $7
       (f64.add
        (f64.sub
         (f64.mul
          (get_local $3)
          (get_local $3)
         )
         (f64.mul
          (get_local $4)
          (get_local $4)
         )
        )
        (get_local $0)
       )
      )
     )
     (set_local $4
      (get_local $5)
     )
     (set_local $6
      (i32.add
       (get_local $6)
       (i32.const 1)
      )
     )
     (br $continue|0)
    )
   )
  )
  (get_local $6)
 )
 (func $mandelbrot/colour (; 4 ;) (; has Stack IR ;) (type $iiii) (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (if
   (i32.lt_s
    (tee_local $0
     (i32.rem_s
      (i32.add
       (i32.mul
        (get_local $0)
        (get_local $2)
       )
       (get_local $1)
      )
      (i32.const 1024)
     )
    )
    (i32.const 256)
   )
   (return
    (get_local $0)
   )
   (if
    (i32.lt_s
     (get_local $0)
     (i32.const 512)
    )
    (return
     (i32.sub
      (i32.const 510)
      (get_local $0)
     )
    )
   )
  )
  (i32.const 0)
 )
 (func $mandelbrot/mandelbrot (; 5 ;) (; has Stack IR ;) (type $iFFFv) (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 f64)
  (set_local $13
   (f64.div
    (f64.mul
     (get_local $3)
     (f64.const 800)
    )
    (f64.const 1200)
   )
  )
  (block $break|0
   (loop $repeat|0
    (br_if $break|0
     (i32.ge_s
      (get_local $10)
      (i32.const 1200)
     )
    )
    (block $break|1
     (set_local $8
      (i32.const 0)
     )
     (loop $repeat|1
      (br_if $break|1
       (i32.ge_s
        (get_local $8)
        (i32.const 800)
       )
      )
      (set_local $5
       (call $mandelbrot/iterateEquation
        (f64.add
         (get_local $1)
         (f64.mul
          (get_local $3)
          (f64.div
           (f64.sub
            (f64.convert_s/i32
             (get_local $10)
            )
            (f64.const 1200)
           )
           (f64.const 1200)
          )
         )
        )
        (f64.add
         (get_local $2)
         (f64.mul
          (get_local $13)
          (f64.div
           (f64.sub
            (f64.convert_s/i32
             (get_local $8)
            )
            (f64.const 800)
           )
           (f64.const 800)
          )
         )
        )
        (get_local $0)
       )
      )
      (set_local $6
       (tee_local $4
        (get_global $mandelbrot/data)
       )
      )
      (set_local $12
       (tee_local $7
        (tee_local $11
         (i32.shl
          (i32.add
           (get_local $10)
           (i32.mul
            (get_local $8)
            (i32.const 1200)
           )
          )
          (i32.const 2)
         )
        )
       )
      )
      (set_local $9
       (if (result i32)
        (i32.eq
         (get_local $5)
         (get_local $0)
        )
        (i32.const 0)
        (call $mandelbrot/colour
         (get_local $5)
         (i32.const 0)
         (i32.const 4)
        )
       )
      )
      (i32.store8 offset=8
       (i32.add
        (i32.add
         (i32.load
          (get_local $6)
         )
         (i32.load offset=4
          (get_local $6)
         )
        )
        (get_local $12)
       )
       (get_local $9)
      )
      (drop
       (i32.load8_u offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $4)
          )
          (i32.load offset=4
           (get_local $4)
          )
         )
         (get_local $7)
        )
       )
      )
      (set_local $6
       (tee_local $4
        (get_global $mandelbrot/data)
       )
      )
      (set_local $12
       (tee_local $7
        (i32.add
         (get_local $11)
         (i32.const 1)
        )
       )
      )
      (set_local $9
       (if (result i32)
        (i32.eq
         (get_local $5)
         (get_local $0)
        )
        (i32.const 0)
        (call $mandelbrot/colour
         (get_local $5)
         (i32.const 128)
         (i32.const 4)
        )
       )
      )
      (i32.store8 offset=8
       (i32.add
        (i32.add
         (i32.load
          (get_local $6)
         )
         (i32.load offset=4
          (get_local $6)
         )
        )
        (get_local $12)
       )
       (get_local $9)
      )
      (drop
       (i32.load8_u offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $4)
          )
          (i32.load offset=4
           (get_local $4)
          )
         )
         (get_local $7)
        )
       )
      )
      (set_local $6
       (tee_local $4
        (get_global $mandelbrot/data)
       )
      )
      (set_local $9
       (tee_local $7
        (i32.add
         (get_local $11)
         (i32.const 2)
        )
       )
      )
      (set_local $5
       (if (result i32)
        (i32.eq
         (get_local $5)
         (get_local $0)
        )
        (i32.const 0)
        (call $mandelbrot/colour
         (get_local $5)
         (i32.const 356)
         (i32.const 4)
        )
       )
      )
      (i32.store8 offset=8
       (i32.add
        (i32.add
         (i32.load
          (get_local $6)
         )
         (i32.load offset=4
          (get_local $6)
         )
        )
        (get_local $9)
       )
       (get_local $5)
      )
      (drop
       (i32.load8_u offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $4)
          )
          (i32.load offset=4
           (get_local $4)
          )
         )
         (get_local $7)
        )
       )
      )
      (i32.store8 offset=8
       (i32.add
        (i32.add
         (i32.load
          (tee_local $4
           (get_global $mandelbrot/data)
          )
         )
         (i32.load offset=4
          (get_local $4)
         )
        )
        (tee_local $7
         (i32.add
          (get_local $11)
          (i32.const 3)
         )
        )
       )
       (i32.const 255)
      )
      (drop
       (i32.load8_u offset=8
        (i32.add
         (i32.add
          (i32.load
           (get_local $4)
          )
          (i32.load offset=4
           (get_local $4)
          )
         )
         (get_local $7)
        )
       )
      )
      (set_local $8
       (i32.add
        (get_local $8)
        (i32.const 1)
       )
      )
      (br $repeat|1)
     )
    )
    (set_local $10
     (i32.add
      (get_local $10)
      (i32.const 1)
     )
    )
    (br $repeat|0)
   )
  )
 )
 (func $mandelbrot/getData (; 6 ;) (; has Stack IR ;) (type $i) (result i32)
  (get_global $mandelbrot/data)
 )
 (func $mandelbrot/getDataBuffer (; 7 ;) (; has Stack IR ;) (type $i) (result i32)
  (i32.load
   (get_global $mandelbrot/data)
  )
 )
 (func $start (; 8 ;) (; has Stack IR ;) (type $v)
  (set_global $~lib/allocator/arena/startOffset
   (i32.const 8)
  )
  (set_global $~lib/allocator/arena/offset
   (get_global $~lib/allocator/arena/startOffset)
  )
  (set_global $mandelbrot/data
   (call $~lib/internal/typedarray/TypedArray<u8,u32>#constructor
    (i32.const 0)
    (i32.const 3840000)
   )
  )
 )
)
