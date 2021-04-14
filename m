Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213ED35FDA9
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 00:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhDNWSj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 18:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhDNWSe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 18:18:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6CFDC061761
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 15:18:11 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 12so35660185lfq.13
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 15:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aizIZg70s6/VHTBVselH9PnfIOGDfWH/MzY7uQIPbQc=;
        b=ZZxLYvjCYtcqL2Md1286s9j6YfeJUVT8GmtYAXOb4pAiQKdq+zpv7mT7h+03Cui58T
         /fy9fpC3rMh11n0Lo31iWYzqeQogJfdt+QXFBDn1/x7mssFH+g+08GBvTo7wPTMEbmaw
         LWYvFaMAFESK9Nv7ENQItsyBtpq9zwW6qGjJBW+1K0S5g7elRcSKY95ntu5ee7yAlnPO
         Q9jOEKMw5pNlDCNpSEgP4haEeveazbvb6SIZ+d+jZXOz0MkmwU69ve101UNUvmkF1+a6
         PwffMYvKw62BEX/qqRODXYZDPfqrED6b5P+a2ogdpgKAkOz5FUkJUPGr2h8HrQA4UnIy
         Oqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aizIZg70s6/VHTBVselH9PnfIOGDfWH/MzY7uQIPbQc=;
        b=FzCmLiJ1euFR2d8Tetk6IaWvK4FxKt87T3byfkEvPy/gHKCGITh4Txf7bzk2oi1CFP
         lvUi/LXTQooxjrEjPqny4aATJOY+y2uwJo1axFSuyypl3X2ernHGECqgrbWTozphCikS
         r2Nbu9b0SG95rsD5Eca3aq1TfBEm3u4RDGZli9CM7zrt6X/8a/cZaiEhZ08o4bsLI9G6
         jKcUudzv/xsD4XFZ0JcfqEkMDozK8sz7EQn3CAegEdtrncTaRhGZkZ4HdDuWHM5cFhGv
         iIZOTVKF1WkNn+lC3OR2pufX/lmXeNwc5TbyU9r9Q58bWmx2MX235cD7BMUeOaLlyr6p
         hVnA==
X-Gm-Message-State: AOAM530QSleq+3JI4VMf4DnSGxq6eKcZ7k2Vrgn6bEei89rRnNOpGi6t
        x7h1yxRXUjxaFyLUSAb4yAN03aUrS6i0TUQrTQtMiQ==
X-Google-Smtp-Source: ABdhPJwZjow5SRWiOXM+2E1IsUW7zvXjLjsaG5nAZtmk+7lFhPd2w1HOp14BOOqObwBuIdZWNtz04jK9fg9IsdDmgqE=
X-Received: by 2002:a05:6512:985:: with SMTP id w5mr251209lft.122.1618438689736;
 Wed, 14 Apr 2021 15:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-11-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-11-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 15:17:57 -0700
