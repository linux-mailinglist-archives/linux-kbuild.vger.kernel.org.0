Return-Path: <linux-kbuild+bounces-5410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF06A073E8
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 11:57:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2152E168774
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 10:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A302163AB;
	Thu,  9 Jan 2025 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="twUGIBpo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F752163BF;
	Thu,  9 Jan 2025 10:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420190; cv=none; b=THee81Rve+AXjdfHJDobNewoUBwNOsjBwrovFB4zHTc4+XQ+HdqLFw99Mr8XaNp5+uHWaSvEmkDNaoEKTXUmIZXO6bZcwKnntk5a8fxCd2aX+TQ4UKQDLK9MhQbrQCReZBmFq9ODffSSzhPwNHm4yA4Mv/3qOYUd3Pi/cjp2Pwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420190; c=relaxed/simple;
	bh=JMpquY1Z5yddrqRBnX3gfB4wtJxvZASc7yhREHDwwq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LRxWkt16Ax76U4WuDDjS1iDVfpxc/WHjP8UwQIurU9MBOsve8O5+hFeAnjUnZ5q5Pto/uG31MeouMqPmwhbizhjxisHrrEmkV1XIaBnpOnXucLdzuH5xVb5r8RqYBYJEA2EO20tZm5U0W2hZRBOuEiCOquOzKQmCw5187iXqKKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=twUGIBpo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA996C4CED2;
	Thu,  9 Jan 2025 10:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736420188;
	bh=JMpquY1Z5yddrqRBnX3gfB4wtJxvZASc7yhREHDwwq4=;
	h=From:Subject:Date:To:Cc:From;
	b=twUGIBpou7WwFDi3mCHyqMNTScn7z56yoL/nEp/ztfNSQA1rSWml6wQE5wFmTt3X8
	 z3urvlCzTho0+g4+W7PJbjoq2z/Kp5IVADvXpbab3VFCjowCfa61Nyj9rfWd4zz3Fv
	 j58ST+7GG0J4x+eJnnzSKyjVgpm2ua+/VA7+N1S0HzET2Qw6lav8C5mIMrko11dIgj
	 oAJ76RM8Ws5UuX4ScQuog6WMgbS1rIqQ2tz3dq8Uf59Fn1p60k8gLyp51MbcGsjM/2
	 zf2cGvknnKm2cRLxnfi6KE0U9h08/c6mhn7AoE07fJLgplWtNTtNTPOf7LSo6t71gy
	 pFPUVQ1W6Bh8g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v4 0/4] rust: extend `module!` macro with integer parameter
 support
Date: Thu, 09 Jan 2025 11:54:55 +0100
Message-Id: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP+qf2cC/2WOy27CMBBFfyXyuoPiV0iz6n9UCE2cCVjgOB0Hq
 xXi32uCEAuk2dyR7rnnKhKxpyS66iqYsk8+TiWYj0q4I04HAj+ULFStjFRSQojD5UwwI2NIkDU
 gbcm6dmh7i6LUZqbR/67I713JR5+WyH/rQtb37xOm32HlajCtxVpadMqNXyfiic6byAexuz3wT
 D+XIro8Nl6eXbWCZb2FmfdxcrQP6DgmaIxuqRlt/6l0l81ds8dE4GIIfumq3GyKDTtVNm7/6u8
 P8RQBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4721; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=JMpquY1Z5yddrqRBnX3gfB4wtJxvZASc7yhREHDwwq4=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnf6sa5GwXDS73CFuL4S0EWOZoUUrjukFQFdIra
 Fe2WUtN30iJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ3+rGgAKCRDhuBo+eShj
 d3o6EACgvYY2Ce0xR/cVFAvSzIUrY31mOw1Ami3M6yr1BEKVv4jQP8XaezP5qOn30ebO5kTthUA
 x2vKvNaBrMR0veFyiabBsFYKYzqu7NwgTI+HMKEE8U56pT/6jqT5Sn8JnNVeNkJNoi41LYW/oHM
 BXXcB1hMwCbwmbHWJZqIstGfVXKrXgzGUe/t6yYMGwOkSRUzgXTeydCExNXUxPnBuesEOMOlSbM
 JsErvV+mYPIcHjPSCsYnkbpZN2cnsXRoX8lpfK//RPKK2V2j7WURXgGgvOKTMaKaEcK2PNJJFGT
 r0r8guBeHepRIKf0aTBeGHLkQBFAgcS6pyrSV/6lvMkRSIKyYR7RtsvMi+jGqbGe833PlUJBQDV
 8waf0KoF93SOT/h8t2FPcj2VCfPTwOqzmU18QG+t/iC4N1c3EmcZrVchiRqBy0iYM/Vn5IS4cPn
 Aiv1nORWexOl8s3V5VLyCvZM3JWmZ6UmK/2psAGC1SwYAJP0TkVFPZ3vLrO28Tdpz13zsdAHt60
 JUW4EQOM6Z333SUBOMjpRucbcTaXxxzybBcibgJ8hXqQfzVXjpf+21BFel/uhDrOjiZ+bGu+a3D
 uKQLHHHh6rBtgXQb0rHwZC6xV9oQLWw0C2bbUNgX1YhiJjBcEa/nCBnpMeEZnulWkdsgacNlsUf
 phM+EFRMvBOrLvw==
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
Andreas Hindborg (4):
      rust: str: implement `PartialEq` for `BStr`
      rust: str: implement `strip_prefix` for `BStr`
      rust: str: add radix prefixed integer parsing functions
      rust: add parameter support to the `module!` macro

 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 225 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 140 +++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  14 +++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 188 ++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 7 files changed, 591 insertions(+), 18 deletions(-)
---
base-commit: e32a80927434907f973f38a88cd19d7e51991d24
change-id: 20241211-module-params-v3-ae7e5c8d8b5a
prerequisite-change-id: 20241107-pr_once_macros-6438e6f5b923:v4
prerequisite-patch-id: 57743fff5d9c649ff7c1aed7e374d08ae67dda91
prerequisite-patch-id: fe607e3e1f666e7250bf099e581d53c83fea5f7d
prerequisite-patch-id: eb030eccf23466b0e22e7c699f252c40bd5f21bf

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



