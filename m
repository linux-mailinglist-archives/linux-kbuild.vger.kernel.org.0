Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEED535FAEB
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Apr 2021 20:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352808AbhDNSqo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 14:46:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:49054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231288AbhDNSqn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 14:46:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EFA36113D;
        Wed, 14 Apr 2021 18:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618425981;
        bh=LWiNBcdRq9g8WyKFXlEPana5Fkd8G/OMSRVIX6rFlXk=;
        h=From:To:Cc:Subject:Date:From;
        b=C2mZ4XZ6CPKtDDbx0Bbm4IjTUC59iVyqRT/UNLtt5IMl6eQUjPHXHupIeQvZZ9UwK
         jdIo2eB/3dBtEmQbWAeNfKCgbtlSCl3mkq05ShCTirGd0ryS5AqDCJ/FnekEJ9jMES
         wwc9d4cOOwWT+MXJ1M8plFm/Yi/NFdyWb2ulHcZJCfMt6b9aNzDcQRn91g1xWtqzd+
         5izlP7eKNLWebOQ4UgI1JEgxPGN/k5bjbO02b2mCX1bYZf5QvcyTehg+qe5BlzzqcK
         wL88yyEz9gduG7tj3koA05IQUmAMkeaa3+Q4rfCXUQgw6AqmsHdr2FqObF8VNLXzAf
         BQLuuOo+EYwPg==
From:   ojeda@kernel.org
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH 00/13] [RFC] Rust support
Date:   Wed, 14 Apr 2021 20:45:51 +0200
Message-Id: <20210414184604.23473-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Miguel Ojeda <ojeda@kernel.org>

Some of you have noticed the past few weeks and months that
a serious attempt to bring a second language to the kernel was
being forged. We are finally here, with an RFC that adds support
for Rust to the Linux kernel.

This cover letter is fairly long, since there are quite a few topics
to describe, but I hope it answers as many questions as possible
before the discussion starts.

If you are interested in following this effort, please join us
in the mailing list at:

    rust-for-linux@vger.kernel.org

and take a look at the project itself at:

    https://github.com/Rust-for-Linux

Cheers,
Miguel


# A second language in the kernel

We know there are huge costs and risks in introducing a new main
language in the kernel. We risk dividing efforts and we increase
the knowledge required to contribute to some parts of the kernel.

Most importantly, any new language introduced means any module
written in that language will be way harder to replace later on
if the support for the new language gets dropped.

Nevertheless, we believe that, even today, the advantages of using
Rust outweighs the cost. We will explain why in the following
sections.

Please note that the Rust support is intended to enable writing
drivers and similar "leaf" modules in Rust, at least for the
foreseeable future. In particular, we do not intend to rewrite
the kernel core nor the major kernel subsystems (e.g. `kernel/`,
`mm/`, `sched/`...). Instead, the Rust support is built on top
of those.


## Goals

By using Rust in the Linux kernel, our hope is that:

  - New code written in Rust has a reduced risk of memory safety bugs,
    data races and logic bugs overall, thanks to the language
    properties mentioned below.

  - Maintainers are more confident in refactoring and accepting
    patches for modules thanks to the safe subset of Rust.

  - New drivers and modules become easier to write, thanks to
    abstractions that are easier to reason about, based on modern
    language features, as well as backed by detailed documentation.

  - More people get involved overall in developing the kernel
    thanks to the usage of a modern language.

  - By taking advantage of Rust tooling, we keep enforcing the
    documentation guidelines we have established so far in the
    project. For instance, we require having all public APIs, safety
    preconditions, `unsafe` blocks and type invariants documented.


## Why Rust?

Rust is a systems programming language that brings several key
advantages over C in the context of the Linux kernel:

  - No undefined behavior in the safe subset (when unsafe code is
    sound), including memory safety and the absence of data races.

  - Stricter type system for further reduction of logic errors.

  - A clear distinction between safe and `unsafe` code.

  - Featureful language: sum types, pattern matching, generics,
    RAII, lifetimes, shared & exclusive references, modules &
    visibility, powerful hygienic and procedural macros...

  - Extensive freestanding standard library: vocabulary types such
    as `Result` and `Option`, iterators, formatting, pinning,
    checked/saturating/wrapping integer arithmetic, etc.

  - Integrated out of the box tooling: documentation generator,
    formatter and linter all based on the compiler itself.

