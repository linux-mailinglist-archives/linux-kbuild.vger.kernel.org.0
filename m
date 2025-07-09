Return-Path: <linux-kbuild+bounces-7950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F800AFF026
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 19:53:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9695F3B0F36
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 17:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01013233735;
	Wed,  9 Jul 2025 17:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1fLWZJd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C65661;
	Wed,  9 Jul 2025 17:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752083580; cv=none; b=WIt5jsdLxrzRr00Rg9eEotEAe1EETj96ErTOB7tX3liAKqKhIfTBEAxtIu331ez4lUVfEzt/qiakgGXF59RprUHeVcj20EOUXiUTYn6+NSDYfz4yw80MXf/6+IXZhhFDREHc9NYCe9AjqxR3fQRvDeODQsrtLmK+Y3vo5oNv6iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752083580; c=relaxed/simple;
	bh=NfFt3y8kwBqrhW56K049VEtvcCDEKzVn5QA1fc76l+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jYBeAIY8XwUM5tLH1RyKlKAT6/qj/AuZmtI7yKU2Nbe4LRFFW1gCJqcNJu91M+KDQNZTFe3kXuR4xUc1o2oVbqS9VFJASD/bPR/T7C6CgejGHYZP8UPtBEuc3FJOtMrRNlNPlnlmV2zQUixdpnfHmBZbNF/+0FoD3OAbXHx+qKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1fLWZJd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103D3C4CEEF;
	Wed,  9 Jul 2025 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752083580;
	bh=NfFt3y8kwBqrhW56K049VEtvcCDEKzVn5QA1fc76l+4=;
	h=From:Subject:Date:To:Cc:From;
	b=s1fLWZJdnb6wTeYtEMxkr9v2aMhI6gaI2/lIkhWxAVcrr/fdux/DtoSebnDlcvUCN
	 0W0TpVF3tFuE7R5pvhgldhKKZxtNsoTvOmilS8mkXsllyf9erWEarna+jvSed1gGvC
	 /oDPzO2X5flo0l/rhpF9cHwOO1h+1EB+ri0JiweozbPM1770zMkl3c327phylvxIkz
	 eZ+xRneGAyeW10FiOiNZAQmBGVkxz4TJJ0Btt8e1fs8DS/jUbQIh+e7t+fjf6po3fZ
	 TVvoKwWex9YHDaV64gc2iRk7zT2SS7WMYkLs5UHKhh7ekiKhZqlaC+6w7whpvAFL9Q
	 QIRxSey2+5pGw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v16 0/7] rust: extend `module!` macro with integer
 parameter support
