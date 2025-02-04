Return-Path: <linux-kbuild+bounces-5621-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81AA27105
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 13:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18AAE188747C
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 12:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ACC212B3A;
	Tue,  4 Feb 2025 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIVtQlx0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B00212B2D;
	Tue,  4 Feb 2025 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670700; cv=none; b=dVUggOZezAshCr77RTWCsRtKGYzWQJ7kYVg26DvGAT123Tw6zqp2TVO7r3YYLCzPS3N3yoKbDVp0T34jqsS1QPNgH20i/Qg6K25+kQm61PIt99S4rSf4InXetJw6Ubo2pnaVq+/X2MHg84bjdno1bcuCpT8A5OLCdiJk1HSrUoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670700; c=relaxed/simple;
	bh=PfuRE/ZR4isUzc3qeO77yo8aH9yzP+UY+ow6O90zSqk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZmUAHQsjee5oEbNwHh1xaI57f25kPxXCLAtqM/oiYnt+0fR3rAI/S46Cp84NrCV26+UzMGYpoAaK14DCTGwNYvu/euzXy+KKA5irN9swSX03fFhxzZq/b3Hr9GrRyo3lOZ2VIj2NBzfJT97Nv8Y4aVAjqOWa0P36NlM2leEzVOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIVtQlx0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45156C4CEE2;
	Tue,  4 Feb 2025 12:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670700;
	bh=PfuRE/ZR4isUzc3qeO77yo8aH9yzP+UY+ow6O90zSqk=;
	h=From:Subject:Date:To:Cc:From;
	b=CIVtQlx0tqVh1JFxmejdDWkDoNP5Y8o1L4BNrPx5ca3hdmprZ8ako3bc2acptE/Lo
	 9HYtOdLacWz4ZnF4hLJ6eKZ3UDcVrysK2KEv3XRnMXQrXGlrZRtylymwIotOITiMFS
	 RI0Rqo4TF4PPbzNCJhnXB/clVq1oPfwflsGGm/O/nd1myeCFES4JtE8uZrulRLa1SC
	 kKWHDBVhJ2zhwOFtHhxXzL6Bk2DxHqkbQ0xKOkXyQRs6bvEh5NzqGsHFlW4LMhfrI5
	 xkhUCKLo2rfMKyvawE8A7MYTItc1dqODG9nP7A/4eLcKfJdFWkBHtV5kQ/jDtx8BMF
	 t72nYNw/c4lrA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v5 0/5] rust: extend `module!` macro with integer parameter
 support
Date: Tue, 04 Feb 2025 13:02:07 +0100
Message-Id: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8BomcC/23PTWrDMBAF4KsYrTtBv47jVe5RSpDkcSIaWe7IE
 S0hd6/iEEppQZsnmG/eXFlGCphZ31wZYQk5pKkG89Iwf7LTESEMNTPJpRZSCIhpuJwRZks2Zig
 KLG7R+G7onLGsjs2EY/hcyde3mk8hL4m+1g1F3X+fmPqL1cdBd8ZyYayXfty/I0143iQ6srtW9
 FMwXPDdP4Kugpe8c350KMRv4fYoSPhxqacuj5Y/l/bNWk3wLcx0SJPHQ7SeUoZWqw7b0bidVH0
 tUR1nM4JPMYalb0q7ERrIi7rj9g03gUxRVgEAAA==
X-Change-ID: 20241211-module-params-v3-ae7e5c8d8b5a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5270; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=PfuRE/ZR4isUzc3qeO77yo8aH9yzP+UY+ow6O90zSqk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnogHTY/q2y6tivMkfUAhM+3qDVJDzQPGSrmdoU
 4KQGnJFCNCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6IB0wAKCRDhuBo+eShj
 dzVcD/9bOPaAottr8750r1K2G1SqhmEGXEyT3fjczoLnbR655oiykpiDSXS7zW2/yC9v7/A3lfg
 D1SubqB7BrRtq7WWjp7PPG9DgZPFdfe/QBTID/nKiUMjRq+wgvPXRfCQPlmhA0Wpnx2FINviKXv
 DX/6neB5hi/6j0/I59tvX5uMDRDO7Wev0+k37luXZ+aIppiVz8KNNZi2WFuh+Xfn6ErhvLpM9LB
 UXPsuHat4/H7XQDogR5SjuGaMvCRZwzk2dNqJnNVzQvdej3Jgo+9IA2aQJrodvIBbOFk4yKCEgO
 KIFobv7tsZANeOrrIpy4iN7Vs2+/mZ4YWHfca6vxYi6+L3ci8RKt1IytafqvKdzXi5UgTuZm8AB
 21qGA8t7oZM/zA5YwGVfv9ztb23jucuP2vnuhTDPLjZjMV8x1Bs74YpM4tKTa3oKJLxmNEtBPUX
 OXOVVkjniGYHn+QJZZL3pNCdomK7jLi1VYamxSsMS8G3/Eg+cUMDl/z7YYvMRLYg6vmC2tukyju
 prsUKs7XihBT59SMfwnhLh3Tnq2+cvkCXlqpvKlS1a2iDQ8v2ry7awYR8qHfa+7BFfIfqT/fnz5
 KzpQyTwLVmRc0T2OZEXcjrtuk1InnD3MCxowVavPiKJSZ74SxGGsUYRQanduu0qdn9mFh0Z2em2
 u2XNr3gMSoXOg/w==
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

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Link: https://git.kernel.org/pub/scm/linux/kernel/git/a.hindborg/linux.git/log/?h=rnull [2]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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
Andreas Hindborg (5):
      rust: str: implement `PartialEq` for `BStr`
      rust: str: implement `Index` for `BStr`
      rust: str: implement `strip_prefix` for `BStr`
      rust: str: add radix prefixed integer parsing functions
      rust: add parameter support to the `module!` macro

 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 225 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 142 +++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  14 +++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 188 ++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 7 files changed, 593 insertions(+), 18 deletions(-)
---
base-commit: 379487e17ca406b47392e7ab6cf35d1c3bacb371
change-id: 20241211-module-params-v3-ae7e5c8d8b5a
prerequisite-change-id: 20241107-pr_once_macros-6438e6f5b923:v4
prerequisite-patch-id: 57743fff5d9c649ff7c1aed7e374d08ae67dda91
prerequisite-patch-id: fe607e3e1f666e7250bf099e581d53c83fea5f7d
prerequisite-patch-id: eb030eccf23466b0e22e7c699f252c40bd5f21bf

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



