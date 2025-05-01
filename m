Return-Path: <linux-kbuild+bounces-6828-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFBAA5BAE
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 09:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 992F54C3FE2
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 07:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612B3277036;
	Thu,  1 May 2025 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCUxrJTF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3C527700B;
	Thu,  1 May 2025 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086094; cv=none; b=nlbEejNpovSP01+DBSdbuaEMfQZgsped52CQRn29m6WBRcS95FlisaHlWzCb6+rhM5XjZrmgYC5usoJL2psB4b2DwGrIy/DEwZUJcLdbeaO4BLFDoz+cxApBY+01KZ39G+RTiaFyhQFBWn8xxrToLYVSy5lpNgf4dUGWCxjK7cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086094; c=relaxed/simple;
	bh=ZucPlAzXlvyE5gmDzndkAzXDoCFWRluH9j0zb6OrssA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cVP1lUKviHEfp8fHrqImgZPV6+IUSVIRPKip5t7cj/KbusdoxAS2WwUXN/5Ons/LjyrvtGy28OtlKhk1G6d4FEncx7uvyaf0ctn4qQAoDLzdJFvO/DcOXzdlZXvVVNY6dwLYCiEZ7H5NjnX8AofnrofM4gdmtSKBeRv5sI+9AuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCUxrJTF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4D3C4CEE3;
	Thu,  1 May 2025 07:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746086093;
	bh=ZucPlAzXlvyE5gmDzndkAzXDoCFWRluH9j0zb6OrssA=;
	h=From:Subject:Date:To:Cc:From;
	b=vCUxrJTFb6fIgWPlBFwFBWKdIYDKEqDQdInpCV7BMT2s9tnoguye3UUo4rhK9p1yy
	 bs9nP+uI144TvXjMv6SG9+lm0u9EOXaNv/J4tfyRu3PCce6h1higq/AfAEoaMCdlQF
	 weEUK21796OeG9F39w4tkdUvxWPcj1GutrXLoXssO4orSHRbSl1Q0iKZS+X4hWkG4+
	 5EMTSi/qxvYD+vVhM24vPD25rxZqeYzC3d375MiDCUO08FtelQ4dOTf7A6Qu6PfBAK
	 33Xp7QCY4DFGIbZh0ppKyXUgyC4sr19fPDG8V5c84dSEsz4ErfA50pMRxKxTPO1Uke
	 w8wKv16n9gu+g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v10 0/3] rust: extend `module!` macro with integer
 parameter support
Date: Thu, 01 May 2025 09:53:36 +0200
Message-Id: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIAoE2gC/23SzW7DIAwA4FepOI+JPwey095j2oEf06K1SUfaa
 FPVdx/pVjUTIC625A/Z5kImzAkn8rK5kIxzmtI4lICzpw3xOztskaZQEkQwobjgnB7GcN4jPdp
 sDxOdJbWoEbwJxoElpeyYMaavm/n2XuJdmk5j/r49Mcsle8dkjZXLqDJgGQfrhY+vH5gH3D+Pe
 UsWbVZ3ARhnfUNQRfCCGeejQ85rAR6CYKohQBFcBCyK4p2ASuhWQmskc1cEoZzodQheyVAJei2
 YhqCLAMhttM5bz10lmJUgdEMwyxywHAOhl0pXQv8QpGh10S9dGNcziAKl+j+H6++qM36ey685/
 e37ev0BAkuY7VMCAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6807; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ZucPlAzXlvyE5gmDzndkAzXDoCFWRluH9j0zb6OrssA=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoEyiaiMLBBV6ZEjTMa3zUUUNz68rqGWNzlnude
 qOqU5ehr3+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBMomgAKCRDhuBo+eShj
 d/o0EACTYXUv6d0BVoEvjNHyIBO0SmN7ENiHBchNzwSs1GvgQvyGHAaq7jk1XJFXv7YHlJVEnIq
 qwhqyG0tmm5hvqjECZQpeiOXxaQ+WPd9Fw4luH930mTuWu/NHMm0auClmTx1MEMCaQXTnsUd1uY
 iz0Kb/0PR2kY8TcRs0RVDZYrXm45TR8V7EyJVzMbQpZVr2yzD4Sr9lEu0XR+rVWSWd4nrekWc19
 rJ50OysaLjfK0OJo4lU8tEGXBdslS0fgyx9oxWl7F2tKDa69s5+RqU+vcZK0GAV8cHQYiJOw2to
 ZbLMDmAOE4DFTiHWlyVM+dLLRzaruCQFIPd9MRJPQI9J7up9xZPn5uIw79ZIP2hY6hqXdejrDvj
 1otADfTlZiSs/SsBx5eTm9T6uH148WMbGfNU2kwriLItu/4enuFO5VBm4a76jepRPzeFkWbItk6
 QQc9zNcsaS2ZKvgsy5zI9UaAeSJ2V4Y8kSVHS0zRUAqgMSSt3JdYU6bMFF5heXJdixNwgUxScMq
 dUt9QACmZIAweUAXb/t7wQAyaTl/b4iLx2DlneDA/QK1xPrlTy/z+x/EoKOBgDBC/DWCgPTeCBl
 oVa98xg9oPN+n4bGTKqF5RxvrONlUsNS9jfh44aewpVJ6q20V2/RZvgdUXq9BvLvGAyzf0lR8c4
 6ws1c82opeuXZ6w==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Extend the `module!` macro with support module parameters. Also add some string
to integer parsing functions and updates `BStr` with a method to strip a string
prefix.

Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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
 rust/kernel/module_param.rs  | 221 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 172 ++++++++++++++++++++++++++++++++-
 rust/macros/helpers.rs       |  25 +++++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 8 files changed, 636 insertions(+), 21 deletions(-)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