Overall, Rust is a language that has successfully leveraged decades
of experience from system programming languages as well as functional
ones, and added lifetimes and borrow checking on top.


## Why not?

Rust also has disadvantages compared to C in the context of
the Linux kernel:

  - The many years of effort in tooling for C around the kernel,
    including compiler plugins, sanitizers, Coccinelle, lockdep,
    sparse... However, this will likely improve if Rust usage in
    the kernel grows over time.

  - Single implementation based on LLVM. There are third-party
    efforts underway to fix this, such as a GCC frontend,
    a `rustc` backend based on Cranelift and `mrustc`,
    a compiler intended to reduce the bootstrapping chain.
    Any help for those projects would be very welcome!

  - Not standardized. While it is not clear whether standardization
    would be beneficial for the kernel, several points minimize
    this issue in any case: the Rust stability promise, the extensive
    documentation, the WIP reference, the detailed RFCs...

  - Slower compilation in general, due to more complex language
    features and limitations in the current compiler.

  - At the present time, we require certain nightly features.
    That is, features that are not available in the stable compiler.
    Nevertheless, we aim to remove this restriction within a year
    by either `rustc` landing the features in stable or removing
    our usage of them otherwise. We maintain a report here:

        https://github.com/Rust-for-Linux/linux/issues/2

  - Bigger than needed text currently, due to the unused parts from
    the `core` and `alloc` Rust standard libraries. We plan to address
    this over time.

Most of these disadvantages arise from the fact that Rust is a much
younger and less used language. However, we believe Rust is likely
to become an important part of systems programming, just as C has been
during the last decades, and so most of these issues will be reduced
as different industries put resources behind Rust.


## Design

There are a few key design choices to have in mind.

First of all, Rust kernel modules require some shared code that is
enabled via a configuration option (`CONFIG_RUST`). This makes
individual modules way smaller. This support consists of:

  - The Rust standard library. Currently `core` and `alloc`, but
    likely only a subset of `core` in the future. These pieces
    are basically the equivalent of the freestanding subset of
    the C standard library.

  - The abstractions wrapping the kernel APIs. These live inside
    `rust/kernel/`. The intention is to make these as safe as
    possible so that modules written in Rust require the smallest
    amount of `unsafe` code possible.

  - Other bits such as the `module!` procedural macro, the compiler
    builtins, the generated bindings and helpers, etc.

This support takes a fair amount of space, although it will be
reduced since there are some features from the Rust standard library
that we do not use.

Here are some examples from a small x86_64 config we use in the CI:

       text    data     bss      dec

    7464833 1492128 2301996 11258957 vmlinux (without Rust support)
    7682527 1709252 2301996 11693775 vmlinux (with    Rust support)
    7682527 1721540 2301996 11706063 vmlinux (plus overflow checks)

       2224       0      16     2240 samples/rust/rust_semaphore_c.o
       3694       0      10     3704 samples/rust/rust_semaphore.o
       2367     768      16     3151 samples/rust/rust_semaphore_c.ko
       3829     768      10     4607 samples/rust/rust_semaphore.ko

      80554    5904   20249   106707 drivers/android/binder.o
      12365    1240       9    13614 drivers/android/binder_alloc.o
      92818       8      16    92842 drivers/android/rust_binder.o

That is a 3% increase in text and a 4% increase in the total for
`vmlinux` with overflow checking enabled. The modules themselves are
relatively close to their C alternatives.

In the table above we can also see the comparison between Binder and
its Rust port prototype. Please note that while the Rust version is
not equivalent to the C original module yet, it is close enough to
provide a rough estimation. Here, we see the sum of the texts of the
C Binder are less than that of the Rust driver, while the total column
is bigger.

Secondly, modules written in Rust should never use the C kernel APIs
directly. The whole point of using Rust in the kernel is that
we develop safe abstractions so that modules are easier to reason
about and, therefore, to review, refactor, etc.

Furthermore, the bindings to the C side of the kernel are generated
on-the-fly via `bindgen` (an official Rust tool). Using it allows us
to avoid the need to update the bindings on the Rust side.