Message-ID: <CAKwvOdmXNAm+TcypR0dCayp9bJ7RFcgLx5sB8_2MfzO31T3PJg@mail.gmail.com>
Subject: Re: [PATCH 10/13] Documentation: Rust general information
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:50 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> Most of the documentation for Rust is written within the source code
> itself, as it is idiomatic for Rust projects. This applies to both
> the shared infrastructure at `rust/` as well as any other Rust module
> (e.g. drivers) written across the kernel.
>
> These documents are general information that do not fit particularly
> well in the source code, like the quick start guide.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
> Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  Documentation/doc-guide/kernel-doc.rst |   3 +
>  Documentation/index.rst                |   1 +
>  Documentation/rust/arch-support.rst    |  29 ++++
>  Documentation/rust/coding.rst          |  92 +++++++++++
>  Documentation/rust/docs.rst            | 109 +++++++++++++
>  Documentation/rust/index.rst           |  20 +++
>  Documentation/rust/quick-start.rst     | 203 +++++++++++++++++++++++++
>  7 files changed, 457 insertions(+)
>  create mode 100644 Documentation/rust/arch-support.rst
>  create mode 100644 Documentation/rust/coding.rst
>  create mode 100644 Documentation/rust/docs.rst
>  create mode 100644 Documentation/rust/index.rst
>  create mode 100644 Documentation/rust/quick-start.rst
>
> diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
> index 79aaa55d6bcf..c655fdb9c042 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -11,6 +11,9 @@ when it is embedded in source files.
>     reasons. The kernel source contains tens of thousands of kernel-doc
>     comments. Please stick to the style described here.
>
> +.. note:: kernel-doc does not cover Rust code: please see
> +   :ref:`Documentation/rust/docs.rst <rust_docs>` instead.
> +
>  The kernel-doc structure is extracted from the comments, and proper
>  `Sphinx C Domain`_ function and type descriptions with anchors are
>  generated from them. The descriptions are filtered for special kernel-doc
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index 31f2adc8542d..3e7c43a48e68 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -82,6 +82,7 @@ merged much easier.
>     maintainer/index
>     fault-injection/index
>     livepatch/index
> +   rust/index
>
>
>  Kernel API documentation
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> new file mode 100644
> index 000000000000..d72ab2f8fa46
> --- /dev/null
> +++ b/Documentation/rust/arch-support.rst
> @@ -0,0 +1,29 @@
> +.. _rust_arch_support:
> +
> +Arch Support
> +============
> +
> +Currently, the Rust compiler (``rustc``) uses LLVM for code generation,
> +which limits the supported architectures we can target. In addition, support
> +for building the kernel with LLVM/Clang varies (see :ref:`kbuild_llvm`),
> +which ``bindgen`` relies on through ``libclang``.
> +
> +Below is a general summary of architectures that currently work. Level of
> +support corresponds to ``S`` values in the ``MAINTAINERS`` file.
> +
> +.. list-table::
> +   :widths: 10 10 10
> +   :header-rows: 1
> +
> +   * - Architecture
> +     - Level of support
> +     - Constraints
> +   * - ``arm64``
> +     - Maintained
> +     - None
> +   * - ``powerpc``
> +     - Maintained
> +     - ``ppc64le`` only, ``RUST_OPT_LEVEL >= 2``
> +   * - ``x86``
> +     - Maintained
> +     - ``x86_64`` only
> diff --git a/Documentation/rust/coding.rst b/Documentation/rust/coding.rst
> new file mode 100644
> index 000000000000..46da5fb0974c
> --- /dev/null
> +++ b/Documentation/rust/coding.rst
> @@ -0,0 +1,92 @@
> +.. _rust_coding:
> +
> +Coding
> +======
> +
> +This document describes how to write Rust code in the kernel.
> +
> +
> +Coding style
> +------------
> +
> +The code is automatically formatted using the ``rustfmt`` tool. This is very
> +good news!
> +
> +- If you contribute from time to time to the kernel, you do not need to learn
> +  and remember one more style guide. You will also need less patch roundtrips
> +  to land a change.
> +
> +- If you are a reviewer or a maintainer, you will not need to spend time on
> +  pointing out style issues anymore.
> +
> +.. note:: Conventions on comments and documentation are not checked by
> +  ``rustfmt``. Thus we still need to take care of those: please see
> +  :ref:`Documentation/rust/docs.rst <rust_docs>`.
> +
> +We use the tool's default settings. This means we are following the idiomatic
> +Rust style. For instance, we use 4 spaces for indentation rather than tabs.
> +
> +Typically, you will want to instruct your editor/IDE to format while you type,
> +when you save or at commit time. However, if for some reason you want
> +to reformat the entire kernel Rust sources at some point, you may run::
> +
> +       make rustfmt
> +
> +To check if everything is formatted (printing a diff otherwise), e.g. if you
> +have configured a CI for a tree as a maintainer, you may run::
> +
> +       make rustfmtcheck
> +
> +Like ``clang-format`` for the rest of the kernel, ``rustfmt`` works on
> +individual files, and does not require a kernel configuration. Sometimes it may
> +even work with broken code.
> +
> +
> +Extra lints
> +-----------
> +
> +While ``rustc`` is a very helpful compiler, some extra lints and analysis are
> +available via ``clippy``, a Rust linter. To enable it, pass ``CLIPPY=1`` to
> +the same invocation you use for compilation, e.g.::
> +
> +       make ARCH=... CROSS_COMPILE=... CC=... -j... CLIPPY=1
> +
> +At the moment, we do not enforce a "clippy-free" compilation, so you can treat
> +the output the same way as the extra warning levels for C, e.g. like ``W=2``.
> +Still, we use the default configuration, which is relatively conservative, so
> +it is a good idea to read any output it may produce from time to time and fix
> +the pointed out issues. The list of enabled lists will be likely tweaked over
> +time, and extra levels may end up being introduced, e.g. ``CLIPPY=2``.
> +
> +
> +Abstractions vs. bindings
> +-------------------------
> +
> +We don't have abstractions for all the kernel internal APIs and concepts,
> +but we would like to expand coverage as time goes on. Unless there is
> +a good reason not to, always use the abstractions instead of calling
> +the C bindings directly.
> +
> +If you are writing some code that requires a call to an internal kernel API
> +or concept that isn't abstracted yet, consider providing an (ideally safe)
> +abstraction for everyone to use.
> +
> +
> +Conditional compilation
> +-----------------------
> +
> +Rust code has access to conditional compilation based on the kernel
> +configuration:
> +
> +.. code-block:: rust
> +
> +       #[cfg(CONFIG_X)]      // `CONFIG_X` is enabled (`y` or `m`)
> +       #[cfg(CONFIG_X="y")]  // `CONFIG_X` is enabled as a built-in (`y`)
> +       #[cfg(CONFIG_X="m")]  // `CONFIG_X` is enabled as a module   (`m`)
> +       #[cfg(not(CONFIG_X))] // `CONFIG_X` is disabled
> +
> +
> +Documentation
> +-------------
> +
> +Please see :ref:`Documentation/rust/docs.rst <rust_docs>`.
> diff --git a/Documentation/rust/docs.rst b/Documentation/rust/docs.rst
> new file mode 100644
> index 000000000000..58c5f98ccb35
> --- /dev/null
> +++ b/Documentation/rust/docs.rst
> @@ -0,0 +1,109 @@
> +.. _rust_docs:
> +
> +Docs
> +====
> +
> +Rust kernel code is not documented like C kernel code (i.e. via kernel-doc).
> +Instead, we use the usual system for documenting Rust code: the ``rustdoc``
> +tool, which uses Markdown (a *very* lightweight markup language).
> +
> +This document describes how to make the most out of the kernel documentation
> +for Rust.
> +
> +
> +Reading the docs
> +----------------
> +
> +An advantage of using Markdown is that it attempts to make text look almost as
> +you would have written it in plain text. This makes the documentation quite
> +pleasant to read even in its source form.
> +
> +However, the generated HTML docs produced by ``rustdoc`` provide a *very* nice
> +experience, including integrated instant search, clickable items (types,
> +functions, constants, etc. -- including to all the standard Rust library ones
> +that we use in the kernel, e.g. ``core``), categorization, links to the source
> +code, etc.
> +
> +Like for the rest of the kernel documentation, pregenerated HTML docs for
> +the libraries (crates) inside ``rust/`` that are used by the rest of the kernel
> +are available at `kernel.org`_.
> +
> +// TODO: link when ready

