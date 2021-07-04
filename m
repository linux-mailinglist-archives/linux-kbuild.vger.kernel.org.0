Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2CC3BAECF
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 22:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhGDUbL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 16:31:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhGDUbL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 16:31:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAAC96115C;
        Sun,  4 Jul 2021 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625430515;
        bh=n3LljfKpRHuXWIoIp69UEVTQbXFDjTbuAHNJvxk07Wg=;
        h=From:To:Cc:Subject:Date:From;
        b=GPrOrMpZjgWKYSUTHzSeDNf7KOU/lTI03+AS6tM1FBbx9oYbKlWHF28v46iVsWfKc
         bON3JJAKbU9nOuuYOr8T3tNGakmJ+jKONBX3/F8cDPAj7BjIdzIQRWavI+C19qckdX
         Fr0bDPDEdhoHxSrgPQFuRIBLC1SYms6cr4nHuqVW9MRzelrDTKRXnoiMGRnLEo3F3T
         wuT8ADtxvoFdIqUkA9Zvq6L8g0mN0aj70mZ2iCR6j+yWWB822XMgVHzroGTkjIBh0H
         zIePnyUhuyQZxqBj8PvRa7DrEIo5+5w0JuF3pggleB/flaU7naGi84jNFRfMs2moMK
         SlgC/2yL3xiOQ==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 00/17] Rust support
Date:   Sun,  4 Jul 2021 22:27:39 +0200
Message-Id: <20210704202756.29107-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Rust support

This is the patch series to add support for Rust as a second language
to the Linux kernel.

If you are interested in following this effort, please join us in
the mailing list at:

    rust-for-linux@vger.kernel.org

and take a look at the project itself at:

    https://github.com/Rust-for-Linux

Cheers,
Miguel

--

# Rust support

This cover letter explains the major changes and updates done since
the RFC sent in the previous merge window back in April, plus a few
extra notes and announcements. For the RFC, please see:

    https://lore.kernel.org/lkml/20210414184604.23473-1-ojeda@kernel.org/


## Rust infrastructure updates

There have been several major improvements to the overall Rust
support. The following subsections cover these.


### Removed panicking allocations

We have removed infallible allocations. In order to do so, we have
integrated a subset of the `alloc` standard library crate, with some
additions on top. This allows us to customize things to our needs,
while giving upstream the time they need to evaluate our changes.

Eventually, the goal is to have everything the kernel needs in
upstream `alloc` and drop it from the kernel tree. We have already
started this process and some changes have been already accepted
upstream.

On top of that, `alloc` is now compiled with panicking allocation
methods disabled, thus they cannot be used within the kernel by
mistake either.

Moreover, the documentation for this customized `alloc`  crate (as well
as for `core`) is now generated alongside the rest of the Rust kernel
documentation. Thus kernel developers can now easily browse the subset
that is available within the kernel. Like last time, you can take
a look at a preview of the documentation at:

     https://rust-for-linux.github.io/docs/alloc/

Note that the `compiler_builtins` panicking intrinsics are still
there, but those will be solved by partitioning `core` via feature
gates. The first one, for disabling floating-point functionality,
has just been accepted upstream.


### Beta compiler supported

Up until now, we have been using nightly releases of `rustc` because
we need some of the latest fixes and unstable features.

However, the kernel can now be compiled with beta and stable `rustc`
releases. At the moment, we are using the 1.54-beta1 version as our
reference compiler. At the end of this month, `rustc` 1.54 will be
released, and we will move to that version as our reference.

Note that the kernel still requires unstable features, even if it is
compiled with a stable `rustc` release, thus we cannot guarantee that
future `rustc` versions will work without changes to the kernel tree.

Thus, until all the unstable features we need are stabilized, we will
support a single `rustc` version for each kernel release.


### Testing support

Another big addition has been the support for testing. We now support
the standard Rust `#[test]` attribute to easily write tests, e.g.:

    #[test]
    fn f() {
        let a = 20;
        let b = 22;
        assert_eq!(a + b, 42);
    }

Furthermore, we are now also supporting Rust documentation tests
("doctests"). These allow us to make sure our examples remain up to
date, and also double as tests too, e.g.:

    /// ```
    /// assert_eq!(foo::f(), 42);
    /// ```
    pub fn f() -> i32 {
        42
    }

