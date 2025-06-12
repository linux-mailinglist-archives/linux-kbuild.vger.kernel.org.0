Return-Path: <linux-kbuild+bounces-7474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C87AD7281
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3B621BC3E4B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9572459D2;
	Thu, 12 Jun 2025 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jQxatJvq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA381BC2A;
	Thu, 12 Jun 2025 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735698; cv=none; b=dQCYLnF0CCgl0aEKy5Lyse3Qfk4LW7u/QdnZkj3QG92rjd2HPvMAQsH8MRrMOkgqw7ikh0U4q3x/a6ZdTQTvN0k2EBneZoG8gXZzx8e61WDef+lRfsVHt+ZqQ7psy19ryD+5uvqkbLMoxPRiCTDVpKYpXdz3vSgJnd+0mGxNycg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735698; c=relaxed/simple;
	bh=XuPzcSKLyCvr/5GgDot+YfGkvpB1FZS3Bx0yut8ynLE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jiT3VDUz+BRcv5yyg0dqH3QjW1MTZBsJUpUHfAr8DXTGPvJzXgP1S6iQRjwyD5tPqgKs0ss6vkNaIrX1LtTHZHvI1c6geKApd5Aygxg8+k0SfkMGx/WYQUCtMK8kgl7hdIPZNvQcc6WsTDUJolnK4U7Vcwtrvs0vzmycZvpMCu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jQxatJvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EA7C4CEEE;
	Thu, 12 Jun 2025 13:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749735698;
	bh=XuPzcSKLyCvr/5GgDot+YfGkvpB1FZS3Bx0yut8ynLE=;
	h=From:Subject:Date:To:Cc:From;
	b=jQxatJvqzhEk29DCTU2c//Tk56hi9uUtVwHrO1dPWupC1AXL4xf0odY8FGSR5iFfT
	 FYrShr38md47/nQOlMJ8qE1yVGKRXXz228YyTkc/t/hvKSjYgxqNA2Szi2uqgf6gaM
	 R18LGQo91KSC+Q6cEvzr2Ntb+nHCklA8Y0e/YjeYv2muJj7sh05KYIk4BmF2j6zdS4
	 3jjnf/M1Upy6T1OiMO2uoU66ymyqkFAoiYVPzH81d7C/dzNMTyWiIbyd45e7aY8aEf
	 0TBOSkLR5FmnFT+4KSPltQH32YC0ASGJI59bmcXPb6vW4Z4YMZjplB2OkDOExyf0T2
	 JENMhNrM/CpXQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v13 0/6] rust: extend `module!` macro with integer
 parameter support
Date: Thu, 12 Jun 2025 15:40:01 +0200
Message-Id: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHYSmgC/23TS27DIBAG4KtEXtcVM4DBXfUeVRc8xonVxE5xY
 rWKcveO00ZxBYgNSHxo/oFLNVHqaapeNpcq0dxP/TjwAuTTpgo7N2yp7iNvVChQAQLUhzGe91Q
 fXXKHqZ5l7ciQDjZar13Fx46Juv7rZr6983rXT6cxfd+umOWye8dkjvEUtbLaCdAuYOhePygNt
 H8e07ZatFndBS1AtAVBsRBQWB86TwC5oB8CClUQNAu+08SKggZ1JjQroRTJ3LCAymNrYgxKxkw
 wa8EWBMOCJnCd88EF8JlgVwKagmCXHIiH1bGVymRC+xAklqpolyqsb4XukKTKcwDxILgdBQLE0
 s/ouKVRchAFA9YGlgxgoxFtY4126I3NDVwbTcnAJQ2hohXBMgL/jOvvs030eeYfcPp7u9frD03
 baQofAwAA
X-Change-ID: 20241211-module-params-v3-ae7e5c8d8b5a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7801; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=XuPzcSKLyCvr/5GgDot+YfGkvpB1FZS3Bx0yut8ynLE=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoSti1v2h3lxfY/01rS98F5wUwC9IdpEU4232b5
 ed/C6Nj58WJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaErYtQAKCRDhuBo+eShj
 d9nGEACfKw6eeSPODjTs4cwGONEVb22lDydxRWPSM+K2ZxCmBqOyGCL6n+N2VDgj6LWDHQ6a6A0
 wJXPJvPhQ+DZQqnRs69FPLeGk0+84Uh4F6l9qa0l/rdz5rWVQ5OS6AgqU+wDTmYnUwJAIGhsNa1
 ASziJGroYGGwNrhAUmTz0d7Tg+Kt3E4Ocwbttz/nufwUV6aIzY8Hyfl4DlgxOXsIYu12kmItQav
 dEy7nYJH+hTxjqArNPzg7wzxwGh+bOJM2w7zT+PkDEpPoiXjRaeqanXWD4KZa++/XGQ9S8dTywC
 UuHKlquIfihvghltoczCjQ8S5gUG+nr6h+Q2xalsDv+mjg5XIThb5K27b3AO75sPPh0UlqxPaKH
 UjKJ/UyVM8OzFTJsBGpmQUW+rt4xv277iE/zJK64rn81GKAF7rsR9TPTmYy+SYuYLUK6BH4ICTR
 7KYu0wnjKISGY85/uxjCgVfy509+tnAm00DQ8i1X2joBduvI+AY48z1f7D6jE3Z/dHl6LN2Lm8R
 /zVBeqKMLY99yRuswIdoUfZ2027JMpCwN6UWyuFm0i6x8BNYVtAkE8wYBUy8zSc1+MrITZVpQs/
 gYNhUIlgwloGpwPvVqWTJ5Wrcr9uqQZENfudQFDTh+WdzeLNHHcWk3GDn6I0+a7BnYDLFy2W4HH
 vCmvoymorhqpcbw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Extend the `module!` macro with support module parameters. Also add some string
to integer parsing functions and updates `BStr` with a method to strip a string
prefix.

Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v13:
- remove absolute path for `ffi` types.
- Split patch 2 into 4 separate patches.
- Overhaul safety framework for `set_param`.
- Remove generated docs for `kernel_param_ops`.
- Move `parse_int` to separate file.
- Rebase on v6.16-rc1
- Link to v12: https://lore.kernel.org/r/20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org

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
Andreas Hindborg (6):
      rust: str: add radix prefixed integer parsing functions
      rust: introduce module_param module
      rust: module: use a reference in macros::module::module
      rust: module: update the module macro with module parameter support
      rust: samples: add a module parameter to the rust_minimal sample
      modules: add rust modules files to MAINTAINERS

 MAINTAINERS                  |   2 +
 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 201 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           |   2 +
 rust/kernel/str/parse_int.rs | 171 ++++++++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 ++++++
 rust/macros/lib.rs           |  31 +++++++
 rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++++-----
 samples/rust/rust_minimal.rs |  10 +++
 9 files changed, 618 insertions(+), 20 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