Was this TODO meant to be removed, or is it still pending? If pending,
on what? Being able to link back on itself if/once merged?

> +
> +.. _kernel.org: http://kernel.org/
> +
> +Otherwise, you can generate them locally. This is quite fast (same order as
> +compiling the code itself) and you do not need any special tools or environment.
> +This has the added advantage that they will be tailored to your particular
> +kernel configuration. To generate them, simply use the ``rustdoc`` target with
> +the same invocation you use for compilation, e.g.::
> +
> +       make ARCH=... CROSS_COMPILE=... CC=... -j... rustdoc
> +
> +
> +Writing the docs
> +----------------
> +
> +If you already know Markdown, learning how to write Rust documentation will be
> +a breeze. If not, understanding the basics is a matter of minutes reading other
> +code. There are also many guides available out there, a particularly nice one
> +is at `GitHub`_.
> +
> +.. _GitHub: https://guides.github.com/features/mastering-markdown/#syntax
> +
> +This is how a well-documented Rust function may look like (derived from the Rust
> +standard library)::
> +
> +       /// Returns the contained [`Some`] value, consuming the `self` value,
> +       /// without checking that the value is not [`None`].
> +       ///
> +       /// # Safety
> +       ///
> +       /// Calling this method on [`None`] is *[undefined behavior]*.
> +       ///
> +       /// [undefined behavior]: https://doc.rust-lang.org/reference/behavior-considered-undefined.html
> +       ///
> +       /// # Examples
> +       ///
> +       /// ```
> +       /// let x = Some("air");
> +       /// assert_eq!(unsafe { x.unwrap_unchecked() }, "air");
> +       /// ```
> +       pub unsafe fn unwrap_unchecked(self) -> T {
> +               match self {
> +                       Some(val) => val,
> +
> +                       // SAFETY: the safety contract must be upheld by the caller.
> +                       None => unsafe { hint::unreachable_unchecked() },
> +               }
> +       }
> +
> +This example showcases a few ``rustdoc`` features and some common conventions
> +(that we also follow in the kernel):
> +
> +* The first paragraph must be a single sentence briefly describing what
> +  the documented item does. Further explanations must go in extra paragraphs.
> +
> +* ``unsafe`` functions must document the preconditions needed for a call to be
> +  safe under a ``Safety`` section.
> +
> +* While not shown here, if a function may panic, the conditions under which
> +  that happens must be described under a ``Panics`` section.

