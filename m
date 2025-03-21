Return-Path: <linux-kbuild+bounces-6275-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5143A6B6D6
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 10:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66A9F1730F7
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Mar 2025 09:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A49D1F12E0;
	Fri, 21 Mar 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZcyDmpl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2881F0E54;
	Fri, 21 Mar 2025 09:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742548711; cv=none; b=qj7Bi1psAaSME1vVTOph5hWFi0hueykujhPu3166CqfB3H8V5ZLbyfdc6cpUxKqSwhqSciGOhMil3NnJdBGGZ+0Y/bZ+tumfWw4FxpYUYfCniMJyYw0LMsk8zMhGcY8Y5fVMjrwx+8q6WynXAOEt5zfv4zARpbTDFjnHSaoefgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742548711; c=relaxed/simple;
	bh=kDQsq7sQ/691qbGkrkhv7JiAn1wyiy5LROOZiCBm/Ws=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MrIZmBRc3GYl9fcEnNwzjc8fALlXNhet48pZiDAlckdE8202P9Xss+mOGlLsUhET4s6WtgFzXaJFiYPR/R/LWKT/3wMMXYGDjx+7MAJIFJIS8DIKotcz8Iazxc/VAucjVhbvapkmv5UPqPHQVnlrck7wz2+8IrSj7aYf27RD8c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZcyDmpl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D12C4CEEA;
	Fri, 21 Mar 2025 09:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742548710;
	bh=kDQsq7sQ/691qbGkrkhv7JiAn1wyiy5LROOZiCBm/Ws=;
	h=From:Subject:Date:To:Cc:From;
	b=FZcyDmplgjXt1GrGm587/m/4b4bq+LJCkDNFwecBpWwDdmnI9HIKptYlRAQ3kgdJO
	 7PBce9N8OX+LAr2FOUK8ZLoYX/0OEacN3ddbVc47mndvUSJHX9G+LOATtMfAFEnagc
	 OsUgP/zFQ5sPvwOpNR/tUwYmZ0ybLCpWt80gEIfWamu5ZXllgzxhwID18eSpkR2LoI
	 mWpX2RkHhbSA21FkR2ALyG9p6iNK4hOrpEWw3SzkTmGETxTliupQSjLpnug2Expj9z
	 p4pqYC/g6jfy62b3x4DSxU7MkZVdUBZGbsv5Qi2um3dosVBq7Xj44PL92RcUoFtWZF
	 GaXsv6TUQxR1g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v9 0/3] rust: extend `module!` macro with integer parameter
 support
Date: Fri, 21 Mar 2025 10:17:33 +0100
Message-Id: <20250321-module-params-v3-v9-0-28b905f2e345@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK0u3WcC/23RTW7DIBAF4KtErEvFjMHgrHqPqgt+xglqHKc4s
 VpFuXvHiaK6shEsHhIf0purGKhkGsR2cxWFxjzk/sihedmIuPfHHcmcOAtUqAEBZNeny4HkyRf
 fDXKspCdLJrrkgvGCn50Ktfn7Tr5/cN7n4dyXn/sPYzXdPrFqifFWUjvjFRgfMbZvn1SOdHjty
 05M2qifglGgmhVBsxBRuRDbQABLwfwJqPSKYFgIrSFWNNRoFkI9E9YqGWsWUAdsbEpRV2kh2Ln
 gVgTLgiHwrQ/RRwgLwc0EtCuCm3ogXs6kptL2n3B7DKrQ14VHfn5MSwQ/kIx91+XzdmMadLXGA
 BBD7ZlpuQoVbY3OWLJQ8QFMnrHbL8gqrF9HAgAA
X-Change-ID: 20241211-module-params-v3-ae7e5c8d8b5a
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6327; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=kDQsq7sQ/691qbGkrkhv7JiAn1wyiy5LROOZiCBm/Ws=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBn3S6/aqBu/aMRv2UdeFLXgapq349vYUWshAdEC
 gzhrM+q+rSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ90uvwAKCRDhuBo+eShj
 d2QTD/wImsAlI6+Ew8qqk0ftvBp+3ldX1iliF1a51gQPYZmwr/1a/jQkIe2UNXxAOcS8IbTh3fV
 0ny37oaB7h1FVK1SPG1EK4rkQxXsuyXqfZlcw0SqHNB8hnebA7sutrs/Se4n3QBd9NviM7BY6CX
 U6x52pdvZkpwcCInQNMM9HAv48au1FqjCle17N7P8DPT2m+Rt7dgubZejA1cm9W0Xr97gn5i39K
 6JDdYd7ZzvukHycUrxq3dZoZ8uHw+4axONrKp1HQHCm6FxwcXZNX5HUswudSjkOwjp8Nj1il+qt
 YP+iwEZA+r3JX9fVpDz0XwUyUI+cOK/IPiPVXMWBanqNKXGTc4R9S7yWp9T2g9y/093mdcS/utV
 uvD4iYYM0RH9/YFXjSKqI6x48Mt9n1jKt2/fGrncYCmFOf9j0JInksKFIfmBJ8cIwgE2FR0a6zW
 0eQhzDEQHF1Y+KWFtpSrhruCdiec88qfMGsDuBv6AmUjdmO3K7eGnj9JifUyuSSClfn4frc/hMl
 ki3005Z7TKpUeFDDWmc5mwJdWKDiGez2hV84uuuj+6ia1mYF1i1rU2Sw8jthzMwjk8JRlJEBR5/
 JvMuDwZYdGh9XhQaXD9Y7gaeik6AqE7XaACNr/4lvNvz1imHFyIW7MGN9+2ey6HpJaSuk9rdbOG
 ln3rpqPF+8UtUlQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Extend the `module!` macro with support module parameters. Also add some string
to integer parsing functions and updates `BStr` with a method to strip a string
prefix.

Based on code by Adam Bratschi-Kaye lifted from the original `rust` branch [1].

Link: https://github.com/Rust-for-Linux/linux/tree/bc22545f38d74473cfef3e9fd65432733435b79f [1]
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
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
 rust/kernel/str.rs           | 170 +++++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 +++++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 195 ++++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 8 files changed, 635 insertions(+), 20 deletions(-)
---
base-commit: 5928642b11cb6aee8f6250c762857e713e7112da
change-id: 20241211-module-params-v3-ae7e5c8d8b5a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