For the moment, both kinds of tests are run in the host only, but
the goal is to have them running in kernel space, so that we can
test code that depends on kernel features, and to allow any kernel
module to declare and use them.


### Architectures and compiler support

`arm` (i.e. 32-bit) and `riscv` are now also supported.

On compilers, we would like to mention all the work that has been
going in GCC Rust (a GCC frontend for the Rust language) and
`rustc_codegen_gcc` (a `rustc` backend for GCC). The latter now passes
all `core` tests, and the former is now working on traits. We continue
to track their progress as they may become the best way to have
GCC-built kernels with Rust support enabled. Their latest reports
can be found at:

    https://blog.antoyo.xyz/rustc_codegen_gcc-progress-report-1
    https://thephilbert.io/2021/06/28/gcc-rust-weekly-status-report-20/

On top of that, we requested Compiler Explorer to add support to all
the alternative compilers. At the time of writing, they have already
added `mrustc` and GCC Rust; and `rustc_codegen_gcc` is coming soon.
See a live example at:

    https://godbolt.org/z/8o74c57Yj


## Rust abstractions and driver updates

We have developed new Rust abstractions that use the kernel C
implementations: red-black trees, reference-counted objects, file
descriptor creation, tasks, files, io vectors...

Additionally, we have improved driver support: improvements to
`file_operations` (more operations supported, arbitrary state),
reduced boiler-plate code, improved `module!` macro, registration
macros, rudimentary (`probe` and `remove`) platform drivers...

On Binder, there is now support for transferring files descriptors
and LSM hooks; and we are working on preliminary performance numbers.

Moreover, there is ongoing work on a Rust example driver,
`bcm2835-rng`. This is the hardware random-number generator present
on Raspberry Pi Zero(W), Classic, Two, and Three.

There are other small improvements, such as drivers being restricted
on what unstable features they can use.


## Patch series status

Like it was mentioned in the RFC, the Rust support is still to be
considered experimental. However, as noted back in April, support is
good enough that kernel developers can start working on the Rust
abstractions for subsystems and write drivers and other modules.

Please note that the current series have just arrived in `linux-next`,
thus the first run will happen on Tuesday.


## Industry and academia support

We have been in contact with a set of companies and academia members
that would like to use Rust as a second language in the kernel. Some
of them have already started to evaluate Rust for their needs using
the infrastructure we have already in place.

In particular, we have got a few statements from major companies.
In no particular order:

  Microsoft's Linux Systems Group is interested in contributing to
  getting Rust into Linux kernel. Hopefully we will be able to submit
  select Hyper-V drivers written in Rust in the coming months.

  Arm recognises the Rust value proposition and is actively working
  with the Rust community to improve Rust for Arm based systems.
  A good example is Arm’s RFC contribution to the Rust language which
  made Linux on 64-bit Arm systems a Tier-1 Rust supported platform.
  Rustaceans at Arm are excited about the Rust for Linux initiative
  and look forward to assisting in this effort.

  Google supports and contributes directly to the Rust for Linux
  project. Our Android team is evaluating a new Binder implementation
  and considering other drivers where Rust could be adopted.

In addition, IBM contributed the Rust kernel support for PowerPC
which was already included in the RFC.

In addition, from academia, there are already several projects around
Rust for Linux going on. As an example, members of LSE (Systems
Research Laboratory) at EPITA (École pour l'informatique et les
techniques avancées) are developing an SPI Rust driver.

And, of course, special thanks go to ISRG (Internet Security Research
Group) and Google for their financial support on this endeavor.


## Conferences and talks

We have submitted talk proposals for LPC (Linux Plumbers Conference).

The main one will describe the work we have done so far and ideally
will also serve as an introduction for other kernel developers
interested in using Rust in the kernel. It will cover an introduction
of the language within the context of the kernel, how the overall Rust
support works, how code is documented, how tests are written, a tour
of available tooling, an explanation of coding guidelines, how kernel
driver code looks like, etc.

In addition, we would like to announce that we are organizing a new
conference that focuses on Rust and the Linux kernel. The first
edition will be virtual and will take place before LPC. Details will
be announced soon.


## Acknowledgements

The signatures in the main commits correspond to the people that
wrote code that has ended up in them at the present time. For details
on contributions to code and discussions, please see our repository:

    https://github.com/Rust-for-Linux/linux