Consider if the docs need any change here based on behavior related to
Panics based on feedback thus far in the thread.

> +
> +* If providing examples of usage would help readers, they must be written in
> +  a section called ``Examples``.
> +
> +* Rust items (functions, types, constants...) will be automatically linked
> +  (``rustdoc`` will find out the URL for you).
> +
> +* Following the Rust standard library conventions, any ``unsafe`` block must be
> +  preceded by a ``SAFETY`` comment describing why the code inside is sound.
> +
> +  While sometimes the reason might look trivial and therefore unneeded, writing
> +  these comments is not just a good way of documenting what has been taken into
> +  account, but also that there are no *extra* implicit constraints.
> +
> +To learn more about how to write documentation for Rust and extra features,
> +please take a look at the ``rustdoc`` `book`_.
> +
> +.. _book: https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
> diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
> new file mode 100644
> index 000000000000..257cf2b200b8
> --- /dev/null
> +++ b/Documentation/rust/index.rst
> @@ -0,0 +1,20 @@
> +Rust
> +====
> +
> +Documentation related to Rust within the kernel. If you are starting out,
> +read the :ref:`Documentation/rust/quick-start.rst <rust_quick_start>` guide.
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +    quick-start
> +    coding
> +    docs
> +    arch-support
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> new file mode 100644
> index 000000000000..42367e4365c3
> --- /dev/null
> +++ b/Documentation/rust/quick-start.rst
> @@ -0,0 +1,203 @@
> +.. _rust_quick_start:
> +
> +Quick Start
> +===========
> +
> +This document describes how to get started with kernel development in Rust.
> +If you have worked previously with Rust, this will only take a moment.
> +
> +Please note that, at the moment, a very restricted subset of architectures
> +is supported, see :doc:`/rust/arch-support`.
> +
> +
> +Requirements: Building
> +----------------------
> +
> +This section explains how to fetch the tools needed for building.
> +
> +Some of these requirements might be available from your Linux distribution
> +under names like ``rustc``, ``rust-src``, ``rust-bindgen``, etc. However,
> +at the time of writing, they are likely to not be recent enough.
> +
> +
> +rustc
> +*****
> +
> +A recent *nightly* Rust toolchain (with, at least, ``rustc``) is required,
> +e.g. ``nightly-2021-02-20``. Our goal is to use a stable toolchain as soon
> +as possible, but for the moment we depend on a handful of nightly features.
> +
> +If you are using ``rustup``, run::
> +
> +    rustup default nightly-2021-02-20
> +
> +Please avoid the very latest nightlies (>= nightly-2021-03-05) until
> +https://github.com/Rust-for-Linux/linux/issues/135 is resolved.

That link has a comment that this was fixed.  Is the comment now stale?

> +
> +Otherwise, fetch a standalone installer or install ``rustup`` from:
> +
> +    https://www.rust-lang.org
> +
> +
> +Rust standard library source
> +****************************
> +
> +The Rust standard library source is required because the build system will
> +cross-compile ``core`` and ``alloc``.
> +
> +If you are using ``rustup``, run::
> +
> +    rustup component add rust-src
> +
> +Otherwise, if you used a standalone installer, you can clone the Rust
> +repository into the installation folder of your nightly toolchain::
> +
> +    git clone --recurse-submodules https://github.com/rust-lang/rust $(rustc --print sysroot)/lib/rustlib/src/rust
> +
> +
> +libclang
> +********
> +
> +``libclang`` (part of LLVM) is used by ``bindgen`` to understand the C code
> +in the kernel, which means you will need a recent LLVM installed; like when
> +you compile the kernel with ``CC=clang`` or ``LLVM=1``.
> +
> +Your Linux distribution is likely to have a suitable one available, so it is
> +best if you check that first.
> +
> +There are also some binaries for several systems and architectures uploaded at:
> +
> +    https://releases.llvm.org/download.html
> +
> +For Debian-based distributions, you can also fetch them from:
> +
> +    https://apt.llvm.org
> +
> +Otherwise, building LLVM takes quite a while, but it is not a complex process:
> +
> +    https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm

Perhaps worth another cross reference to :ref:`kbuild_llvm`?
https://www.kernel.org/doc/html/latest/kbuild/llvm.html#getting-llvm
Perhaps amend that then link to it from here?

> +
> +
> +bindgen
> +*******
> +
> +The bindings to the C side of the kernel are generated at build time using
> +the ``bindgen`` tool. A recent version should work, e.g. ``0.56.0``.

