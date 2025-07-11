Return-Path: <linux-kbuild+bounces-7982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12549B013BA
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 08:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 876FC5A3048
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 06:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F6C1E1A05;
	Fri, 11 Jul 2025 06:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAdqe2BZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CCE1DF98F;
	Fri, 11 Jul 2025 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215815; cv=none; b=Mbra/sAFB4mLsFOZ68Y1k+tgNA84OsSFPZjaaEtnsMWvmWuHF661NDPxFFS0+aEw9GW8VLt3TSXOfBrItEeruMCNghWW9ERZNOjq6010UfWnyQ0ihGSH9eQfXbNZd0TGUohXht6YnH8/vDYu+kWDiNgxQaNH8dWo300VlRngVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215815; c=relaxed/simple;
	bh=e/RGpwywts7n4bk8tdgyYlU7ZM1r77d5Diz9ubfSqIg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OXpESF0jCvvxVBkpUB8+y26/mtsly/zz+yVD5kmG/v4BTjGphL6Icu3/K1didABvLv1p/z7LqhmZUgbJg1WkTUM0cb1QL6ncrvT/ap3PUs+15W76anFcaMDe+OKlSrXybuxGRqDHZSK8vzrpUWt/lsgvbWuwMgl2mPRTWIHtYU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAdqe2BZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6648C4CEED;
	Fri, 11 Jul 2025 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752215814;
	bh=e/RGpwywts7n4bk8tdgyYlU7ZM1r77d5Diz9ubfSqIg=;
	h=From:Subject:Date:To:Cc:From;
	b=DAdqe2BZ4EBr4ozmTa94RC88xTDiLsYo5/XbDtzv7rPY7ohErDV035I7B847GXQNj
	 d+SPj3HV3u31+hhEjTWHUxZkDb6lpZvKVybHPuYMPrwgtEydjmXwP5RAMXiwFHUDTL
	 C1EmdDi1OryNH+xiJcVq5dqYMTQCJoTXXYFTcI2L7dolwmn5aIPptTUdsIwLu4CmPj
	 mUHERnKyy/A6lnFrcK6C9hbYIyyC/Gp+m5wtNJd0l3jnW6rdKYLjeEROqUkyGq1r/c
	 6FgVpeOynuhE10ddZ2NB2ma0jtK/dDqVMV5GfprU9JnbUEli4pihVy52eQMIR4wQXy
	 Q36gA39RQr+Bw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v17 0/7] rust: extend `module!` macro with integer
 parameter support