However, we would like to give credit to everyone that has contributed
in one way or another to the Rust for Linux project. Since the RFC:

  - bjorn3 for all the input on Rust compiler details and all
    the reviews and suggestions.

  - Arthur Cohen, Esteban Blanc and Martin Schmidt for their ongoing
    work on the SPI abstractions and driver.

  - Dan Robertson for his ongoing work on softdeps in the `module!`
    macro and the addition of a few safety comments.

  - Paul Römer for his ongoing experiment on using `NonNull` as much
    as possible.

  - Sladyn Nunes for his ongoing sorting of error constants.

  - Jonathan Corbet and the LPC organizers for lending us the Linux
    Plumbers Conference infrastructure so that we can have an easy
    time setting up the new conference.

  - John Ericson for quickly implementing the `no_global_oom_handling`
    `cfg` feature in upstream `alloc` to easily disable all
    functionality that relies on panicking allocations.

  - Josh Triplett and John Ericson for their input on `alloc` which
    helped us decide what to do with it (i.e. fully custom vs.
    slightly custom in-tree copy vs. upstream), as well as offering
    to help moving forward some needed features on the Rust side.

  - Mark Rousskov for answering some questions about beta backports
    and scheduling, as well as working on unsticking `1.54.0-beta.1`.

  - Philipp Krones for his input on Clippy lints and discussing
    extensions for developing custom lints.

  - Antoni Boucher for his work on `rustc_codegen_gcc`.

  - Philip Herrons (and his supporters Open Source Security and
    Embecosm) for his work on GCC Rust.

  - Marc Poulhiès for his work on Compiler Explorer to add the
    alternative Rust compilers we requested.

  - Many folks that have reported issues, tested the project,
    helped spread the word, joined discussions and contributed in
    other ways! In no particular order: Chenguang Wang, Greg Morenz,
    John Baublitz, Leah Leshchinsky, Caedin Cook, Liam Arzola,
    Fabio Aiuto, Hanqing Zhao, Robin Randhawa, Michal Rostecki,
    Wei Liu...

For additional acknowledgements, please see the RFC from April.