Avoid terms like recent and modern.  Otherwise in a few years 0.56.0
will be archaic, not recent, and you'll need to update your docs.  So
bindgen does not distribute libclang?

> +
> +Install it via (this will build the tool from source)::
> +
> +    cargo install --locked --version 0.56.0 bindgen
> +
> +
> +Requirements: Developing
> +------------------------
> +
> +This section explains how to fetch the tools needed for developing. That is,
> +if you only want to build the kernel, you do not need them.
> +
> +
> +rustfmt
> +*******
> +
> +The ``rustfmt`` tool is used to automatically format all the Rust kernel code,
> +including the generated C bindings (for details, please see
> +:ref:`Documentation/rust/coding.rst <rust_coding>`).
> +
> +If you are using ``rustup``, its ``default`` profile already installs the tool,
> +so you should be good to go. If you are using another profile, you can install
> +the component manually::
> +
> +    rustup component add rustfmt
> +
> +The standalone installers also come with ``rustfmt``.
> +
> +
> +clippy
> +******
> +
> +``clippy`` is a Rust linter. Installing it allows you to get extra warnings
> +for Rust code passing ``CLIPPY=1`` to ``make`` (for details, please see
> +:ref:`Documentation/rust/coding.rst <rust_coding>`).
> +
> +If you are using ``rustup``, its ``default`` profile already installs the tool,
> +so you should be good to go. If you are using another profile, you can install
> +the component manually::
> +
> +    rustup component add clippy
> +
> +The standalone installers also come with ``clippy``.
> +
> +
> +rustdoc
> +*******
> +
> +If you install the ``rustdoc`` tool, then you will be able to generate pretty
> +HTML documentation for Rust code, including for the libraries (crates) inside
> +``rust/`` that are used by the rest of the kernel (for details, please see
> +:ref:`Documentation/rust/docs.rst <rust_docs>`).
> +
> +If you are using ``rustup``, its ``default`` profile already installs the tool,
> +so you should be good to go. If you are using another profile, you can install
> +the component manually::
> +
> +    rustup component add rustdoc
> +
> +The standalone installers also come with ``rustdoc``.
> +
> +
> +Configuration
> +-------------
> +
> +``Rust support`` (``CONFIG_RUST``) needs to be enabled in the ``General setup``
> +menu. The option is only shown if the build system can locate ``rustc``.
> +In turn, this will make visible the rest of options that depend on Rust.
> +
> +Afterwards, go to::
> +
> +    Kernel hacking
> +      -> Sample kernel code
> +           -> Rust samples
> +
> +And enable some sample modules either as built-in or as loadable.
> +
> +
> +Building
> +--------
> +
> +Building a kernel with Clang or a complete LLVM toolchain is the best supported
> +setup at the moment. That is::
> +
> +    make ARCH=... CROSS_COMPILE=... CC=clang -j...
> +
> +or::
> +
> +    make ARCH=... CROSS_COMPILE=... LLVM=1 -j...

Please reorder; prefer LLVM=1 to CC=clang.  Probably worth another
cross reference to :ref:`kbuild_llvm`.

> +
> +Using GCC also works for some configurations, but it is *very* experimental at
> +the moment.
> +
> +
> +Hacking
> +-------
> +
> +If you want to dive deeper, take a look at the source code of the samples
> +at ``samples/rust/``, the Rust support code under ``rust/`` and
> +the ``Rust hacking`` menu under ``Kernel hacking``.
> +
> +If you use GDB/Binutils and Rust symbols aren't getting demangled, the reason
> +is your toolchain doesn't support Rust's new v0 mangling scheme yet. There are

"new" as in changed, or "new" as in Rust previously did not mangle symbols?

> +a few ways out:
> +
> +  - If you don't mind building your own tools, we provide the following fork
> +    with the support cherry-picked from GCC on top of very recent releases:
> +
> +        https://github.com/Rust-for-Linux/binutils-gdb/releases/tag/gdb-10.1-release-rust
> +        https://github.com/Rust-for-Linux/binutils-gdb/releases/tag/binutils-2_35_1-rust
> +
> +  - If you only need GDB and can enable ``CONFIG_DEBUG_INFO``, do so:
> +    some versions of GDB (e.g. vanilla GDB 10.1) are able to use
> +    the pre-demangled names embedded in the debug info.
> +
> +  - If you don't need loadable module support, you may compile without
> +    the ``-Zsymbol-mangling-version=v0`` flag. However, we don't maintain
> +    support for that, so avoid it unless you are in a hurry.
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
