Return-Path: <linux-kbuild+bounces-6600-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E1DA88973
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 19:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 947EC3AD95E
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Apr 2025 17:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3D6288C9B;
	Mon, 14 Apr 2025 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1ijFpYf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0EA1F236B;
	Mon, 14 Apr 2025 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744650785; cv=none; b=MCR4ZS/ePrGmAQVD8VfW78kACNOYa5sYM47tWehz4+0QCiFtz7BiUXgyKSFpMllAAsMj2k7iM1V/rrKGMg9lknPY8T7U0vs+R1OhiviZT6QKv31XHYwG/vX2WWOIOfgo5hVeb/2KsXUcoxJCGvZtM7B4/IcsEaU2ulc0SVaH1+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744650785; c=relaxed/simple;
	bh=ylkQokXT4qhYAlggPHU4HculS2KKVxH752KsAb9kliU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKQoyr/Fyd3ESF7KC36N5cTB52M8dADzf8TTQDkkEPS3xN70FPpGdLLX30HP8k9LOX5Wjh9AMxBq3bhM8Zbk7W+1UOM03tNyc3WILe3/V8muY4zRVMOglc8ENkySOTKZQAHwBngNvWGPgoRw1L8ZrPrGIJQzGHwnoRmBwY5ubVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1ijFpYf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94C6C4CEE2;
	Mon, 14 Apr 2025 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744650785;
	bh=ylkQokXT4qhYAlggPHU4HculS2KKVxH752KsAb9kliU=;
	h=From:To:Cc:Subject:Date:From;
	b=R1ijFpYfQGhA6bq6WujhrBCMnc8WkmPCNhW+TkcHzBFk/1bU2Sjt9oBjqlpy0Lgyx
	 +ys5PyBw1DFaFUCBTS3sMFGYyFmA3U2smH8WWtU4IpS62PRUt/p0jslfUJdkdJzJad
	 VH4Fm5Z6PXzJOM0E/STafPiIBsNHKip2IaA2fcWe9kfIlQjG0RZ+o72JXR0bqd1U8S
	 7cWd2GQVoldAYCXWbLfMygg/v6mBoJGmiYPE5eXnWqpWSl6Tll7bhFuLUUUI2PGZFC
	 rJEtGU2RVsEOKk5JVdvgssbKaWfxl+TKzdVF/jw9wCtCZ9BfPrjFgji30Nj2dFt4sj
	 rCYyn4nbLhmfA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH] rust: kbuild: use `pound` to support GNU Make < 4.3
Date: Mon, 14 Apr 2025 19:12:41 +0200
Message-ID: <20250414171241.2126137-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GNU Make 4.3 changed the behavior of `#` inside commands in commit
c6966b323811 ("[SV 20513] Un-escaped # are not comments in function
invocations"):

    * WARNING: Backward-incompatibility!
      Number signs (#) appearing inside a macro reference or function invocation
      no longer introduce comments and should not be escaped with backslashes:
      thus a call such as:
        foo := $(shell echo '#')
      is legal.  Previously the number sign needed to be escaped, for example:
        foo := $(shell echo '\#')
      Now this latter will resolve to "\#".  If you want to write makefiles
      portable to both versions, assign the number sign to a variable:
        H := \#
        foo := $(shell echo '$H')
      This was claimed to be fixed in 3.81, but wasn't, for some reason.
      To detect this change search for 'nocomment' in the .FEATURES variable.

Unlike other commits in the kernel about this issue, such as commit
633174a7046e ("lib/raid6/test/Makefile: Use $(pound) instead of \#
for Make 4.3"), that fixed the issue for newer GNU Makes, in our case
it was the opposite, i.e. we need to fix it for the older ones: someone
building with e.g. 4.2.1 gets the following error:

    scripts/Makefile.compiler:81: *** unterminated call to function 'call': missing ')'.  Stop.

Thus use the existing variable to fix it.

Reported-by: moyi geek
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/291565/topic/x/near/512001985
Cc: stable@vger.kernel.org
Fixes: e72a076c620f ("kbuild: fix issues with rustc-option")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/Makefile.compiler | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 7ed7f92a7daa..f4fcc1eaaeae 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -79,7 +79,7 @@ ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
 # Usage: MY_RUSTFLAGS += $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrument-coverage)
 # TODO: remove RUSTC_BOOTSTRAP=1 when we raise the minimum GNU Make version to 4.4
 __rustc-option = $(call try-run,\
-	echo '#![allow(missing_docs)]#![feature(no_core)]#![no_core]' | RUSTC_BOOTSTRAP=1\
+	echo '$(pound)![allow(missing_docs)]$(pound)![feature(no_core)]$(pound)![no_core]' | RUSTC_BOOTSTRAP=1\
 	$(1) --sysroot=/dev/null $(filter-out --sysroot=/dev/null --target=%,$(2)) $(3)\
 	--crate-type=rlib --out-dir=$(TMPOUT) --emit=obj=- - >/dev/null,$(3),$(4))
 

base-commit: a3cd5f507b72c0532c3345b6913557efab34f405
-- 
2.49.0