Date: Fri, 11 Jul 2025 08:35:42 +0200
Message-Id: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6wcGgC/23U24rbMBAA0F8Jfq6DZnQPpex/lD7omjWN7V07M
 S3L/ntHCUtcJOMXCXQkzUUf3ZqWIa3d6fDRLWkb1mGeaAD626ELr246p36INNEhQwEI0I9zvF1
 S/+YWN679xnuXdJLBROOl62jZ25Ly8Odu/vxF49dhvc7L3/sWGy+zXxivMfpZL4x0DKQLGPLL7
 7RM6XKcl3NXtE18CZIBsw1BkBCQGR+yTwC1IJ8CMtEQJAk+y0SKAIWyEtROaIVkUySg8Gh1jEH
 wWAl6L5iGoEmQCVx2PrgAvhLMTkDdEEyJQ6LPyGi50JVgnwLH1i1suYXxlsmMiYs6DsCeBKWjQ
 QAr+YyOUho5BaJhwN7AlgFkKGaV0dKh16Y2cG+oloElGkxEw4IhBGqDPw0FzXOU2vQBwYYIjuf
 GOXbFqdt3KdUpPYTAkQOltzbk3mglFkp9BsgClXVSe1sbam+0mgRKhYpsUfkQgpfsP+Pz0cZLe
 r/Ri3B99HLn3Zr6MI/jcD0dNnUkYwmytPyY1tXdn4rT4ftjV2BMMSbxCGCl7KH38/ttOuY0nV/
 OoxsuR5J+0Faf/wDsj23zhAQAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11432;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=e/RGpwywts7n4bk8tdgyYlU7ZM1r77d5Diz9ubfSqIg=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBocLDRu80MRSB0rR55dcn4NEbMFNb6MjAW5BbDQ
 56SeD2xq5eJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaHCw0QAKCRDhuBo+eShj
 d5jND/9yQGOOx3vV5MJQ1aGHEb5zD5601dAMVboOz00XKK8CD8ZeudHRFmiwWjmkCJKMa4Ms4Hv
 Kmlys3xYtitfT9Jf5CbS1wGqRJhfkr7do4sQgDnwMAeZXkDjOXXfs4U4R2+ifZWAC1JpPRPodL+
 zLChtkO9zt2CUxF0bP4/fbBgaLUcvr54PlvgTzeZ7HbAkc9sQGhhIEt6CHWOkhxVykMygHKQZBH
 fFEO6Q+MdLgzEE3uNSjVyelcp6leYZ7LgVl+qfrv+L4MMqicA3PZIcxJ8Bjagf22GERWhDfEF37
 N7JllNSWbGcHM4BiT9cnjkPweoz7yUTJT996rc44OY9eMa9OvF5z1MIv4ENLHpsH/WK0ivLFSji
 xHSHEEsDDb4UVzoJK4gtI96faTa6OO0LZDayNob79i3+siWuzvHwxnr8rhrMDFpBNmoqTIespb9
 tTuJHYZnUGbMHDinXfv2K2VPciZHJd30u/e+wc7AI2LMmriTnGU+RofrrJTj36Z9fD4clICIaUl
 CsdtvDgqDN/+phNqOUjk5nZ6gdR/HgKDjnsFImd5XbTBVz4zjHJQMGOiyo6ZxgG5pSFXdp48wEU
 kkbOkdO1bjPwDr0aIBI/eL9oELUyFsskVpm6G06Bh7KfN5VN5ue/nGfCp5B8VNcsOjgj6eW8wac
 NLpj9mjM5+3tBEQ==
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
 rust/kernel/module_param.rs  | 181 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           |   2 +
 rust/kernel/str/parse_int.rs | 148 ++++++++++++++++++++++++++++++++
 rust/kernel/sync.rs          |   2 +
 rust/kernel/sync/set_once.rs | 125 +++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 ++++++
 rust/macros/lib.rs           |  31 +++++++
 rust/macros/module.rs        | 198 ++++++++++++++++++++++++++++++++++++++-----
 samples/rust/rust_minimal.rs |  10 +++
 11 files changed, 705 insertions(+), 20 deletions(-)
---
base-commit: 47633099a672fc7bfe604ef454e4f116e2c954b1
change-id: 20241211-module-params-v3-ae7e5c8d8b5a
prerequisite-message-id: <20250710060052.11955-1-boqun.feng@gmail.com>
prerequisite-patch-id: 28896267479b4eb64b31c7f0369398c3d45381d5
prerequisite-patch-id: d2f889e59033a98b2939ec8b1f73b82026eeca57
prerequisite-patch-id: 820b700bc77f6ab3b7ab41056675f8e8f27ca924
prerequisite-patch-id: 8050edc4035cf1b57251d8de496b890b87918cb9
prerequisite-patch-id: ce22d95bad2cf5b701db6d62ec3dd8e5f47d8af0
prerequisite-patch-id: 5755c226b2678a53a8cfd7d09f90743c1d6f6ae4
prerequisite-patch-id: 766b6439b20cb954b3434830603cf88626a35310
prerequisite-patch-id: 98fffa4e658617923ab1c360dc40bacb9d741e3c
prerequisite-patch-id: b393394acd88dae6dfe76ac10af2e9469a08fdc4

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