Macros still need to be handled manually, and some functions are
inlined, which requires us to create helpers to call them from Rust.

Thirdly, in Rust code bases, most documentation is written alongside
the source code, in Markdown. We follow this convention, thus while
we have a few general documents in `Documentation/rust/`, most of
the actual documentation is in the source code itself.

In order to read this documentation easily, Rust provides a tool
to generate HTML documentation, just like Sphinx/kernel-doc, but
suited to Rust code bases and the language concepts.

Moreover, as explained above, we are taking the chance to enforce
some documentation guidelines. We are also enforcing automatic code
formatting, a set of Clippy lints, etc. We decided to go with Rust's
idiomatic style, i.e. keeping `rustfmt` defaults. For instance, this
means 4 spaces are used for indentation, rather than a tab. We are
happy to change that if needed -- we think what is important is
keeping the formatting automated.

Finally, to avoid exposing GPL symbols as non-GPL (even indirectly),
we export all our Rust support symbols in the kernel as GPL.


## Status

The Rust support presented here is experimental and many kernel APIs
and abstractions are, of course, missing. Covering the entire API
surface of the kernel will take a long time to develop and mature.
Other implementation details are also a work in progress.

However, the support is good enough that prototyping modules can
start today. This RFC includes a working port of an existing module:
Binder, the Android IPC mechanism. While it is not meant to be used
in production just yet, it showcases what can already be done and how
actual Rust modules could look like in the future.

Regarding compilers, we support Clang-built kernels as well as
`LLVM=1` builds where possible (i.e. as long as supported by
the ClangBuiltLinux project). We also maintain some configurations
of GCC-built kernels working, but they are not intended to be used
at the present time. Having a `bindgen` backend for GCC would be
ideal to improve support for those builds.

Concerning architectures, we already support `x86_64`, `arm64` and
`ppc64le`. Adding support for variants of those as well as `riscv`,
`s390` and `mips` should be possible with some work.

We also joined `linux-next` (with a special waiver). Currently,
the support is gated behind `!COMPILE_TEST` since we did not want
to break any production CIs by mistake, but if feedback for this RFC
is positive, then we will remove that restriction.


## Upstreaming plan

As usual, getting into mainline early is the best way forward to
sort out any missing details, so we are happy to send these changes
as soon as the upcoming merge window.

However, at which point we submit them will depend on the feedback
we receive on this RFC and what the overall sentiment from
high-level maintainers is.


## Reviewing this RFC

We would like to get comments from the perspective of module writers.
In particular on the samples in patch 9 and on Binder in patch 13.
That is, as a module writer, how do you feel about the Rust code
shown there? Do you see yourself writing similar Rust code in
the future, taking into account the safety/no-UB benefits?

Comments on the Rust abstractions themselves and other details of
this RFC are, of course, welcome, but please note that they are
a work in progress.

Another important topic we would like feedback on is the Rust
"native" documentation that is written alongside the code, as
explained above. We have uploaded it here:

    https://rust-for-linux.github.io/docs/kernel/

We like how this kind of generated documentation looks. Please take
a look and let us know what you think!


## Testing this RFC

If you want to test things out, please follow the Quick Start guide
in `Documentation/rust/quick-start.rst`. It will help you setup Rust
and the rest of the tools needed to build and test this RFC.

At the time of writing, the RFC series matches our main repository,
but if you want to follow along, check out the `rust` branch from
our main tree:

    https://github.com/Rust-for-Linux/linux.git


## Acknowledgements

