Return-Path: <linux-kbuild+bounces-6975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0DAAC513
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 15:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2096C4A6483
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 13:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49612280A4C;
	Tue,  6 May 2025 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeqTxEGz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F960280A20;
	Tue,  6 May 2025 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536587; cv=none; b=TqRJJH+wgvrV94xHyF2WRZVaA1hCDm+i+i6fUnlaK7m2dreqtQQST0m1ZJIzKUWpgtDRqjSKC9EGUBVVCOypIxlDgkvJLMlnKeYXqdMg2krhnZUBgVH1OnjQXjuOeb3Ir9j5hI/oX0IvVXIR5He+HgfTWe6SkqqM6Tzlb+2NIHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536587; c=relaxed/simple;
	bh=ZMQS6ZEGpAI6mvROn7boEL85LDXj5VnRa+r7qtHQvrA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=G420m/mpup9WfqPS2UYTvQAWW3GZ0ypxboGvW9aLev2Ykce6lhTQQTaaneCj0AHMLKTtu6J4IQ1BJBm6Ht4ytWbzG9CdtolkKmDGRnAyuB5lpDFTL9GCRNnOaeLozIs4WYi4G/DuuyCu9/sfD2Xo8J5mb6tSkYwwRhrNIq6TSPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeqTxEGz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21613C4CEEE;
	Tue,  6 May 2025 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746536586;
	bh=ZMQS6ZEGpAI6mvROn7boEL85LDXj5VnRa+r7qtHQvrA=;
	h=From:Subject:Date:To:Cc:From;
	b=TeqTxEGzf6fYjvF0AkJRJCFwdedptXJa0f5LZwFSrDlGkVfXWXok78v5u7a2tAa8e
	 yrLHAtTFO7DNhW3GNUpQAd74QPEMnNRq4tLOaMLqBOQAtXQmAA6v4ZYwUEyWVIYHU1
	 GA5ztA5ZnSLJLX5A/RKVMhagiwH+MiZBQ+JjGco78dP347CoNHauVYBJBgNkFDakCA
	 dQdDKFFB8Di6VJkjLIkHOvFkMKGxmX5Q3Mve95U8Wcp+/wSm67ZbY/u8zfwctvBQg9
	 +lgNzT6ZLjLYiNndDa2Ql4UnbPm1jxByw8Bed+/2gYOlWxEGvJQZklZ7pl0t46KbtT
	 Bt6MUaExbEj0Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v12 0/3] rust: extend `module!` macro with integer
 parameter support
Date: Tue, 06 May 2025 15:02:27 +0200
Message-Id: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMIGmgC/23SzW7DIAwA4FepOC8TNhDITnuPaQd+nDZam3Skj
 TZVffc53apmCoiLLfEh/1zESLmjUbxsLiLT1I3d0HMA+LQRcef7LVVd4oRAiRoQoDoM6byn6ui
 zP4zVpCpPlkx0yQXjBT87Zmq7r5v59s7xrhtPQ/6+fTGpOXvH1BrjKyvtjJdgfMTYvn5Q7mn/P
 OStmLVJ3wUjQTYFQbMQUboQ20AAa8E8BJS6IBgWQmuIFQ01mpVQL4RSS6aaBdQBG5tS1CqtBLs
 UXEGwLBgC3/oQfYSwEtxCQFsQ3NwH4uNMapS2K6F5CApLVTRzFS400rRISq/7APJB8DgKBMh5n
 snzSJPiRhQMWBpYMoCNWja1s8ZjsO6fcf1duUyfZ97e09/eXa8//76yyNsCAAA=
