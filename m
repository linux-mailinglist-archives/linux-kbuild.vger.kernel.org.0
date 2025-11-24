Return-Path: <linux-kbuild+bounces-9802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAC0C8148E
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:19:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C462346133
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57DA313522;
	Mon, 24 Nov 2025 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QD3zydiJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A9E30AAC1;
	Mon, 24 Nov 2025 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997540; cv=none; b=OMiO6E/csCxyvhn6jc/xZwBh1pR0xRPjdqkodm+sEiI/4kdk0CgsCk7+N6mJYqPQGZ2LutAS+Yq1VyLW/JOnuwBPthG53t5GdCd7oVyeZ0jWOiaw8uNY/1CneDxc4TfpnG31SJ/ojAT/4eSyA3i4VfbWvZkz1ml7r5LKCftNIGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997540; c=relaxed/simple;
	bh=4OlxeHVWJ5wTJFfLMlJNJy7hNl/P+TEIkLpQQw92c+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eixinh31Eax8t/xMYDJuTQ45cZSnZQ1yQQnySdjS+rtUrxqUZs8w33rS7o/Ps5dNNe7IeQY8pqKWkcpZj/ZGB0CLEBT3vwBDcSpGnLgfpm2Swxiozu+Zo5gVNWR5dwm9a0L/BqPYK1MW7x85j/zy2EU0J+vpTTNc1lrPt/QJ/jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QD3zydiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B74C4CEF1;
	Mon, 24 Nov 2025 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997540;
	bh=4OlxeHVWJ5wTJFfLMlJNJy7hNl/P+TEIkLpQQw92c+M=;
	h=From:To:Cc:Subject:Date:From;
	b=QD3zydiJZqZIrYqwvTFreXNUf+VHGI1ia8NKYJvcP4QviHqTUJH8MpHtscbmQZVEb
	 X6wV2kzMCkLz+nIxxcnI2aI+5LJBMxEmUYUHQm/3MBO8ad/QooQ1t51GsBtqI4GkZM
	 kzPQS1tklQOFixWFtUdwzU4NwCCVmpbCbl4coiVtIYlqEkraGndqXeEGoFOtD3XICe
	 at0Zu4DXT2Q44ajxnM20Z5h3xKTaSSCfBFcH7s83TDNuajZ2nbKZzQAAn2vqoGXfm2
	 0lx4FmF4+u3yaH4cbPjKEbJwmD6caTt24+5UCMHzONCfgwylChYczYsa6P1OPo32u0
	 B5RBi3Sk8y5og==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 00/20] `syn` support
Date: Mon, 24 Nov 2025 16:18:12 +0100
Message-ID: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces support for `syn` (and its dependencies):

    Syn is a parsing library for parsing a stream of Rust tokens into a
    syntax tree of Rust source code.

    Currently this library is geared toward use in Rust procedural
    macros, but contains some APIs that may be useful more generally.

It is the most downloaded Rust crate (according to crates.io), and it
is also used by the Rust compiler itself. Having such support allows to
greatly simplify writing complex macros such as `pin-init`. We will use
it in the `macros` crate too.

Benno has already prepared the `pin-init` version based on this, and on
top of that, we will be able to simplify the `macros` crate too. I think
Jesung is working on updating the `TryFrom` and `Into` upcoming derive
macros to use `syn` too.

The series starts with a few preparation commits (two fixes were already
merged in mainline that were discovered by this series), then each crate
is added. Finally, support for using the new crates from our `macros`
crate is introduced.

This has been a long time coming, e.g. even before Rust for Linux was
merged into the Linux kernel, Gary and Benno have wanted to use `syn`.
The first iterations of this, from 2022 and 2023 (with `serde` too,
another popular crate), are at:

    https://github.com/Rust-for-Linux/linux/pull/910
    https://github.com/Rust-for-Linux/linux/pull/1007

After those, we considered picking these from the distributions where
possible. However, after discussing it, it is not really worth the
complexity: vendoring makes things less complex and is less fragile.

