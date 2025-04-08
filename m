Return-Path: <linux-kbuild+bounces-6524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93349A8183F
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 00:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77D051BA312B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 22:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD822505A6;
	Tue,  8 Apr 2025 22:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5RtukQr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668C1DF99C;
	Tue,  8 Apr 2025 22:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149804; cv=none; b=ox1PxSrnzdiOqFh3w1yjU/bfSO0yM15aZXDZQJ76FjnuisKTPDS2Y88Jiit95lZuyArAcAKTS/iTcvcDWYb6shqGR6wLgFx8a1M30NQshv44x5sCK/Dsaxnc9AMOGDYrUI5DhadW0vAlMHRh68nVKCxMOTy98EM8Qg+3rim0R5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149804; c=relaxed/simple;
	bh=xOdajHCO7ZEy273vrF1Pnc6StW6I57Grl/gjkVjIkWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YsH8KSh9oy5c+cgKNcp/R/uEoBkNegU2lQjZiWtozcheV/0JRh9uJrpjsTGKq45nXoPTKpHk1F6E2mys5Os3SaXThjFUQHHNaAddb+PiDi+BQcCRwxWOWv7MCTIKup5m5VTLOD78fpkvNeeN4OEbY4PoKBNrMpwRqfMkNxuFmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5RtukQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C24C4CEE7;
	Tue,  8 Apr 2025 22:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744149803;
	bh=xOdajHCO7ZEy273vrF1Pnc6StW6I57Grl/gjkVjIkWQ=;
	h=From:To:Cc:Subject:Date:From;
	b=D5RtukQrS76KOBf7UmuXRFauX6hLjObdzmn0OWN9xK/NoMAcu8uhjxssvQNC5djne
	 RlgRfMnbiUSHS+XP+kl3kJf/r3orZpQy7Y2m7HO1Wq1YiqfMzcClDR0AEVZZwjZBi/
	 UITi47XD18B37q0mXbwxN3WG11OEpR5SUPLlz/QAx/1Y/JP0dQuoV3ee0W4NpNNN++
	 pqdEn1r2HrZXhPFcplm6t9J1U2QMCvetgMKPIg5QKOeGS+nwIXc4ihjAsw79GYgmPk
	 CTYEZ5QR/R/rJdcOiH1eqlbAdnoqFnZroXBW5RkUvlI2LhWSghfndTf+h8FpvY13K3
	 0xIc2Rs8CA8HQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Matthew Maurer <mmaurer@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] rust: kasan/kbuild: fix missing flags on first build
Date: Wed,  9 Apr 2025 00:03:11 +0200
Message-ID: <20250408220311.1033475-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If KASAN is enabled, and one runs in a clean repository e.g.:

    make LLVM=1 prepare
    make LLVM=1 prepare

Then the Rust code gets rebuilt, which should not happen.

The reason is some of the LLVM KASAN `rustc` flags are added in the
second run:

    -Cllvm-args=-asan-instrumentation-with-call-threshold=10000
    -Cllvm-args=-asan-stack=0
    -Cllvm-args=-asan-globals=1
    -Cllvm-args=-asan-kernel-mem-intrinsic-prefix=1

Further runs do not rebuild Rust because the flags do not change anymore.

Rebuilding like that in the second run is bad, even if this just happens
with KASAN enabled, but missing flags in the first one is even worse.

The root issue is that we pass, for some architectures and for the moment,
a generated `target.json` file. That file is not ready by the time `rustc`
gets called for the flag test, and thus the flag test fails just because
the file is not available, e.g.:

    $ ... --target=./scripts/target.json ... -Cllvm-args=...
    error: target file "./scripts/target.json" does not exist

There are a few approaches we could take here to solve this. For instance,
we could ensure that every time that the config is rebuilt, we regenerate
the file and recompute the flags. Or we could use the LLVM version to
check for these flags, instead of testing the flag (which may have other
advantages, such as allowing us to detect renames on the LLVM side).

However, it may be easier than that: `rustc` is aware of the `-Cllvm-args`
regardless of the `--target` (e.g. I checked that the list printed
is the same, plus that I can check for these flags even if I pass
a completely unrelated target), and thus we can just eliminate the
dependency completely.

Thus filter out the target.

This does mean that `rustc-option` cannot be used to test a flag that
requires the right target, but we don't have other users yet, it is a
minimal change and we want to get rid of custom targets in the future.

We could only filter in the case `target.json` is used, to make it work
in more cases, but then it would be harder to notice that it may not
work in a couple architectures.

Cc: Matthew Maurer <mmaurer@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>
Cc: stable@vger.kernel.org
Fixes: e3117404b411 ("kbuild: rust: Enable KASAN support")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
By the way, I noticed that we are not getting `asan-instrument-allocas` enabled
in neither C nor Rust -- upstream LLVM renamed it in commit 8176ee9b5dda ("[asan]
Rename asan-instrument-allocas -> asan-instrument-dynamic-allocas")). But it
happened a very long time ago (9 years ago), and the addition in the kernel
is fairly old too, in 342061ee4ef3 ("kasan: support alloca() poisoning").
I assume it should either be renamed or removed? Happy to send a patch if so.

 scripts/Makefile.compiler | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 8956587b8547..7ed7f92a7daa 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -80,7 +80,7 @@ ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 # TODO: remove RUSTC_BOOTSTRAP=1 when we raise the minimum GNU Make version to 4.4
 __rustc-option = $(call try-run,\
 	echo '#![allow(missing_docs)]#![feature(no_core)]#![no_core]' | RUSTC_BOOTSTRAP=1\
-	$(1) --sysroot=/dev/null $(filter-out --sysroot=/dev/null,$(2)) $(3)\
+	$(1) --sysroot=/dev/null $(filter-out --sysroot=/dev/null --target=%,$(2)) $(3)\
 	--crate-type=rlib --out-dir=$(TMPOUT) --emit=obj=- - >/dev/null,$(3),$(4))

 # rustc-option

base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
--
2.49.0

