Return-Path: <linux-kbuild+bounces-6866-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26094AA7176
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:17:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414AC1BC7D04
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 12:17:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279EA253925;
	Fri,  2 May 2025 12:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzzP2EJg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2CC1DFE8;
	Fri,  2 May 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188239; cv=none; b=NaGoLIsCBPubnCPIF4lhhuA2rNdO069Yoz1vmKbs9WlMRcaY/S1+i4EG8fQvl3IrAnaaBy1yfjLBbp45RGuc2QTfhuYK7v+19GT/gpKkNKqUEMb1se7UegCQFWRIeCOSoxu3/MbGcCuRnuvnOtlRvk8S9/z8rbiQb38eUx74KJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188239; c=relaxed/simple;
	bh=wzcW3ekbXZkk/AcgoSnj8DaiB1np7Le7U2obV1k72R0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z8rzw64uyks3QYueZMLqNDp1pHHkKxSRUPjHJ1m5Z4kJzrPOZZ/YxZdQaRNHDvzTzYLZdfu/Bj+FogYy/N1E7RHMDfYW/2p7ciSCnfuOuqKzzfhvAAvsKj4SP/ZlTA4/zqEGTHn32s43fSbKLdCzsHWg7VeS2UaCPMAokSUv034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzzP2EJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28405C4CEE4;
	Fri,  2 May 2025 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746188238;
	bh=wzcW3ekbXZkk/AcgoSnj8DaiB1np7Le7U2obV1k72R0=;
	h=From:Subject:Date:To:Cc:From;
	b=EzzP2EJg8PbF4hBVk+lMpG3fWA9qfdPixpT04xK1fJqDOx0mFAGG9RsGdlB/wsvgn
	 iVLaxH2cr1mn77fk0ZUjzmuWTOWjL5nulFWBfiZQHdFoxcSMp05sJ/JCy9jrn19D7e
	 QveuBoc6aSfbnZMB2Kh3ldA9nEKdRW4P+pfbHH1yCnWVB7aiNaNraJMmEkDWBGI8yX
	 iliKxNYcMibsljICWdQiZtz9c+rfluvv6jlSE8iBXg7bAvA70ElL4/SkiRBJHL49MS
	 P8krKrdMEwKRQU6Jvx3wvxnqIcqa71Ic+5EYgdmaMjdCZy9ugH6OyXDZAZ9IG2OLgY
	 sEHj8BfmtEp1w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v11 0/3] rust: extend `module!` macro with integer
 parameter support
Date: Fri, 02 May 2025 14:16:33 +0200
Message-Id: <20250502-module-params-v3-v11-0-6096875a2b78@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKK3FGgC/23SyU7DMBAA0F+pfCbI4yVxOPEfiIOXcRvRJsVpI
 1CVf2dSqBJkW77MSH7WLDc2YupwZC+7G0s4dWM39BQAPO2YP9h+j1UXKMEEFwoEQHUawvWI1dk
 mexqrSVYWG9TeBOO0ZfTsnDB2X3fz7Z3iQzdehvR9/2KSS/aByRyjyytltOWgrRc+vn5g6vH4P
 KQ9W7RJPQTNgbcFQZHgBTfOR4cAuaBXQXBVEDQJLmokRUEtdCbUG6HUkqkmQSgn2iYEr2TIhGY
 rmILQkKARbLTOWw8uE8xGEE1BMEsfkI7RoZWqyYR2FaQoVdEuVRjXch0FSpX3AfhK0DgKBPBln
 sHSSIOkRvw35t91Sfh5pc27/O3MPP8AC3YgfJcCAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6957; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=wzcW3ekbXZkk/AcgoSnj8DaiB1np7Le7U2obV1k72R0=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoFLeo5oZp61CPP7vUioY4VqXpvqHhi0x3bzp/J
 JBftQZXC16JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBS3qAAKCRDhuBo+eShj
 d+jwD/4mMHXUTPbqIcMRbXRIreakO3iENafyECEEu8ovpLDmfCfLTQWm1hgb2yM4EcGZHQ8hEyY
 aHcCC4WVCy18I095uzsj9buaW2RPT+uhjZ9WSbjujNXg1w2I8c2ALBcnFF/8+T+jGwjWn0THKAE
 syWFDW2ZWQtyUz4GTbtpUSpp7Vtj93bZa/Ggr+QOVy5d6wofR55+Vz9GRL5r7SS7wCda7nduGt+
 OzVyv2DOOgERP1iUzmuPNQE6TG9ZEV7ECz7KT8WVMWJ3EyS1bBdnyoLjp/BSokJk7j16G52x5MU
 w9VY2C2vOJoqVCCB9bRoThqR4CvvvlkOoU76bq3J46esSbR7y0Q8OyecTdRu79koZYbgOG7YUi2
 Bhkirj5FiojK7+12C2XKSRc4YX5R7KWfVdL0N9tTQC+EgjRvt//1CjhOfZLfrAh+cYNwxhJDUs4
 4mc7xN3HLbRJMUrtP4vWOkmGKF4IKEwys8hhTW3VA1K+XC5Ht2IFtX76Poo9ACq/WNU7aKyqZgn
 OrevoGnLwKmxPat/Bf7RBMCjUW3pT0JFIIo/RYl+rwtrkgdPa5fXSPRYo2tIT6nLu5NASWBOs+l
 YfRJsZc+bABZhfhcmPeZW1kS5Lft7eYtDL4m3M+bqg3zZ63rlW6gSTDNMxc2u4/WrAcxSIxd523
 L+d0859OvVem3kQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Extend the `module!` macro with support module parameters. Also add some string
to integer parsing functions and updates `BStr` with a method to strip a string
prefix.

Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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