Date: Wed, 09 Jul 2025 19:52:14 +0200
Message-Id: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+sbmgC/23TyW7bMBAA0F8xdC4NznD3Kf8R9MBNjlBLSiRba
 BDk3zN0GlgFKehCAnzkbB/dmpchr93p8NEteRvWYZ5oAfrXoYsvfjpnNiTa6JCjBARg45xul8x
 e/eLHlW2C+WyyijbZoHxHx16X3A9/7+bzb1q/DOt1Xt7vV2yi7P5gosbo50xa5TkoHzH2T3/yM
 uXLcV7OXdE2+SMoDtw1BElCRG5D7EMGqAX1EJDLhqBICL3KpEjQqCpB74RWSjZNAsqAzqQUpUi
 VYPaCbQiGBJXB9z5EHyFUgt0JaBqCLXnI9FmVnJCmEtxDENiKwpUobHBc9ZiFrPMA/EFQORoE8
 FLP5KmkSVAiGgbsDWwZQIbmTlujPAZjawP3hm4ZWLLBZbI8WkKgNsTD0NB8R+nNEBFcTOBF33j
 HrjlNO5bSnSpAjAIFUHlrQ+2NVmGh9GeEXqJ2Xpng/jM+v0dwyW83mubr9xx2wa+ZxXkch+vps
 OkjaLZEVcZ1zOvq72N+OvwL3oKW1DFHcBYMAxbmt9t07PN0fjqPfrgcCaKLPr8Adjhllz4EAAA
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11214;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=NfFt3y8kwBqrhW56K049VEtvcCDEKzVn5QA1fc76l+4=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBobqxW9qrYaAf9nOV2Q9GeCaNO0dFoz3NTqeiza
 jHGwEhTXT2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaG6sVgAKCRDhuBo+eShj
 d5MbEACYFXCyU4FxvqbULzKcfYR++65Dctd2JVAYzcTvLVu7k9NZWDwbfw3+CVrtj7alftPUT+f
 KSeOmwERAWk0hpIlCvOuEdMddBTpO7Mxztgr9AyFkXnTnAGoeDJO0B/bKpJpD9lxX008xPB4lWB
 C/u0CsgnzMOaaXuOnDGWtwc1+0D+z8E/i68LFgv/mApzx77aYq5L5NtnGiCweu9MhPbOrwnF77p
 koU6E5KqbboyAwXXB1fVFIxblcpmyBfqwh7J0OOZHzQrrEqBCLHx+1fZrFuryibfFjM+0ZGOvaY
 lWU7J2ghOgorUZQ6Mx0LZCfMHvyCIzWfZz1XDzjp6aT9MmUQ5ko4++Nklazs0YVksqJt2ZndeH7
 V2pLSqkMEaptv70H0LauOEVy/EZ9AWbyup0aNG5HnrLEhvwlvNbRGHZEBqjKgjuplK0RYluOgux
 9GfQ1GlijSUoiG7OygyigP2BPXJsRwa2fKiR+qV6xtI3dgUODR5rKaDRvEJHrlw6cIBV4aAKgha
 La+bu+BhmP7AWbf8zkO0Fguew+G9Z9zQdqjD8JZ+l/6LThOXtnG5OcDD4YkDTr+a7QCj/MDyWSL
 WGVMEfYZjpwdfn1iEJqKTDd7y5GaqvB+89DBXS6iQmq6DVNr5DPUvGvz8RIsnvPnlo59QNUqnw2
 xQVbhL7DPpnzO8A==
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
 rust/kernel/module_param.rs  | 181 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           |   2 +
 rust/kernel/str/parse_int.rs | 148 ++++++++++++++++++++++++++++++++
 rust/kernel/sync.rs          |   2 +
 rust/kernel/sync/set_once.rs | 122 ++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 ++++++
 rust/macros/lib.rs           |  31 +++++++
 rust/macros/module.rs        | 198 ++++++++++++++++++++++++++++++++++++++-----
 samples/rust/rust_minimal.rs |  10 +++
 11 files changed, 702 insertions(+), 20 deletions(-)
---
base-commit: 47633099a672fc7bfe604ef454e4f116e2c954b1
change-id: 20241211-module-params-v3-ae7e5c8d8b5a
prerequisite-message-id: 20250618164934.19817-1-boqun.feng@gmail.com
prerequisite-patch-id: 997f74bd63d81dc66725d7f84ffcf5a3517da1eb
prerequisite-patch-id: 3e3f8bdada027406a356a2b35aebe13edbda0a94
prerequisite-patch-id: 468b093532aa503c23302142b8cfe7989e3cb8f1
prerequisite-patch-id: 96ca162a1e95a29d3aca2e748d600a31417b83e5
prerequisite-patch-id: 8f78abede975c0c9690ee0f4cf4e7af3cb145191
prerequisite-patch-id: a716ee7a51184d224ef60812ecfffadb51980153
prerequisite-patch-id: e54f74896a75147b66e509c1281804047d41f08b
prerequisite-patch-id: 3f77e2179901ae664a2d2e58965a9725ad13189e
prerequisite-patch-id: e964a9576f9c3970bb7a34b4d2891ffb92939d0e
prerequisite-patch-id: bba35ecdf783653e0fa46015bc289706508fac55

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