X-Change-ID: 20241211-module-params-v3-ae7e5c8d8b5a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7211; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ZMQS6ZEGpAI6mvROn7boEL85LDXj5VnRa+r7qtHQvrA=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoGghmLsJLbKfOONtvW5wNQAvLOP3ZNTqmIdHuP
 IJV8a8kIi6JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBoIZgAKCRDhuBo+eShj
 d4IvD/9u2PAnqF0jvUBEZjrHcEAtpo5a3fWTb773jmd2k4VufznemaE3jQfDf3FkZ7f9xWLpduE
 fKNkJITyvqLIZ+mqfdef3isAdA9Ao7ehhgL5swMJdaE/7b3vwVmBjxBB9Em4mfvajNt79cyqJOL
 cwzjvbs2hFGdUZujxdYY03jhWGHK56PWMs7jSE1r1Z4M0z0K2x1kSs6sL8iCgocIFsPSuTtq9YB
 pskMWO8Y9633IGeYADzGSsyP0EI+DXCvUp0rOXeh1oyhRsCA3DqNJAuIlQPIg42PFt21sjqIV7r
 CNaHtFisINNQWdALeyjhCmOuMUYkMSm1DHxvcGKEcUJElZ76gOZ8IdU6B197sKa6c55JHnwHxve
 8dje3w1gzhnhH49DAswu2MHplQccCtv/T8BqsgHXczSl0Bv1hlQDon0/qD4QYcE/X8TvSPiHS+T
 J7BYfRcxau7sNQKzof4d6iZ9AiRfLydhoP0IQKQ+w1AL8HdgUSLaW/cV6hBao40eLyOH4CC6ZOg
 RVlzvcFiJ7SX3xpUhtk60AwSct2tUWo4HWUgPhubRSGcoRjNy9M1Ee8gabxQRQuswTI26shyEj4
 rzi8/3hF8wjAF6wrTRa11UeTLMlM8eMSVcNuH50iseAFaRWD8i+8X4uReSSvx5ozjX7AAWqejj0
 3j5ZmU+6nM+DR5w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Extend the `module!` macro with support module parameters. Also add some string
to integer parsing functions and updates `BStr` with a method to strip a string
prefix.

Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v12:
- Assign through pointer rather than using `core::ptr::replace`.
- Prevent a potential use-after-free during module teardown.
- Link to v11: https://lore.kernel.org/r/20250502-module-params-v3-v11-0-6096875a2b78@kernel.org

Changes in v11:
- Apply a few nits from Miguel.
- Link to v10: https://lore.kernel.org/r/20250501-module-params-v3-v10-0-4da485d343d5@kernel.org

Changes in v10:
- Apply fixups from Miguel:
  - Add integer type suffixes to `assert!` in tests.
  - Fix links to docs.kernel.org.
  - Applyy markdown and intra-doc links where possible.
  - Change to `///` for `mod` docs.
  - Slightly reword a comment.
  - Pluralize "Examples" section name.
  - Hide `use`s in example.
  - Removed `#[expect]` for the `rusttest` target.
- Link to v9: https://lore.kernel.org/r/20250321-module-params-v3-v9-0-28b905f2e345@kernel.org

Changes in v9:
- Remove UB when parsing the minimum integer values.
- Make `FromStr` trait unsafe, since wrong implementations can cause UB.
- Drop patches that were applied to rust-next.
- Link to v8: https://lore.kernel.org/r/20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org

Changes in v8:
- Change print statement in sample to better communicate parameter name.
- Use imperative mode in commit messages.
- Remove prefix path from `EINVAL`.
- Change `try_from_param_arg` to accept `&BStr` rather than `&[u8]`.
- Parse integers without 128 bit integer types.
- Seal trait `FromStrRadix`.
- Strengthen safety requirement of `set_param`.
- Remove comment about Display and `PAGE_SIZE`.
- Add note describing why `ModuleParamAccess` is pub.
- Typo and grammar fixes for documentation.
- Update MAINTAINERS with rust module files.
- Link to v7: https://lore.kernel.org/r/20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org

Changes in v7:
- Remove dependency on `pr_warn_once` patches, replace with TODO.
- Rework `ParseInt::from_str` to avoid allocating.
- Add a comment explaining how we parse "0".
- Change trait bound on `Index` impl for `BStr` to match std library approach.
- Link to v6: https://lore.kernel.org/r/20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org

Changes in v6:
- Fix a bug that prevented parsing of negative default values for
  parameters in the `module!` macro.
