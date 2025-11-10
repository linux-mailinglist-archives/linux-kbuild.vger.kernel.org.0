Return-Path: <linux-kbuild+bounces-9471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E4226C45BB6
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6256B347A88
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC932FD1C1;
	Mon, 10 Nov 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLy0zkLt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BC288C20;
	Mon, 10 Nov 2025 09:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768259; cv=none; b=WxDFrTgZIdQtGT3hQu7/duS857sruRQdtnnET3Nbk3XB1v77cMUAPojtzmIjPR62BFp13gM8vNU2YYP+5G1vy+k4eEf64EZiXEIYsyFNLvbXuGUbnfmEW4iRqgqk8dmhVOf7MEdItja5LoyynjSWAFsXpN+vMnJSJDTS6j/XPmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768259; c=relaxed/simple;
	bh=efQ7LZqDJFFcduDkUvygdRd9C94TMeRBtIbGMBhfHGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r0U31qJCenV1F4HVnTLRPCAEc3ivY3B/6Q1DN+HvAD6FONOfnfchjmuear8o1h3b1EqAlBpffiOjKrUAoDAzPiILOohLSNuYOyA6GWGbHMpwJSjALcsqDgCNTtER8uYeXbs0hGcrufE4jY8GTyttvRCgJ6K/hDxII/kkxiuaGvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLy0zkLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AEEC4CEF5;
	Mon, 10 Nov 2025 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768259;
	bh=efQ7LZqDJFFcduDkUvygdRd9C94TMeRBtIbGMBhfHGY=;
	h=From:To:Cc:Subject:Date:From;
	b=jLy0zkLtbZOfZmDmVlHm92QO2uvnOEHtqRGMDEnsAbypg0OQW6wM64uTMmnvt+Wvp
	 2hkfBpvI4tSR5GGhaccLnmXh3nmVX18J7riHUGYupYDZ0TV/bpnsx7X7IHlcJWMs/6
	 sri+db88cvrmoW+JYe+IQi4pJUmWrFCZlt944KQdDwIR5CBSwkNRoQREdzTk7zd9Ne
	 ZX/5pdvWlU7IpqOLPjNI8dySwZT0GNY9Eab4rv//zJnGhdDmYyZy9tsyMsQxP1qYQI
	 dkpbHURlZ4e/W5pjjFAgdhh9LyI0KSU7YUn7X/Jj8vWKHW1RV9G7bhb6xjD2Yn0r+E
	 +jDHNtcy3E0Zw==
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
Subject: [PATCH 00/18] `syn` support
Date: Mon, 10 Nov 2025 10:50:05 +0100
Message-ID: <20251110095025.1475896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces support for `syn` (and its dependencies).
Having such support allows to greatly simplify writing complex macros
such as `pin-init`.

Benno has already prepared the `pin-init` version based on this, and on
top of that, we will be able to simplify the `macros` crate too.

The series starts with a few preparation commits (two fixes were already
merged in mainline that were discovered by this series), then each crate
is added.

This has been a long time coming -- the first iterations of this, from
2022 and 2023 (with `serde` too), are at:

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

I will be updating the webpage as well with the result of this:

    https://rust-for-linux.com/third-party-crates

Please give it a test -- thanks!

Miguel Ojeda (18):
  rust: condvar: avoid `pub` in example
  rust: kbuild: introduce `core-flags` and `core-skip_flags`
  rust: kbuild: simplify `--cfg` handling
  rust: kbuild: add host library support
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

 .gitignore                                    |    1 +
 Makefile                                      |    5 +
 rust/Makefile                                 |  134 +-
 rust/kernel/sync/condvar.rs                   |    2 +-
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
 scripts/generate_rust_analyzer.py             |   23 +-
 83 files changed, 57895 insertions(+), 13 deletions(-)
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

--
2.51.2