In particular, we avoid having to support and test several versions,
we avoid having to introduce Cargo just to properly fetch the right
versions from the registry, we can easily customize the crates if needed
(e.g. dropping the `unicode_idents` dependency like it is done in this
series) and we simplify the configuration of the build for users for
which the "default" paths/registries would not have worked.

Moreover, nowadays, the ~57k lines introduced are not that much compared
to years ago (it dwarfed the actual Rust kernel code). Moreover, back
then it wasn't clear the Rust experiment would be a success, so it would
have been a bit pointless/risky to add many lines for nothing. Our macro
needs were also smaller in the early days.

So, finally, in Kangrejos 2025 we discussed going with the original,
simpler approach. Thus here it is the result.

There should not be many updates needed for these, and even if there
are, they should not be too big, e.g. +7k -3k lines across the 3 crates
in the last year.

Note that `syn` does not have all the features enabled, since we do not
need them so far, but they can easily be enabled just adding them to the
list.

v2:
  - Drop `condvar` patch.
  - Add note about `:=` in commit log.
  - Add comment about `rustfmt` and note it in the log.
  - Rename `hostlibrary` to `procmacrolibrary`.
  - Split a couple changes into two new commits (`rustc_test_library`,
    `rustc_procmacro`). I applied the tags to those, since the changes
    are still the same and the log is simple.
  - Add new commit with the `macros` support for the new crates.

v1: https://lore.kernel.org/rust-for-linux/20251110095025.1475896-1-ojeda@kernel.org/