The signatures in the main commits correspond to the people that
wrote code that has ended up in them at the present time. However,
we would like to give credit to everyone that has contributed in
one way or another to the Rust for Linux project:

  - Alex Gaynor and Geoffrey Thomas wrote the first safe Rust
    abstractions for kernel features (such as `chrdev`, `printk`,
    `random`, `sysctl`...) and used them in a framework to build
    out-of-tree modules in Rust leveraging `bindgen` for bindings.
    They presented their work at the Linux Security Summit 2019.

  - Nick Desaulniers bravely raised the Rust topic in the LKML and
    organized a talk at the Linux Plumbers Conference 2020. He also
    pulled some strings to move things forward!

  - Miguel Ojeda created the Rust for Linux project to group
    the different efforts/people in one place and kickstarted it by
    adding Kbuild support for Rust into the kernel, integrating Alex's
    and Geoffrey's abstractions into what is now `rust/kernel/`
    and adding support for built-in modules and sharing the common
    Rust code. He kept working on writing the infrastructure
    foundations: the `module!` proc macro and new printing macros,
    the exports and compiler builtins magic, the kernel config symbols
    for conditional compilation, the different Rust tooling
    integrations, the documentation, the CI... He fixed a couple bits
    in `rustc` and `rustdoc` that were needed for the kernel.
    He is coordinating the project.

  - Alex Gaynor has spent a lot of time reviewing the majority of
    PRs after the integration took place, cleaned up a few of the
    abstractions further, added support for `THIS_MODULE`...
    He is a maintainer of the project.

  - Wedson Almeida Filho wrote most of the rest of the abstractions,
    including all the synchronization ones in `rust/kernel/sync/`,
    a better abstraction for file operations, support for ioctls,
    miscellaneous devices, failing allocations, `container_of!` and
    `offset_of!`... These are all needed for his Binder (Android IPC)
    Rust module, which is the first Rust kernel module intended for
    (eventual) production. He is a maintainer of the project.

  - Adam Bratschi-Kaye added support for `charp`, array, string and
    integer module parameter types, the `fsync` file operation,
    the stack probing test... He has also attended most meetings and
    reviewed some PRs.

  - Finn Behrens worked on `O=` builds and NixOS support, the Rust
    confdata printer, testing the Kbuild support as well as sending
    proposals for a couple new abstractions. He has attended a few
    meetings and reviewed some PRs even while busy with his studies.

  - Manish Goregaokar implemented the fallible `Box`, `Arc`, and `Rc`
    allocator APIs in Rust's `alloc` standard library for us.

  - Boqun Feng is working hard on the different options for
    threading abstractions and has reviewed most of the `sync` PRs.

  - Michael Ellerman added initial support for ppc64le and actively
    reviews further changes and issues related to it.

  - Dan Robertson is working on adding softdeps to the `module!`
    macro.

  - Sumera Priyadarsini worked on improving the error messages for
    the `module!` macro.

  - Ngo Iok Ui (Wu Yu Wei) worked on generating `core` and `alloc`
    docs locally too, although in the end we could not merge it.

  - Geoffrey Thomas kept giving us a lot of valuable input from his
    experience implementing some of the abstractions and never
    missed a meeting.

  - bjorn3 for his knowledgeable input on `rustc` internals and
    reviewing related code.

  - Josh Triplett helped us move forward the project early on in
    the Plumbers conference and acts as liaison to the core Rust team.

  - John Ericson worked on advancing `cargo`'s `-Zbuild-std` support,
    the Rust compiler targets and joined a few of the meetings.

  - Joshua Abraham reviewed a few PRs and joined some of
    the meetings.

  - Konstantin Ryabitsev for his patience with all the requests
    regarding Rust for Linux within the kernel.org infrastructure.

  - Stephen Rothwell for his flexibility and help on including
    the project into linux-next.

  - John 'Warthog9' Hawley and David S. Miller for setting up the
    rust-for-linux@vger.kernel.org mailing list.

  - Jonathan Corbet for his feedback on the Rust documentation,
    Markdown and the different choices we will need to discuss.

  - Guillaume Gomez and Joshua Nelson for early feedback on
    a proposal on an external references map file for `rustdoc`
    that would allow us to easily link to Sphinx/C entries.

  - Many folks that have reported issues, tested the project,
    helped spread the word, joined discussions and contributed in
    other ways! In no particular order: Pavel Machek, Geert Stappers,
    Kees Cook, Milan, Daniel Kolsoi, Arnd Bergmann, ahomescu,
    Josh Stone, Manas, Christian Brauner, Boris-Chengbiao Zhou,
    Luis Gerhorst...

Miguel Ojeda (12):
  kallsyms: Support "big" kernel symbols (2-byte lengths)
  kallsyms: Increase maximum kernel symbol length to 512
  Makefile: Generate CLANG_FLAGS even in GCC builds
  Kbuild: Rust support
  Rust: Compiler builtins crate
  Rust: Module crate
  Rust: Kernel crate
  Rust: Export generated symbols
  Samples: Rust examples
  Documentation: Rust general information
  MAINTAINERS: Rust
  Rust: add abstractions for Binder (WIP)

