Return-Path: <linux-kbuild+bounces-5716-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7624A31071
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BC3A3A7A55
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 15:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C07F253F38;
	Tue, 11 Feb 2025 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3z1Nc4g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18E253B71;
	Tue, 11 Feb 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289529; cv=none; b=IMY9efodoknS2LB/ccJjjPjWVmhEqKELcUxjuSVV63crrLC/DgrkVdJypGdLJzXZPuL31Vh2BseOq+ciRD6EliR6+diqe9DoYyJzgASBWa/Csw8+OAJAwxAhBFPfLUSH23ioEsdtBHips5ydzWGSYAQgR1/9zy9d68I2vwwK9eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289529; c=relaxed/simple;
	bh=V96f59sI1St+l4eq3lLlZyDJapPhepz0Mfv/so7V8l4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZC6gnIUtCWu6tJHJuovUqQK0q6lZKa9AQGzWF7bKcALsXNWynPwa0Xtp3ZuSIEqXrbOFFDWOJIQBELX7cvplEH486+crrnCHPXd/dxcdw8FH/TNDb4OYOGJPiTNs5MBAddaEFjjJmcbW2j7KvelfBuNYJb4AxqmRv2/4Z820HFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3z1Nc4g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2386C4CEE5;
	Tue, 11 Feb 2025 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289528;
	bh=V96f59sI1St+l4eq3lLlZyDJapPhepz0Mfv/so7V8l4=;
	h=From:Subject:Date:To:Cc:From;
	b=a3z1Nc4gfwF6zwxlvnJQx5OqSMhu0nHwyLWiSQ3PBqMyrA4PKzTkQq7uPoXAYDXMB
	 oNwTmWc5s7UwF+5mkjiPzP9m8zIgXH6OKeFo6X0uMz2en0fxMay9Bhzmyzp3liltBH
	 5vVNLYUjGqEp8EiLKooBFJvrqHquPkOt1vx0QxNH6mp2RDK2VFuYttzSoEOM7ZoHc8
	 krj1UEOElLvKPJmWcbzZoTlqwmdASfDdAEoE8YNLn+aYIFL/HvS8sC3hu2Nzqo5lnM
	 UIgG2K4PMGOih6pFmF8bI25SfcV//57j3Zuy18SKhwOr/j77lwZISR3xPIQ9sHX4rw
	 IfqUDJNLP63eQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v6 0/6] rust: extend `module!` macro with integer parameter
 support
Date: Tue, 11 Feb 2025 16:57:34 +0100
Message-Id: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG5zq2cC/23Q0YrCMBAF0F8ped5IJk1q7dP+h4gk6VTD2qY7q
 WUX8d93rIgsCnm5gTnDnYvISBGzaIqLIJxjjmngUH0UIhzdcEAZW85CK21AA8g+tecTytGR67O
 cS+lwjTbUbe2tEzw2EnbxZyG3O87HmKdEv8uGubz9PrDyFeOnpKmtU2Bd0KH7/EIa8LRKdBA3b
 TYPwSpQmzeCYSFoVfvQeQR4FexT0Mq8ESwLvrPIioFK23/C9V6R8PvMx5ruPZ+3aoqlHKi1HGm
 fhoD73gVKWVamrLHqrN/osuEa7HiXUYbU93FqirlagZEUgHdc/wBKue8FmAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5764; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=V96f59sI1St+l4eq3lLlZyDJapPhepz0Mfv/so7V8l4=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnq3NwjnFsBIV+qfVLyuU/3+T+Oc6z919wxI9Uu
 xxLhAFBwBqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6tzcAAKCRDhuBo+eShj
 dxQyEACrihasPUlJbz0Jbqx8v4o3umTHVDhUUR2ZI4vCz74GHaY6YcloSY0vkPFpvUIMsIe2pd7
 o34Flz1xZXXcSLrzM3Zww9TH/cOvWZY5A0AwOsiku/uUyaTju3iTkINLHtvJ/tqf8aKO0do13c7
 D/BAuYFn+PKdtf9XzEE70k8z89FQwZBJQ3zDRszT0HxogONZbcvvxeWgOf3zE/+ftXK4vgmgLSm
 Nu7oEWeNvrqdEtSRWKnzrpaX4vWVl4Hperbn1SuPqOIjWk88rr1TV88cvuvjJJHp0iowatCLmMb
 veMUMbdd83E6Wk2w2BQoeTEkCS1oMqlm6TsOLNZtOmbS5wScL3zgnCMKEPH0t6fTYCAQWL8fj9b
 CKeyrb3Lr0r8ogQhzZRFwgk2vu1YsqdEE8HnzOxRQvTDaIyHCqw+sd8KTfKY/aq58qpoO90uJI+
 JwZzvSMbEGc5th+lTOdaBKVP10RX0OY1SgyX1z/XinaZfYr92VvQezr0SDXA4JZlyzLbRckvbc+
 S8zh9cs8jlti7MO1urhsjQHNMAJiS+1/Pt3gjzhJriKzQ4Z3f9hn1X1mLOdyI6MgE+DFyiY2nc6
 bu8jcYytDP0M8PdlPa1L8PM6aavLms4zQ256XO8CsvUsDut/4L/fzQiGHbkJk3FLl9+IpPaY0HB
 Bm0xi0BbmcDMahA==
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
      rust: str: implement `PartialEq` for `BStr`
      rust: str: implement `Index` for `BStr`
      rust: str: implement `AsRef<BStr>` for `[u8]` and `BStr`
      rust: str: implement `strip_prefix` for `BStr`
      rust: str: add radix prefixed integer parsing functions
      rust: add parameter support to the `module!` macro

 rust/kernel/lib.rs           |   1 +
 rust/kernel/module_param.rs  | 225 +++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/str.rs           | 156 ++++++++++++++++++++++++++++++
 rust/macros/helpers.rs       |  25 +++++
 rust/macros/lib.rs           |  31 ++++++
 rust/macros/module.rs        | 191 ++++++++++++++++++++++++++++++++----
 samples/rust/rust_minimal.rs |  10 ++
 7 files changed, 621 insertions(+), 18 deletions(-)
---
base-commit: 379487e17ca406b47392e7ab6cf35d1c3bacb371
change-id: 20241211-module-params-v3-ae7e5c8d8b5a
prerequisite-change-id: 20241107-pr_once_macros-6438e6f5b923:v4
prerequisite-patch-id: 57743fff5d9c649ff7c1aed7e374d08ae67dda91
prerequisite-patch-id: fe607e3e1f666e7250bf099e581d53c83fea5f7d
prerequisite-patch-id: eb030eccf23466b0e22e7c699f252c40bd5f21bf

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>