Miguel Ojeda (20):
  rust: kbuild: introduce `core-flags` and `core-skip_flags`
  rust: kbuild: simplify `--cfg` handling
  rust: kbuild: add proc macro library support
  rust: kbuild: support skipping flags in `rustc_test_library`
  rust: kbuild: support using libraries in `rustc_procmacro`
  rust: proc-macro2: import crate
  rust: proc-macro2: add SPDX License Identifiers
  rust: proc-macro2: remove `unicode_ident` dependency
  rust: proc-macro2: add `README.md`
  rust: proc-macro2: enable support in kbuild
  rust: quote: import crate
  rust: quote: add SPDX License Identifiers
  rust: quote: add `README.md`
  rust: quote: enable support in kbuild
  rust: syn: import crate
  rust: syn: add SPDX License Identifiers
  rust: syn: remove `unicode-ident` dependency
  rust: syn: add `README.md`
  rust: syn: enable support in kbuild
  rust: macros: support `proc-macro2`, `quote` and `syn`

 .gitignore                                    |    1 +
 Makefile                                      |    7 +
 rust/Makefile                                 |  147 +-
 rust/proc-macro2/README.md                    |   13 +
 rust/proc-macro2/detection.rs                 |   77 +
 rust/proc-macro2/extra.rs                     |  153 +
 rust/proc-macro2/fallback.rs                  | 1258 +++++
 rust/proc-macro2/lib.rs                       | 1351 ++++++
 rust/proc-macro2/location.rs                  |   31 +
 rust/proc-macro2/marker.rs                    |   19 +
 rust/proc-macro2/parse.rs                     |  997 ++++
 rust/proc-macro2/probe.rs                     |   12 +
 rust/proc-macro2/probe/proc_macro_span.rs     |   53 +
 .../proc-macro2/probe/proc_macro_span_file.rs |   16 +
 .../probe/proc_macro_span_location.rs         |   23 +
 rust/proc-macro2/rcvec.rs                     |  148 +
 rust/proc-macro2/wrapper.rs                   |  986 ++++
 rust/quote/README.md                          |   12 +
 rust/quote/ext.rs                             |  112 +
 rust/quote/format.rs                          |  170 +
 rust/quote/ident_fragment.rs                  |   90 +
 rust/quote/lib.rs                             | 1456 ++++++
 rust/quote/runtime.rs                         |  494 ++
 rust/quote/spanned.rs                         |   52 +
 rust/quote/to_tokens.rs                       |  273 ++
 rust/syn/README.md                            |   13 +
 rust/syn/attr.rs                              |  838 ++++
 rust/syn/bigint.rs                            |   68 +
 rust/syn/buffer.rs                            |  436 ++
 rust/syn/classify.rs                          |  313 ++
 rust/syn/custom_keyword.rs                    |  262 ++
 rust/syn/custom_punctuation.rs                |  306 ++
 rust/syn/data.rs                              |  426 ++
 rust/syn/derive.rs                            |  261 ++
 rust/syn/discouraged.rs                       |  227 +
 rust/syn/drops.rs                             |   60 +
 rust/syn/error.rs                             |  469 ++
 rust/syn/export.rs                            |   75 +
 rust/syn/expr.rs                              | 4175 +++++++++++++++++
 rust/syn/ext.rs                               |  138 +
 rust/syn/file.rs                              |  127 +
 rust/syn/fixup.rs                             |  775 +++
 rust/syn/gen/clone.rs                         | 2269 +++++++++
 rust/syn/gen/debug.rs                         | 3240 +++++++++++++
 rust/syn/gen/eq.rs                            | 2308 +++++++++
 rust/syn/gen/fold.rs                          | 3904 +++++++++++++++
 rust/syn/gen/hash.rs                          | 2878 ++++++++++++
 rust/syn/gen/visit.rs                         | 3943 ++++++++++++++++
 rust/syn/gen/visit_mut.rs                     | 3761 +++++++++++++++
 rust/syn/generics.rs                          | 1479 ++++++
 rust/syn/group.rs                             |  293 ++
 rust/syn/ident.rs                             |  110 +
 rust/syn/item.rs                              | 3492 ++++++++++++++
 rust/syn/lib.rs                               | 1013 ++++
 rust/syn/lifetime.rs                          |  158 +
 rust/syn/lit.rs                               | 1862 ++++++++
 rust/syn/lookahead.rs                         |  334 ++
 rust/syn/mac.rs                               |  227 +
 rust/syn/macros.rs                            |  184 +
 rust/syn/meta.rs                              |  429 ++
 rust/syn/op.rs                                |  221 +
 rust/syn/parse.rs                             | 1421 ++++++
 rust/syn/parse_macro_input.rs                 |  130 +
 rust/syn/parse_quote.rs                       |  242 +
 rust/syn/pat.rs                               |  957 ++++
 rust/syn/path.rs                              |  968 ++++
 rust/syn/precedence.rs                        |  212 +
 rust/syn/print.rs                             |   18 +
 rust/syn/punctuated.rs                        | 1157 +++++
 rust/syn/restriction.rs                       |  180 +
 rust/syn/scan_expr.rs                         |  267 ++
 rust/syn/sealed.rs                            |    6 +
 rust/syn/span.rs                              |   65 +
 rust/syn/spanned.rs                           |  120 +
 rust/syn/stmt.rs                              |  486 ++
 rust/syn/thread.rs                            |   62 +
 rust/syn/token.rs                             | 1098 +++++
 rust/syn/tt.rs                                |  109 +
 rust/syn/ty.rs                                | 1273 +++++
 rust/syn/verbatim.rs                          |   35 +
 rust/syn/whitespace.rs                        |   67 +
 scripts/generate_rust_analyzer.py             |   25 +-
 82 files changed, 57906 insertions(+), 17 deletions(-)
 create mode 100644 rust/proc-macro2/README.md
 create mode 100644 rust/proc-macro2/detection.rs
 create mode 100644 rust/proc-macro2/extra.rs
 create mode 100644 rust/proc-macro2/fallback.rs
 create mode 100644 rust/proc-macro2/lib.rs
 create mode 100644 rust/proc-macro2/location.rs
 create mode 100644 rust/proc-macro2/marker.rs
 create mode 100644 rust/proc-macro2/parse.rs
 create mode 100644 rust/proc-macro2/probe.rs
 create mode 100644 rust/proc-macro2/probe/proc_macro_span.rs
 create mode 100644 rust/proc-macro2/probe/proc_macro_span_file.rs
 create mode 100644 rust/proc-macro2/probe/proc_macro_span_location.rs
 create mode 100644 rust/proc-macro2/rcvec.rs
 create mode 100644 rust/proc-macro2/wrapper.rs
 create mode 100644 rust/quote/README.md
 create mode 100644 rust/quote/ext.rs
 create mode 100644 rust/quote/format.rs
 create mode 100644 rust/quote/ident_fragment.rs
 create mode 100644 rust/quote/lib.rs
 create mode 100644 rust/quote/runtime.rs
 create mode 100644 rust/quote/spanned.rs
 create mode 100644 rust/quote/to_tokens.rs
 create mode 100644 rust/syn/README.md
 create mode 100644 rust/syn/attr.rs
 create mode 100644 rust/syn/bigint.rs
 create mode 100644 rust/syn/buffer.rs
 create mode 100644 rust/syn/classify.rs
 create mode 100644 rust/syn/custom_keyword.rs
 create mode 100644 rust/syn/custom_punctuation.rs
 create mode 100644 rust/syn/data.rs
 create mode 100644 rust/syn/derive.rs
 create mode 100644 rust/syn/discouraged.rs
 create mode 100644 rust/syn/drops.rs
 create mode 100644 rust/syn/error.rs
 create mode 100644 rust/syn/export.rs
 create mode 100644 rust/syn/expr.rs
 create mode 100644 rust/syn/ext.rs
 create mode 100644 rust/syn/file.rs
 create mode 100644 rust/syn/fixup.rs
 create mode 100644 rust/syn/gen/clone.rs
 create mode 100644 rust/syn/gen/debug.rs
 create mode 100644 rust/syn/gen/eq.rs
 create mode 100644 rust/syn/gen/fold.rs
 create mode 100644 rust/syn/gen/hash.rs
 create mode 100644 rust/syn/gen/visit.rs
 create mode 100644 rust/syn/gen/visit_mut.rs
 create mode 100644 rust/syn/generics.rs
 create mode 100644 rust/syn/group.rs
 create mode 100644 rust/syn/ident.rs
 create mode 100644 rust/syn/item.rs
 create mode 100644 rust/syn/lib.rs
 create mode 100644 rust/syn/lifetime.rs
 create mode 100644 rust/syn/lit.rs
 create mode 100644 rust/syn/lookahead.rs
 create mode 100644 rust/syn/mac.rs
 create mode 100644 rust/syn/macros.rs
 create mode 100644 rust/syn/meta.rs
 create mode 100644 rust/syn/op.rs
 create mode 100644 rust/syn/parse.rs
 create mode 100644 rust/syn/parse_macro_input.rs
 create mode 100644 rust/syn/parse_quote.rs
 create mode 100644 rust/syn/pat.rs
 create mode 100644 rust/syn/path.rs
 create mode 100644 rust/syn/precedence.rs
 create mode 100644 rust/syn/print.rs
 create mode 100644 rust/syn/punctuated.rs
 create mode 100644 rust/syn/restriction.rs
 create mode 100644 rust/syn/scan_expr.rs
 create mode 100644 rust/syn/sealed.rs
 create mode 100644 rust/syn/span.rs
 create mode 100644 rust/syn/spanned.rs
 create mode 100644 rust/syn/stmt.rs
 create mode 100644 rust/syn/thread.rs
 create mode 100644 rust/syn/token.rs
 create mode 100644 rust/syn/tt.rs
 create mode 100644 rust/syn/ty.rs
 create mode 100644 rust/syn/verbatim.rs
 create mode 100644 rust/syn/whitespace.rs


base-commit: bc197e24a3acd13dd0b7b07c1448c5c225946546
--
2.52.0

