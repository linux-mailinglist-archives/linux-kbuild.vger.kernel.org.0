Return-Path: <linux-kbuild+bounces-5112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BA89F0B4F
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:35:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5E4F1635E5
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D531E04B5;
	Fri, 13 Dec 2024 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDQ5dIgX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F41DF736;
	Fri, 13 Dec 2024 11:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089624; cv=none; b=bhDEShlEwllpsfufGGE2XZmb+mg550FDQmlSqw1RMF2R7xO3fdUmCtHRxDvf1yEENQXRnXMoy9msG9fInQPo8yY5UA00aKw9Zvaacz+kITNdyZMvhdUNP0ylHKWM0bgmoAzfBzfd9KockhHdxXPj38PxkXFVHjOizZ/PobBr5e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089624; c=relaxed/simple;
	bh=jn1+kwErRSsB5tbg2oGFUgowoj8MlSLJ2/SRH/JeQmM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PswrXkR9ptbSMq563+V2jYOvqGr3rNhsFi1sOPD+rGv9nyjE8jb/KtiLwtizXtS7gy5pdpPRgroZCVYbwMZbXVtG2npHBXczkrRqx7Z4jMndp4m392e0MSCd854ukvqtCyIT7YZwjNRVYmE7A2dluguDW5YoXlmsy7PzvPv8UCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDQ5dIgX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44FBC4CEDD;
	Fri, 13 Dec 2024 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734089624;
	bh=jn1+kwErRSsB5tbg2oGFUgowoj8MlSLJ2/SRH/JeQmM=;
	h=From:Subject:Date:To:Cc:From;
	b=sDQ5dIgXsch9/E4ObBb7dYLt1CMJDE+1uaYpIrltl0BLYFCUh8gzlMfBCZv8rtf9l
	 x7riOOYVxIAuLGRKfAZcGS1doiTgzeJILDQibOzWclMxtdPLnO1LAqxB1E8xp8Nt2F
	 cFobAm6wfzdhzSxYzjSf8v1oHNQhq21fGwnEuItf5KexQNXtPASq0g0wr0mXogAxpk
	 g7Ich5qQz3aNf7H3DOe3pyOKzNO/g32X3Twz9IeZIWrJ3V7S8yALv3H4wMShj+K3W/
	 CT4A5YuVFYGDhNSY5CjsK4OotTCTCaVXRA7jXckLfC1YGrYYAoY2HxeJxXZSzq+Ld8
	 ACRKxCIy1BmqQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v3 0/4] rust: extend `module!` macro with integer parameter
 support
Date: Fri, 13 Dec 2024 12:30:45 +0100
Message-Id: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOUaXGcC/x3MQQqAIBBA0avErBtILYquEi2mnGqgNJQkiO6et
 HyL/x+IHIQj9MUDgZNE8S7DlAXMG7mVUWw26ErXSiuFh7fXznhSoCNiMkjccjN3tpsagpydgRe
 5/+Uwvu8HpqE7MWIAAAA=
X-Change-ID: 20241211-module-params-v3-ae7e5c8d8b5a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3680; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=jn1+kwErRSsB5tbg2oGFUgowoj8MlSLJ2/SRH/JeQmM=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnXBrr0zsNb2QcluQ3v0wkkSyjDhb02usZ3esuJ
 diQngHvJgSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ1wa6wAKCRDhuBo+eShj
 d83wD/4+9Pj/7slOT/674RxtE6Eo/6z2lNzvbDAzozudCdLD7JiUToKxx+mNoPttOYhJ+x0+3Vk
 BzLi2eusFMNErvnfAIL7rHTC4zkWn0bM4rmjlJxBR6e/1haYsfY1nO5Lv7p3sQ5GTuz6SfIudsa
 lO5Br+TITIAo8urxOS5hvHPYaRxpxAShxpSbkbu1UrNEJHKziI7zHv/mH3LEq08zL+ijvAbVB9Y
 J4BzyZRKyzGqxC1XQLGnVxSDYtmQdYf9cYGI0V2vhTLmhsJ4NAM/1kr6BQau9gXLkrKVAlL6IZJ
 WHJKLp0wsxw+b2WnNk3xjr1luop8WVNZOiP2uZE5fLUi6R+1xSnhCfHLLByiUi9UfX7iZDeUhgG
 6HEUC6D72vbqCl2zBl1KQj/iijrMYcT+diEQGMzJmne7jqCN+zrfSL71kLmE5bfB9INPHScRNpG
 KwAXZE+pe9O7KaIqygKM7TfAf2YEuDZvkGtJ8rZ8jKyZi2AJUKhfss1MzpTljU3awSE/BJPB/Xc
 K5nuLvZMfj66BHEHeavqhbhn6CT41xHPG45oMCya64i6R1N+zIF+1d+TvjY/+DlBrexlmgbZv//
 /rwKS4WR5p8v+1nZiEfJaejv6HVNwAFclnM6XaXZby2qw1zCayJ4GFvp23sQUJzoW+oE4oxzt2X
 1sOzPPGdeomR3pA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series extends the `module!` macro with support module parameters. It
also adds some string to integer parsing functions and updates `BStr` with
a method to strip a string prefix.

This series stated out as code by Adam Bratschi-Kaye lifted from the original
`rust` branch [1].

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes since v2 [1]:
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

Changes since v1 [2]:
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

Link: https://lore.kernel.org/rust-for-linux/20240705111455.142790-1-nmi@metaspace.dk/ [2]
Link: https://lore.kernel.org/all/20240819133345.3438739-1-nmi@metaspace.dk/ [1]

---

---
Andreas Hindborg (4):
      rust: str: implement `PartialEq` for `BStr`
      rust: str: implement `strip_prefix` for `BStr`
      rust: str: add radix prefixed integer parsing functions
      rust: add parameter support to the `module!` macro

 rust/kernel/lib.rs           |   2 +
 rust/kernel/module_param.rs  | 238 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 138 +++++++++++++++++++++++++
 rust/macros/helpers.rs       |  10 ++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 188 ++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 scripts/Makefile.build       |   2 +-
 8 files changed, 600 insertions(+), 19 deletions(-)
---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



