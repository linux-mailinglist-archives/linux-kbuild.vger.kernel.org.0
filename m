Return-Path: <linux-kbuild+bounces-5924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA1A481ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 721CE19C45CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31868237180;
	Thu, 27 Feb 2025 14:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOAW6u7f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7B235C1E;
	Thu, 27 Feb 2025 14:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667169; cv=none; b=YwqdVg6xJh6i5fIr/t6z6uEMVMa7Y1aDsLnCwqC6GbLun/1p8QaJPEvP4MnlbsvOG3uvE7R/1qa6yqPqfnYgn014fwYPI7iwv1kG7evC4B8ryzRjmmcFxen2CKIZWn2d5aNf4J7BixCxuPiKU3yuYb+ocKu9L32+oM76yCqySPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667169; c=relaxed/simple;
	bh=63Akarw8kksDDul8KiC7NIlex/6I8afp36O3Z2pMIiw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ITP+2KMU+iCtNqwIokBvUtvZR7yHECpJKnQZRLL6Lg4cUZ5iYz7egAZfmqimJAl24J+qXt5amC1SjWcpDuXZzpy7GtSGsPurEJ5CLZH/BSRG735sqBwp27iZUxRwAe7lK0aamr0+m2g/jxfOO651khJbxY5N/I5EDuINof+VHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOAW6u7f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09565C4CEE6;
	Thu, 27 Feb 2025 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667168;
	bh=63Akarw8kksDDul8KiC7NIlex/6I8afp36O3Z2pMIiw=;
	h=From:Subject:Date:To:Cc:From;
	b=kOAW6u7ftjw4Tig8Vr7cNVCXGFUuqzdiLI849i0Hz+vQmRGACm66E3oeLPy9embsZ
	 kP63Rek+aTo8pOa1iFJO3WTW2AC6eaZcFB7AK2F+AvZXQm0m2w5wPgCcbOFnYCaAGs
	 5miR8RMyKis1HunrYQp5QC2yj4jI4PIr2bRVgICwTuUi3FIGaRXzilOiSZ0GL7RBea
	 gv8f297EOUZaMAupTYSLNVvUdVpd8SAC7NRQRkX8v/hGlM+GjyZKg4u9m10ZDVzQhN
	 ZE2hsp72HJto06dTXNLKQ0H34SBpjbjKUcEt6hBNIlQFgmlQxVdu5QkVc8EX3ksLMI
	 76qJgEkd+D0Jg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v8 0/7] rust: extend `module!` macro with integer parameter
 support
Date: Thu, 27 Feb 2025 15:38:06 +0100
Message-Id: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM54wGcC/23R3Y7CIBAF4FdpuBbDUGjRq32PzV7wM1WibRUq2
 Y3x3XfUmHXTJtycCXyTHK4sY4qY2ba6soQl5jgOFMyqYn5vhx3yGCgzKaQCCcD7MVyOyE822T7
 zUnOLLWpvgnHaMnp2StjF7wf5+UV5H/M0pp/HhlLfpy+snmN0BFdGWwHaeum7jwOmAY/rMe3YX
 SvqJWgBYrMgKBK8FMb5ziHAXNB/ghRqQdAkuE4jKQoaqWdC8yYsVVIaEqRyctOG4FUdZkL7Lpg
 FoSVBI9jOOm89uH/C7VlzwvOFPmx6ds2czcj92Pdx2lalWYPiyQPdvv0CE8jh+eYBAAA=
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
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6258; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=63Akarw8kksDDul8KiC7NIlex/6I8afp36O3Z2pMIiw=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjP9vAafCBRWk8Aa1DbmRvaPPwsgAtApJJpy
 lWK54hi9UWJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B4zwAKCRDhuBo+eShj
 d6naEAConME8RFKungeyVlUjZV3U3lR0WGK54xM0ZYL1qZTWLfnEkSCcoBSU9JeHL9YlWHcoPUq
 q8HjM6F7aDsLsI/tdp3WFuJ/h6YFo+Fq1PCNrJX58Ww3s+dGVrSD6iq9fY3tXH1A1Gk34CcebpA
 dJkDjNE3HU53xtABxBvj17YPoKRrTA8U8FBzsL1mKyHRczMvJ+Xi/ABUuAybzQRj5Y64qQUPb+l
 Gx0s4mF2QOC4RnVsWSdPQb/iDrJQw5tek9hRATRZQjJeGb/1BfYfUpx5d8EZaSNfTwNPm+EyXsH
 5iUK3/Mt7HwJcLchOd4ZZK9AxpcUXYBeAEVOHpbv1+3rXqywAXCzDDD1VDuwQ4nPbKFt0eeiNOX
 gDyzwcRiSVHcWVvj3d5tRg2iBuRqUQfpIcychgnX6JxrQjPsQHtZ7a4119vInGDmr+Dpug9j60/
 PH6hB0q4TBf8sx66vstCBULTpxkOh+zKsr48hqgpgSEIHACBjGduM0jqBABGmzaRNbGK963G9sq
 S6Ge8mp3dszi40WUIMXNCLpLI4fzo18DgjWepEWWRRElpvcr3CtHjT68fawiW6YY8TZy72TzK0y
 iYXX5NR1H3mVMx9p5esTVipPAXk4wO9l2FceYY4dNx221KsYjTx2iLBZpf+70UvfN0KZf2mtg9D
 wRKGEHWd7yq8LEQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Extend the `module!` macro with support module parameters. Also add some string
to integer parsing functions and updates `BStr` with a method to strip a string
prefix.

Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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
      rust: str: implement `PartialEq` for `BStr`
      rust: str: implement `Index` for `BStr`
      rust: str: implement `AsRef<BStr>` for `[u8]` and `BStr`
      rust: str: implement `strip_prefix` for `BStr`
      rust: str: add radix prefixed integer parsing functions
      rust: add parameter support to the `module!` macro
      modules: add rust modules files to MAINTAINERS

 MAINTAINERS                  |   2 +
 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 221 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 200 +++++++++++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 +++++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 191 +++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 8 files changed, 663 insertions(+), 18 deletions(-)
---
base-commit: 379487e17ca406b47392e7ab6cf35d1c3bacb371
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



