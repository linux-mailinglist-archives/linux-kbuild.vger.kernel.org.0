Return-Path: <linux-kbuild+bounces-8944-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D3CB99E0B
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 14:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFA4D19C2E1D
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 12:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB1B2FE077;
	Wed, 24 Sep 2025 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rpz7jtVO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776C52417C2;
	Wed, 24 Sep 2025 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717624; cv=none; b=d8p3kG0ISMGCyPLJdKV457IvCqgoCYx+kizF5plj94Jrg4Yl3gDjH+lsJDimTgrBshGIzgL4iOOw3dTMXeC2jeYv8U37nylQipTeTph8351ZEu6+V731W3iv6p8cdsKg72QlqFvIhf1AYUNnCQJ88pR7RkWlYpRZAafBloMSOUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717624; c=relaxed/simple;
	bh=yzAasRfyIomTxBnV0ImqrHr2E1Mt+q4H/RcAvQZp+6s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N2gLo0rrRYf8RCNkWwmr29/Cq+Ri8oRuK/6r0VTIvCQDmw1lHzJdtJwzJK/m8io0aV25fNpvs7lhltJxZLoHyxVsn/3YsF6o4yl6USvuQ8MnjKil4QoHlm4DcJ2YMPNCSgcHlwDcwn3pcUHUycr+1RNHaJipayRhrDjV1OjCSsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rpz7jtVO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05EAC4CEF7;
	Wed, 24 Sep 2025 12:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717624;
	bh=yzAasRfyIomTxBnV0ImqrHr2E1Mt+q4H/RcAvQZp+6s=;
	h=From:Subject:Date:To:Cc:From;
	b=Rpz7jtVOcTxcWNW9WOJB0qgkEPAXovNlB+hUqrHkiLsdjmmtiW9YGX9ez2YtlCNBL
	 8SqDGiDYjyq4TQ8NZxehocmdzot4SMLmhXZKOpbII49LUh1sClsn29IzTWEQ568p0X
	 lMAaAbV9DMWXNKa+HtSTL/rPj5/gQNZe48KpiOuYDE5+3VkEC8A2hXjJ2uFS943zDf
	 TAR0GSdJLgZacd2y7D5NMw/1uOM0Zqo4bVfm+PVXkzw2tXEZNZ9+qhLrPTNzoOGvAN
	 EOqx/VGv3JkfQFHWUHL7xMkNFiFhKKqml1n0ieRfddn5g4G2DgZhCMWAC6Mu9FaE+U
	 /tLXPch62W8Tg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v18 0/7] rust: extend `module!` macro with integer
 parameter support
Date: Wed, 24 Sep 2025 14:39:23 +0200
Message-Id: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvm02gC/23UzW7cIBAH8FeJfK4jZvjOKe8R9QADJFaT3Y2dW
 K1W++4dNo0WFSxfQOJnmPmb87Tldcnb9HB3nta8L9tyPPAA3I+7iV7C4TnPS+KJCQUqQID57Zg
 +X/N8Cmt42+ZdziHbrMklF3WYeNlpzWX5fTWffvL4Zdk+juuf6yd2WWe/Mdlj/IpZOR0E6EBI5
 fFXXg/59f64Pk9V29W3oAUIPxAUC4TCRSoxA/SCvgko1EDQLMSiMysKDOpOMI0wKsluWEAV0du
 USMnUCbYV3ECwLOgMoYRIgSB2gmsEtAPB1TpkfpxOXirbCf4mSBydwtdTuOiFLpil6usA4kZwO
 wYEiNrPFLilSXIhBga0Bo4MYMMIb5zVAaN1vYGtYUYG1moIlZwgxwj0hrwZBob7qNmMhOApQZB
 lsI8mnHZ8lppOHYFIogRub2/o1hg1Fmo+CYpC44O20feGaY3RTwI1oap4NJGIoha90UTUDkMON
 aNUfASRlMf/Un75ugrW/P7Jt8rHv/vgcvkLhP36OnMEAAA=
X-Change-ID: 20241211-module-params-v3-ae7e5c8d8b5a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Benno Lossin <lossin@kernel.org>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10942;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=yzAasRfyIomTxBnV0ImqrHr2E1Mt+q4H/RcAvQZp+6s=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBo0+aanW1cXRYA7dIUE/ZUQ0SjYyrnmkKd0+Igr
 BvktVS86kuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaNPmmgAKCRDhuBo+eShj
 d8ZRD/4zNFzbVX0tMUm8q+CvA5F6HRS1SmST2aaPQzdYHVx5vzCxSc0LVBqY8bmFhzynX0QT5Pp
 UBdJN2ejLoZDGmNU/Y0vH9MYY4oBFf7GkODj+j4ETQ74Vi7q+kutsSqsa+7UD5IsHC3KvS0sCQ0
 iBcBE10kprb1SToX7XK85qY1OLmooWBJ036ra/Wzd3xvAAP0r6P+UHvptkDHE9Kl/kJ7DhXgr4w
 E4a9F/A4dNvJWhyLO5LtIR5G8vCLMVC8CGPkoChCwEf80PEoz0B0RSEINhuT898PLbHfzkS3ewS
 SUAqdpd+qlicDhfab4dkp+AYAtZphVVNuXgyRBWDfYGjF9RthShg7oyjuDVyS6odxxpNZYR0xXz
 UeDD03GkJ9RimdeH4f9eORlTLc3DgBYDOQz4mJswdm75Hvg9TZeavlkF04Pu3n49yQrKvx7epRW
 35C8o9Hbw4/InRwwLeIsICrk1tCmJ+QMZgfIllNMHYJc2p3b7pqGJjCzcy0Ou51wFxVJKve1KBA
 /yjPLCDqnjAX4+VrVvyyKiFynhBAqtwUgQzFV4Pl4PIpgXjMCP/vkwi3QJVVkYG1CdqLgFpPstH
 kdbNUWV1wwjD7SzZsophGx2UOc9WO8QLxA4QbiN6f+I8gxVes6hBnZeb7ArWc8O3v/SQs+L7Mf/
 6bSheeG2WTvVJ+Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Extend the `module!` macro with support module parameters. Also add some