- Fix a bug that prevented parsing zero in `strip_radix`. Also add a
  test case for this.
- Add `AsRef<BStr>` for `[u8]` and `BStr`.
- Use `impl AsRef<BStr>` as type of prefix in `BStr::strip_prefix`.
- Link to v5: https://lore.kernel.org/r/20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org

Changes in v5:
- Fix a typo in a safety comment in `set_param`.
- Use a match statement in `parse_int::strip_radix`.
- Add an implementation of `Index` for `BStr`.
- Fix a logic inversion bug where parameters would not be parsed.
- Use `kernel::ffi::c_char` in `set_param` rather than the one in `core`.
- Use `kernel::c_str!` rather than `c"..."` literal in module macro.
- Rebase on v6.14-rc1.
- Link to v4: https://lore.kernel.org/r/20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org

Changes in v4:
- Add module maintainers to Cc list (sorry)
- Add a few missing [`doc_links`]
- Add panic section to `expect_string_field`
- Fix a typo in safety requirement of `module_params::free`
- Change `assert!` to `pr_warn_once!` in `module_params::set_param`
- Remove `module_params::get_param` and install null pointer instead
- Remove use of the unstable feature `sync_unsafe_cell`
- Link to v3: https://lore.kernel.org/r/20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org

Changes in v3:
- use `SyncUnsafeCell` rather than `static mut` and simplify parameter access
- remove `Display` bound from `ModuleParam`
- automatically generate documentation for `PARAM_OPS_.*`
- remove `as *const _ as *mut_` phrasing
- inline parameter name in struct instantiation in  `emit_params`
- move `RacyKernelParam` out of macro template
- use C string literals rather than byte string literals with explicit null
- template out `__{name}_{param_name}` in `emit_param`
- indent template in `emit_params`
- use let-else expression in `emit_params` to get rid of an indentation level
- document `expect_string_field`
- move invication of `impl_int_module_param` to be closer to macro def
- move attributes after docs in `make_param_ops`
- rename `impl_module_param` to impl_int_module_param`
- use `ty` instead of `ident` in `impl_parse_int`
- use `BStr` instead of `&str` for string manipulation
- move string parsing functions to seperate patch and add examples, fix bugs
- degrade comment about future support from doc comment to regular comment
- remove std lib path from `Sized` marker
- update documentation for `trait ModuleParam`
- Link to v2: https://lore.kernel.org/all/20240819133345.3438739-1-nmi@metaspace.dk/

Changes in v2:
- Remove support for params without values (`NOARG_ALLOWED`).
- Improve documentation for `try_from_param_arg`.
- Use prelude import.
- Refactor `try_from_param_arg` to return `Result`.
- Refactor `ParseInt::from_str` to return `Result`.
- Move C callable functions out of `ModuleParam` trait.
- Rename literal string field parser to `expect_string_field`.
- Move parameter parsing from generation to parsing stage.
- Use absolute type paths in macro code.
- Inline `kparam`and `read_func` values.
- Resolve TODO regarding alignment attributes.
- Remove unnecessary unsafe blocks in macro code.
- Improve error message for unrecognized parameter types.
- Do not use `self` receiver when reading parameter value.
- Add parameter documentation to `module!` macro.
- Use empty `enum` for parameter type.
- Use `addr_of_mut` to get address of parameter value variable.
- Enabled building of docs for for `module_param` module.
- Link to v1: https://lore.kernel.org/rust-for-linux/20240705111455.142790-1-nmi@metaspace.dk/

---
Andreas Hindborg (3):
      rust: str: add radix prefixed integer parsing functions
      rust: add parameter support to the `module!` macro
      modules: add rust modules files to MAINTAINERS

 MAINTAINERS                  |   2 +
 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 204 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 172 +++++++++++++++++++++++++++++++++++-
 rust/macros/helpers.rs       |  25 ++++++
 rust/macros/lib.rs           |  31 +++++++
 rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++++-----
 samples/rust/rust_minimal.rs |  10 +++
 8 files changed, 619 insertions(+), 21 deletions(-)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