Wedson Almeida Filho (1):
  Android: Binder IPC in Rust (WIP)

 .gitignore                             |   2 +
 .rustfmt.toml                          |  12 +
 Documentation/doc-guide/kernel-doc.rst |   3 +
 Documentation/index.rst                |   1 +
 Documentation/kbuild/kbuild.rst        |   4 +
 Documentation/process/changes.rst      |   9 +
 Documentation/rust/arch-support.rst    |  29 +
 Documentation/rust/coding.rst          |  92 +++
 Documentation/rust/docs.rst            | 109 +++
 Documentation/rust/index.rst           |  20 +
 Documentation/rust/quick-start.rst     | 203 ++++++
 MAINTAINERS                            |  14 +
 Makefile                               | 147 +++-
 arch/arm64/rust/target.json            |  40 ++
 arch/powerpc/rust/target.json          |  30 +
 arch/x86/rust/target.json              |  42 ++
 drivers/android/Kconfig                |   7 +
 drivers/android/Makefile               |   2 +
 drivers/android/allocation.rs          | 252 +++++++
 drivers/android/context.rs             |  80 +++
 drivers/android/defs.rs                |  92 +++
 drivers/android/node.rs                | 479 +++++++++++++
 drivers/android/process.rs             | 950 +++++++++++++++++++++++++
 drivers/android/range_alloc.rs         | 191 +++++
 drivers/android/rust_binder.rs         | 128 ++++
 drivers/android/thread.rs              | 821 +++++++++++++++++++++
 drivers/android/transaction.rs         | 206 ++++++
 include/linux/kallsyms.h               |   2 +-
 include/linux/spinlock.h               |  17 +-
 include/uapi/linux/android/binder.h    |  22 +-
 init/Kconfig                           |  27 +
 kernel/kallsyms.c                      |   7 +
 kernel/livepatch/core.c                |   4 +-
 kernel/printk/printk.c                 |   2 +
 lib/Kconfig.debug                      | 100 +++
 rust/.gitignore                        |   5 +
 rust/Makefile                          | 152 ++++
 rust/compiler_builtins.rs              | 146 ++++
 rust/exports.c                         |  16 +
 rust/helpers.c                         |  86 +++
 rust/kernel/allocator.rs               |  68 ++
 rust/kernel/bindings.rs                |  22 +
 rust/kernel/bindings_helper.h          |  18 +
 rust/kernel/buffer.rs                  |  39 +
 rust/kernel/c_types.rs                 | 133 ++++
 rust/kernel/chrdev.rs                  | 162 +++++
 rust/kernel/error.rs                   | 106 +++
 rust/kernel/file_operations.rs         | 668 +++++++++++++++++
 rust/kernel/lib.rs                     | 200 ++++++
 rust/kernel/linked_list.rs             | 245 +++++++
 rust/kernel/miscdev.rs                 | 109 +++
 rust/kernel/module_param.rs            | 497 +++++++++++++
 rust/kernel/pages.rs                   | 173 +++++
 rust/kernel/prelude.rs                 |  22 +
 rust/kernel/print.rs                   | 461 ++++++++++++
 rust/kernel/random.rs                  |  50 ++
 rust/kernel/raw_list.rs                | 361 ++++++++++
 rust/kernel/static_assert.rs           |  38 +
 rust/kernel/sync/arc.rs                | 184 +++++
 rust/kernel/sync/condvar.rs            | 138 ++++
 rust/kernel/sync/guard.rs              |  82 +++
 rust/kernel/sync/locked_by.rs          | 112 +++
 rust/kernel/sync/mod.rs                |  68 ++
 rust/kernel/sync/mutex.rs              | 101 +++
 rust/kernel/sync/spinlock.rs           | 108 +++
 rust/kernel/sysctl.rs                  | 185 +++++
 rust/kernel/types.rs                   |  73 ++
 rust/kernel/user_ptr.rs                | 282 ++++++++
 rust/module.rs                         | 685 ++++++++++++++++++
 samples/Kconfig                        |   2 +
 samples/Makefile                       |   1 +
 samples/rust/Kconfig                   | 103 +++
 samples/rust/Makefile                  |  11 +
 samples/rust/rust_chrdev.rs            |  66 ++
 samples/rust/rust_minimal.rs           |  40 ++
 samples/rust/rust_miscdev.rs           | 145 ++++
 samples/rust/rust_module_parameters.rs |  72 ++
 samples/rust/rust_print.rs             |  58 ++
 samples/rust/rust_semaphore.rs         | 178 +++++
 samples/rust/rust_semaphore_c.c        | 212 ++++++
 samples/rust/rust_stack_probing.rs     |  42 ++
 samples/rust/rust_sync.rs              |  84 +++
 scripts/Makefile.build                 |  19 +
 scripts/Makefile.lib                   |  12 +
 scripts/kallsyms.c                     |  33 +-
 scripts/kconfig/confdata.c             |  67 +-
 scripts/rust-version.sh                |  31 +
 tools/include/linux/kallsyms.h         |   2 +-
 tools/include/linux/lockdep.h          |   2 +-
 tools/lib/perf/include/perf/event.h    |   2 +-
 tools/lib/symbol/kallsyms.h            |   2 +-
 91 files changed, 11080 insertions(+), 45 deletions(-)
 create mode 100644 .rustfmt.toml
 create mode 100644 Documentation/rust/arch-support.rst
 create mode 100644 Documentation/rust/coding.rst
 create mode 100644 Documentation/rust/docs.rst
 create mode 100644 Documentation/rust/index.rst
 create mode 100644 Documentation/rust/quick-start.rst
 create mode 100644 arch/arm64/rust/target.json
 create mode 100644 arch/powerpc/rust/target.json
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
 create mode 100644 rust/compiler_builtins.rs
 create mode 100644 rust/exports.c
 create mode 100644 rust/helpers.c
 create mode 100644 rust/kernel/allocator.rs
 create mode 100644 rust/kernel/bindings.rs
 create mode 100644 rust/kernel/bindings_helper.h
 create mode 100644 rust/kernel/buffer.rs
 create mode 100644 rust/kernel/c_types.rs
 create mode 100644 rust/kernel/chrdev.rs
 create mode 100644 rust/kernel/error.rs
 create mode 100644 rust/kernel/file_operations.rs
 create mode 100644 rust/kernel/lib.rs
 create mode 100644 rust/kernel/linked_list.rs
 create mode 100644 rust/kernel/miscdev.rs
 create mode 100644 rust/kernel/module_param.rs
 create mode 100644 rust/kernel/pages.rs
 create mode 100644 rust/kernel/prelude.rs
 create mode 100644 rust/kernel/print.rs
 create mode 100644 rust/kernel/random.rs
 create mode 100644 rust/kernel/raw_list.rs
 create mode 100644 rust/kernel/static_assert.rs
 create mode 100644 rust/kernel/sync/arc.rs
 create mode 100644 rust/kernel/sync/condvar.rs
 create mode 100644 rust/kernel/sync/guard.rs
 create mode 100644 rust/kernel/sync/locked_by.rs
 create mode 100644 rust/kernel/sync/mod.rs
 create mode 100644 rust/kernel/sync/mutex.rs
 create mode 100644 rust/kernel/sync/spinlock.rs
 create mode 100644 rust/kernel/sysctl.rs
 create mode 100644 rust/kernel/types.rs
 create mode 100644 rust/kernel/user_ptr.rs
 create mode 100644 rust/module.rs
 create mode 100644 samples/rust/Kconfig
 create mode 100644 samples/rust/Makefile
 create mode 100644 samples/rust/rust_chrdev.rs
 create mode 100644 samples/rust/rust_minimal.rs
 create mode 100644 samples/rust/rust_miscdev.rs
 create mode 100644 samples/rust/rust_module_parameters.rs
 create mode 100644 samples/rust/rust_print.rs
 create mode 100644 samples/rust/rust_semaphore.rs
 create mode 100644 samples/rust/rust_semaphore_c.c
 create mode 100644 samples/rust/rust_stack_probing.rs
 create mode 100644 samples/rust/rust_sync.rs
 create mode 100755 scripts/rust-version.sh

-- 
2.17.1