Miguel Ojeda (17):
  kallsyms: support big kernel symbols (2-byte lengths)
  kallsyms: increase maximum kernel symbol length to 512
  Makefile: generate `CLANG_FLAGS` even in GCC builds
  vsprintf: add new `%pA` format specifier
  rust: add C helpers
  rust: add `compiler_builtins` crate
  rust: add `alloc` crate
  rust: add `build_error` crate
  rust: add `macros` crate
  rust: add `kernel` crate
  rust: export generated symbols
  Kbuild: add Rust support
  docs: add Rust documentation
  samples: add Rust examples
  scripts: add `generate_rust_analyzer.py`
  MAINTAINERS: Rust
  Android: Binder IPC in Rust (WIP)

 .gitignore                                  |    5 +
 .rustfmt.toml                               |   12 +
 Documentation/doc-guide/kernel-doc.rst      |    3 +
 Documentation/index.rst                     |    1 +
 Documentation/kbuild/kbuild.rst             |    4 +
 Documentation/process/changes.rst           |   13 +
 Documentation/rust/arch-support.rst         |   35 +
 Documentation/rust/assets/favicon-16x16.png |  Bin 0 -> 798 bytes
 Documentation/rust/assets/favicon-32x32.png |  Bin 0 -> 2076 bytes
 Documentation/rust/assets/rust-logo.png     |  Bin 0 -> 53976 bytes
 Documentation/rust/coding.rst               |   92 +
 Documentation/rust/docs.rst                 |  110 +
 Documentation/rust/index.rst                |   20 +
 Documentation/rust/quick-start.rst          |  222 ++
 MAINTAINERS                                 |   14 +
 Makefile                                    |  176 +-
 arch/arm/rust/target.json                   |   28 +
 arch/arm64/rust/target.json                 |   35 +
 arch/powerpc/rust/target.json               |   30 +
 arch/riscv/Makefile                         |    1 +
 arch/riscv/rust/rv32ima.json                |   37 +
 arch/riscv/rust/rv32imac.json               |   37 +
 arch/riscv/rust/rv64ima.json                |   37 +
 arch/riscv/rust/rv64imac.json               |   37 +
 arch/x86/rust/target.json                   |   37 +
 drivers/android/Kconfig                     |    7 +
 drivers/android/Makefile                    |    2 +
 drivers/android/allocation.rs               |  264 ++
 drivers/android/context.rs                  |   80 +
 drivers/android/defs.rs                     |   99 +
 drivers/android/node.rs                     |  476 +++
 drivers/android/process.rs                  |  972 ++++++
 drivers/android/range_alloc.rs              |  189 ++
 drivers/android/rust_binder.rs              |  114 +
 drivers/android/thread.rs                   |  857 +++++
 drivers/android/transaction.rs              |  328 ++
 include/linux/kallsyms.h                    |    2 +-
 include/linux/spinlock.h                    |   17 +-
 include/uapi/linux/android/binder.h         |   28 +-
 init/Kconfig                                |   28 +
 kernel/kallsyms.c                           |    7 +
 kernel/livepatch/core.c                     |    4 +-
 kernel/printk/printk.c                      |    5 +-
 lib/Kconfig.debug                           |  144 +
 lib/vsprintf.c                              |   12 +
 rust/.gitignore                             |    6 +
 rust/Makefile                               |  316 ++
 rust/alloc/README.md                        |   32 +
 rust/alloc/alloc.rs                         |  425 +++
 rust/alloc/borrow.rs                        |  493 +++
 rust/alloc/boxed.rs                         | 1728 ++++++++++
 rust/alloc/collections/mod.rs               |  116 +
 rust/alloc/fmt.rs                           |  587 ++++
 rust/alloc/lib.rs                           |  197 ++
 rust/alloc/macros.rs                        |  128 +
 rust/alloc/prelude/mod.rs                   |   17 +
 rust/alloc/prelude/v1.rs                    |   16 +
 rust/alloc/raw_vec.rs                       |  612 ++++
 rust/alloc/rc.rs                            | 2539 +++++++++++++++
 rust/alloc/slice.rs                         | 1271 ++++++++
 rust/alloc/str.rs                           |  614 ++++
 rust/alloc/string.rs                        | 2847 ++++++++++++++++
 rust/alloc/sync.rs                          | 2631 +++++++++++++++
 rust/alloc/vec/drain.rs                     |  157 +
 rust/alloc/vec/drain_filter.rs              |  145 +
 rust/alloc/vec/into_iter.rs                 |  296 ++
 rust/alloc/vec/is_zero.rs                   |  106 +
 rust/alloc/vec/mod.rs                       | 3255 +++++++++++++++++++
 rust/alloc/vec/partial_eq.rs                |   49 +
 rust/alloc/vec/set_len_on_drop.rs           |   30 +
 rust/alloc/vec/spec_extend.rs               |  170 +
 rust/bindgen_parameters                     |   13 +
 rust/build_error.rs                         |   33 +
 rust/compiler_builtins.rs                   |  146 +
 rust/exports.c                              |   16 +
 rust/helpers.c                              |  235 ++
 rust/kernel/allocator.rs                    |   63 +
 rust/kernel/bindings.rs                     |   28 +
 rust/kernel/bindings_helper.h               |   24 +
 rust/kernel/buffer.rs                       |   39 +
 rust/kernel/build_assert.rs                 |   80 +
 rust/kernel/c_types.rs                      |  119 +
 rust/kernel/chrdev.rs                       |  212 ++
 rust/kernel/error.rs                        |  272 ++
 rust/kernel/file.rs                         |  130 +
 rust/kernel/file_operations.rs              |  698 ++++
 rust/kernel/io_buffer.rs                    |  153 +
 rust/kernel/iov_iter.rs                     |   95 +
 rust/kernel/lib.rs                          |  220 ++
 rust/kernel/linked_list.rs                  |  245 ++
 rust/kernel/miscdev.rs                      |  113 +
 rust/kernel/module_param.rs                 |  497 +++
 rust/kernel/of.rs                           |  101 +
 rust/kernel/pages.rs                        |  176 +
 rust/kernel/platdev.rs                      |  166 +
 rust/kernel/prelude.rs                      |   28 +
 rust/kernel/print.rs                        |  412 +++
 rust/kernel/random.rs                       |   50 +
 rust/kernel/raw_list.rs                     |  361 ++
 rust/kernel/rbtree.rs                       |  570 ++++
 rust/kernel/security.rs                     |   79 +
 rust/kernel/static_assert.rs                |   39 +
 rust/kernel/str.rs                          |  259 ++
 rust/kernel/sync/arc.rs                     |  227 ++
 rust/kernel/sync/condvar.rs                 |  136 +
 rust/kernel/sync/guard.rs                   |   82 +
 rust/kernel/sync/locked_by.rs               |  112 +
 rust/kernel/sync/mod.rs                     |   84 +
 rust/kernel/sync/mutex.rs                   |  101 +
 rust/kernel/sync/spinlock.rs                |  109 +
 rust/kernel/sysctl.rs                       |  198 ++
 rust/kernel/task.rs                         |  193 ++
 rust/kernel/traits.rs                       |   26 +
 rust/kernel/types.rs                        |  249 ++
 rust/kernel/user_ptr.rs                     |  191 ++
 rust/macros/lib.rs                          |  127 +
 rust/macros/module.rs                       |  754 +++++
 samples/Kconfig                             |    2 +
 samples/Makefile                            |    1 +
 samples/rust/Kconfig                        |  113 +
 samples/rust/Makefile                       |   12 +
 samples/rust/rust_chrdev.rs                 |   51 +
 samples/rust/rust_minimal.rs                |   38 +
 samples/rust/rust_miscdev.rs                |  150 +
 samples/rust/rust_module_parameters.rs      |   72 +
 samples/rust/rust_print.rs                  |   57 +
 samples/rust/rust_random.rs                 |   61 +
 samples/rust/rust_semaphore.rs              |  177 +
 samples/rust/rust_semaphore_c.c             |  212 ++
 samples/rust/rust_stack_probing.rs          |   40 +
 samples/rust/rust_sync.rs                   |   81 +
 scripts/Makefile.build                      |   22 +
 scripts/Makefile.lib                        |   12 +
 scripts/generate_rust_analyzer.py           |  143 +
 scripts/kallsyms.c                          |   33 +-
 scripts/kconfig/confdata.c                  |   67 +-
 scripts/rust-version.sh                     |   31 +
 tools/include/linux/kallsyms.h              |    2 +-
 tools/include/linux/lockdep.h               |    2 +-
 tools/lib/perf/include/perf/event.h         |    2 +-
 tools/lib/symbol/kallsyms.h                 |    2 +-
 141 files changed, 33003 insertions(+), 45 deletions(-)
 create mode 100644 .rustfmt.toml
 create mode 100644 Documentation/rust/arch-support.rst
 create mode 100644 Documentation/rust/assets/favicon-16x16.png
 create mode 100644 Documentation/rust/assets/favicon-32x32.png
 create mode 100644 Documentation/rust/assets/rust-logo.png
 create mode 100644 Documentation/rust/coding.rst
 create mode 100644 Documentation/rust/docs.rst
 create mode 100644 Documentation/rust/index.rst
 create mode 100644 Documentation/rust/quick-start.rst
 create mode 100644 arch/arm/rust/target.json
 create mode 100644 arch/arm64/rust/target.json
 create mode 100644 arch/powerpc/rust/target.json
 create mode 100644 arch/riscv/rust/rv32ima.json
 create mode 100644 arch/riscv/rust/rv32imac.json
 create mode 100644 arch/riscv/rust/rv64ima.json
 create mode 100644 arch/riscv/rust/rv64imac.json
 create mode 100644 arch/x86/rust/target.json
 create mode 100644 drivers/android/allocation.rs
 create mode 100644 drivers/android/context.rs
 create mode 100644 drivers/android/defs.rs
 create mode 100644 drivers/android/node.rs
 create mode 100644 drivers/android/process.rs
 create mode 100644 drivers/android/range_alloc.rs
 create mode 100644 drivers/android/rust_binder.rs
 create mode 100644 drivers/android/thread.rs
 create mode 100644 drivers/android/transaction.rs
 create mode 100644 rust/.gitignore
 create mode 100644 rust/Makefile
 create mode 100644 rust/alloc/README.md
 create mode 100644 rust/alloc/alloc.rs
 create mode 100644 rust/alloc/borrow.rs
 create mode 100644 rust/alloc/boxed.rs
 create mode 100644 rust/alloc/collections/mod.rs
 create mode 100644 rust/alloc/fmt.rs
 create mode 100644 rust/alloc/lib.rs
 create mode 100644 rust/alloc/macros.rs
 create mode 100644 rust/alloc/prelude/mod.rs
 create mode 100644 rust/alloc/prelude/v1.rs
 create mode 100644 rust/alloc/raw_vec.rs
 create mode 100644 rust/alloc/rc.rs
 create mode 100644 rust/alloc/slice.rs
 create mode 100644 rust/alloc/str.rs
 create mode 100644 rust/alloc/string.rs
 create mode 100644 rust/alloc/sync.rs
 create mode 100644 rust/alloc/vec/drain.rs
 create mode 100644 rust/alloc/vec/drain_filter.rs
 create mode 100644 rust/alloc/vec/into_iter.rs
 create mode 100644 rust/alloc/vec/is_zero.rs
 create mode 100644 rust/alloc/vec/mod.rs
 create mode 100644 rust/alloc/vec/partial_eq.rs
 create mode 100644 rust/alloc/vec/set_len_on_drop.rs
 create mode 100644 rust/alloc/vec/spec_extend.rs
 create mode 100644 rust/bindgen_parameters
 create mode 100644 rust/build_error.rs
 create mode 100644 rust/compiler_builtins.rs
 create mode 100644 rust/exports.c
 create mode 100644 rust/helpers.c
 create mode 100644 rust/kernel/allocator.rs
 create mode 100644 rust/kernel/bindings.rs
 create mode 100644 rust/kernel/bindings_helper.h
 create mode 100644 rust/kernel/buffer.rs
 create mode 100644 rust/kernel/build_assert.rs
 create mode 100644 rust/kernel/c_types.rs
 create mode 100644 rust/kernel/chrdev.rs
 create mode 100644 rust/kernel/error.rs
 create mode 100644 rust/kernel/file.rs
 create mode 100644 rust/kernel/file_operations.rs
 create mode 100644 rust/kernel/io_buffer.rs
 create mode 100644 rust/kernel/iov_iter.rs
 create mode 100644 rust/kernel/lib.rs
 create mode 100644 rust/kernel/linked_list.rs
 create mode 100644 rust/kernel/miscdev.rs
 create mode 100644 rust/kernel/module_param.rs
 create mode 100644 rust/kernel/of.rs
 create mode 100644 rust/kernel/pages.rs
 create mode 100644 rust/kernel/platdev.rs
 create mode 100644 rust/kernel/prelude.rs
 create mode 100644 rust/kernel/print.rs
 create mode 100644 rust/kernel/random.rs
 create mode 100644 rust/kernel/raw_list.rs
 create mode 100644 rust/kernel/rbtree.rs
 create mode 100644 rust/kernel/security.rs
 create mode 100644 rust/kernel/static_assert.rs
 create mode 100644 rust/kernel/str.rs
 create mode 100644 rust/kernel/sync/arc.rs
 create mode 100644 rust/kernel/sync/condvar.rs
 create mode 100644 rust/kernel/sync/guard.rs
 create mode 100644 rust/kernel/sync/locked_by.rs
 create mode 100644 rust/kernel/sync/mod.rs
 create mode 100644 rust/kernel/sync/mutex.rs
 create mode 100644 rust/kernel/sync/spinlock.rs
 create mode 100644 rust/kernel/sysctl.rs
 create mode 100644 rust/kernel/task.rs
 create mode 100644 rust/kernel/traits.rs
 create mode 100644 rust/kernel/types.rs
 create mode 100644 rust/kernel/user_ptr.rs
 create mode 100644 rust/macros/lib.rs
 create mode 100644 rust/macros/module.rs
 create mode 100644 samples/rust/Kconfig
 create mode 100644 samples/rust/Makefile
 create mode 100644 samples/rust/rust_chrdev.rs
 create mode 100644 samples/rust/rust_minimal.rs
 create mode 100644 samples/rust/rust_miscdev.rs
 create mode 100644 samples/rust/rust_module_parameters.rs
 create mode 100644 samples/rust/rust_print.rs
 create mode 100644 samples/rust/rust_random.rs
 create mode 100644 samples/rust/rust_semaphore.rs
 create mode 100644 samples/rust/rust_semaphore_c.c
 create mode 100644 samples/rust/rust_stack_probing.rs
 create mode 100644 samples/rust/rust_sync.rs
 create mode 100755 scripts/generate_rust_analyzer.py
 create mode 100755 scripts/rust-version.sh

-- 
2.32.0