string to integer parsing functions.

Based on the original module parameter support by Miguel [1],
later extended and generalized by Adam for more types [2][3].
Originally tracked at [4].

Link: https://github.com/Rust-for-Linux/linux/pull/7 [1]
Link: https://github.com/Rust-for-Linux/linux/pull/82 [2]
Link: https://github.com/Rust-for-Linux/linux/pull/87 [3]
Link: https://github.com/Rust-for-Linux/linux/issues/11 [4]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v18:
- Rebase on Rust atomic patches (tip/master).
- Link to v17: https://lore.kernel.org/r/20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org

Changes in v17:
- Fix drop impl of `SetOnce` so that it works with `UnsafeCell<MaybeUninit<_>>`.
- Slightly reword safety framework in `SetOnce`.
- Rebase on atomic series v6.
- Link to v16: https://lore.kernel.org/r/20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org

Changes in v16:
- Normalize imports in `set_once.rs`.
- Use `UnsafeCell<MaybeUninit<T>>` rather than `Opaque<T>` for `SetOnce`.
- Use regular load in drop of `SetOnce`.
- Update attribution paragraph in cover letter with details from Miguel.
- Remove stray TODO in `set_once.rs`
- Link to v15: https://lore.kernel.org/r/20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org

Changes in v15:
- Rebase on v6.16-rc5.
- Dedent code in module macro for better formatting.
- Rename `OnceLock` to `SetOnce`.
- Use "being initialized" rather than "being mutably accessed" when
  describing initialization state of `OnceLock`.
- Use `Relaxed` ordering when transitioning to exclusive access in
  `OnceLock`.
- Add drop implementation for `OnceLock`.
- Re-export `OnceLock` from `kernel::sync` module.
- Improve indentation of in macro code. Prefix `cfg` to `::core::cfg` in
  macro code.
- Use `core::ptr::from_ref` rather than `as` casts.
- Hide `KernelParam` instances behind `const _: ()` blocks.
- Rename `ModuleParamAccess::get` to `ModuleParamAccess::value`.
- Rename `RacyKernelParam` to `KernelParam`.
- Remove `ModuleParam::Value`.
- Move `copy` implementation of `OnceLock`.
- Update safety comments and invariants of `OnceLock`.
- Link to v14: https://lore.kernel.org/r/20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org

Note: This series now depends on the atomics series [1].

[1] https://lore.kernel.org/all/20250618164934.19817-1-boqun.feng@gmail.com

Changes in v14:
- Remove unnecessary `crate::` prefix from `module_param::set_param`.
- Make `FromStrRadix` safe again by moving unsafe blocks to macro implementation (thanks Benno).
- Use `core::ptr::write` in `set_param` and drop safety requirement regarding initialization.
- Add a TODO to use `SyncUnsafeCell` for `ModuleParamAccess` when available.
- Add a NOTE regarding `Copy` bound on `ModuleParam`.
- Remove `'static` lifetime qualifier from `ModuleParam::try_from_param_arg` argument.
- Fix a typo in the safety requirements for `set_param`.
- Remove unused `#[macro_export]` attribute.
- Remove obsolete documentation for `ModuleParam::try_from_param_arg`.
- Make `RacyKernelParam` tuple field private.
- Introduce `OnceLock` and use that to synchronize population of parameter values.
- Link to v13: https://lore.kernel.org/r/20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org

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
Andreas Hindborg (7):
      rust: sync: add `SetOnce`
      rust: str: add radix prefixed integer parsing functions
      rust: introduce module_param module
      rust: module: use a reference in macros::module::module
      rust: module: update the module macro with module parameter support
      rust: samples: add a module parameter to the rust_minimal sample
      modules: add rust modules files to MAINTAINERS

 MAINTAINERS                  |   2 +
 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 181 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           |   2 +
 rust/kernel/str/parse_int.rs | 148 +++++++++++++++++++++++++++++++++
 rust/kernel/sync.rs          |   2 +
 rust/kernel/sync/set_once.rs | 125 ++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 ++++++
 rust/macros/lib.rs           |  31 +++++++
 rust/macros/module.rs        | 194 +++++++++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 +++
 11 files changed, 703 insertions(+), 18 deletions(-)
---
base-commit: 103265a1a936cfe910c9ac0f0ab153f7dac818ba
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



