Return-Path: <linux-kbuild+bounces-5822-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F78A39CE6
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:08:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DDA53A839C
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F12626A0FD;
	Tue, 18 Feb 2025 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0LSRf6d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F32690FE;
	Tue, 18 Feb 2025 13:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883759; cv=none; b=aH+9vV0x66yYIWMZzUwIF06k9GRl9JUT0XmdyYnMfeRG8sJU75st7cjRza/RMXSFIptoyGaWXUPoZ8fWzyL1jxzFJ7zkrE2B8UkvFuqLHcoKfuE/K2wSZBF/8G6sBqF1znRhCDERslEeKMzDPQ/05gH8ake3MLBYj0QvKzvjqOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883759; c=relaxed/simple;
	bh=jWLHgVG8nC8c9GDtbpXvmNb1F/5RvzNYNwR5cozqw5M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H9llJVCcnqqUivwqjghT1BQlH/M7D3ZZ1Ju/ga+kEOgOVu5DEKJMrWWzfV7jIhAtV/5Zhn65706GH8wSRU0oyCUi5QKZgpIiM5mD7bqloL5moBfV0jnO9RQOfFtZ+LKE2wRgyx5dvMqy1XMjYsEjVYQwUIItTpxNg1m+Jb5lYwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0LSRf6d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B538C4CEE2;
	Tue, 18 Feb 2025 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739883758;
	bh=jWLHgVG8nC8c9GDtbpXvmNb1F/5RvzNYNwR5cozqw5M=;
	h=From:Subject:Date:To:Cc:From;
	b=o0LSRf6d9TIQqGfdRsH48P+5AFIM4sRKFZERjRbdTCHjGRjGti3BqOVcVtK4lIYjw
	 PyaJIBPfDHocQJOPaVUc3x7zreeAgzNU6tRDnRihl6u745Sb33mRnwe7KvgbqtrIap
	 FmmTtjCcxuq26x2HU4T7zq0ZKf4uUX141duGx9ibmgnTTJLcvLRYDiYVMJmiSi8Lzh
	 ctE7wLvZNvC4f0fgDLDsn1rf3y1Ok90iCDJJbfCQyYxTSNNum+zQHfrzkPj+y4safu
	 NKi/abYi8xxIv3V05ssNq9H4DEUoF9Zknua6vf9m8rR9EQwWPobaieQ3+JHC/6WPn1
	 gpQVohm3A7IrA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v7 0/6] rust: extend `module!` macro with integer parameter
 support
Date: Tue, 18 Feb 2025 14:00:42 +0100
Message-Id: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHqEtGcC/23QTW7CMBAF4KtEXmPkcewksOo9qi78MwELElM7W
 K0Qd2cAIVolkjfPmvlGeheWMQXMbFtdWMIScogjhXZVMbc34w558JSZFFKBBOBD9Ocj8pNJZsi
 81Nxgi9p1vrPaMFo7JezDz4P8/KK8D3mK6fdxodT33xdWzzF6gqtOGwHaOOn6jwOmEY/rmHbsr
 hX1ErQAsVkQFAlOis663iLAXNBvQQq1IGgSbK+RFAWN1DOh+SMsVVIaEqSyctN671Tt/wnXZ0k
 Jv89U9/RsilmTkbs4DGHaVqVZg+LJAU1fbzR9TcekAQAA
X-Change-ID: 20241211-module-params-v3-ae7e5c8d8b5a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7161; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=jWLHgVG8nC8c9GDtbpXvmNb1F/5RvzNYNwR5cozqw5M=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBntISCSdEQxT8vQFZff10Wp258DdMA4JOlk6pYl
 tzigaFH3L2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ7SEggAKCRDhuBo+eShj
 d+BnD/0UUZSFN4fQeUFtpswqlscHJ4tU+08aUjIvVk91j9tbo7EUHzbYiiCN7BZYpdCV/sqqsou
 B4i2n+cGCvZFfEjASU+l9QSmF5x8mAMKU/tJaKxvtuZj2IJNJeeV7hXF4G0O7Z6UC88JIq6Hpnd
 4hEKppJT35sp+WTaGkE4+2GzvGZrBk1yGxUeX8T8yqW5Si1EWsG73cNAMtgMcA5FThpwyvVTNNY
 B2GgpdjjOtGJnomNNeNqV0JM6LngP9miiVu3MDfMymDz3kZlXd8xKFcsfNSWDjGmypG7m3FZ034
 Ze5c7AaaYOy9FVR51b18m/fAcVngfhmNFMxG3ab1B2/UZ9mf0oLo/vuTP7yza2jGGkPBf3ARYuW
 INiLo6Phv+enRYRwmzkRy3RtnZsWruZftYLVSpz9/7m9mRqfeRkqGxACvsTifa/rdYlxwgmpneA
 KNtS6KyT1x+xPdsxnlIw4kYTCMZGNsKdZZt9u8Wgn+HVT8fHbuk0IHvsGjCr8tx57qm4HnKeiZQ
 h5xFx43t9uEHIg6FuNDtBCmh5GAaNTHnFX0E0v1TqBhov3q2JPACj9X5ccBmXuHyVm/1YcJ2p+Q
 i+jN7/XrKrS1K6zuifong4213e32HAr5KZ8MiLma/9qnZwe3xWFGk1jskOKNEPQ2ZZ46jlrEjAU
 fkxTSM8WDqNr0VQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series extends the `module!` macro with support module parameters. It
also adds some string to integer parsing functions and updates `BStr` with
a method to strip a string prefix.

This series stated out as code by Adam Bratschi-Kaye lifted from the original
`rust` branch [1].

After a bit of discussion on v3 about whether or not module parameters
is a good idea, it seems that module parameters in Rust has a place
in the kernel for now. This series is a dependency for `rnull`, the Rust
null block driver [2].

---
Module subsystem people: how do you want to handle merging of the patches and
subsequent maintenance of code?

I think we discussed you guys taking this under the current module maintainer
entry? If that is correct, will you add the new files to your entry yourself, or
should I include an update to MAINTAINERS in this series?

If prefer another solution, let me know and we can figure that out.

To: Miguel Ojeda <ojeda@kernel.org>
To: Alex Gaynor <alex.gaynor@gmail.com>
To: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <benno.lossin@proton.me>
To: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nicolas@fjasle.eu>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: Adam Bratschi-Kaye <ark.email@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: Daniel Gomez <da.gomez@samsung.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org
Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/log/?h=rnull [2]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

---
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
Andreas Hindborg (6):
      rust: str: implement `PartialEq` for `BStr`
      rust: str: implement `Index` for `BStr`
      rust: str: implement `AsRef<BStr>` for `[u8]` and `BStr`
      rust: str: implement `strip_prefix` for `BStr`
      rust: str: add radix prefixed integer parsing functions
      rust: add parameter support to the `module!` macro

 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 226 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 163 +++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 +++++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 191 ++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 7 files changed, 629 insertions(+), 18 deletions(-)
---
base-commit: 379487e17ca406b47392e7ab6cf35d1c3bacb371
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



