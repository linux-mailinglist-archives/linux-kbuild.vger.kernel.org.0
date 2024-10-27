Return-Path: <linux-kbuild+bounces-4341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40A9B1F00
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 15:57:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B17301F212A7
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 14:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A24713A265;
	Sun, 27 Oct 2024 14:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLGvJKtX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9212C13B;
	Sun, 27 Oct 2024 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730041019; cv=none; b=pTgkUws9hS+d4dgxIsw4wMPzZgZ0wKHd0MlUAwtMyh2LpvxU86fW0A8HXrc5J9E6Wwrb4HvkJZUaPqBfgGC7tqKldYGzyR43A0VVibeWtBg09ceqvKUKalMVEJuxY7YH8enJOi212BlUxNLkp+aSFSMNLtpPPKlpfIcEzXlTddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730041019; c=relaxed/simple;
	bh=7ZZH3dE8R6xGp6O0QBNTJfT3j6IIfvB12djZK2Q9kDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H96tj28H29LfnroDc5T3aOi7UaBLpSuKjGXjMs39C7XMFid3dgdy9q9qdGOzaQNUqM4c/WSfmeYNwT43tUIN2TgJbqI42jbO662Hq75U6amvHrkLITnGh0ulyWQV2HxE7nK700tFC0bi7cZa8jxX8T3xiuM/v6oKwu/hHv07gSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLGvJKtX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D9CC4CEC3;
	Sun, 27 Oct 2024 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730041018;
	bh=7ZZH3dE8R6xGp6O0QBNTJfT3j6IIfvB12djZK2Q9kDY=;
	h=From:To:Cc:Subject:Date:From;
	b=SLGvJKtX4DKXURQNQNzsXcOyZRL6H8lSqMHh3s4BIk3tBSb3+tn/AtUK4ifY8N2zW
	 UEUCKlhlKYWpI003y5KRXD+N5nxMOWB9kijonAyUcI2VjBB3U3of98sxCHqM2jEhEA
	 HNIIKrT3H2Odk+VS7nvHmJTTE7aIrckMOxwD/xw/XKZVrQ2wCs5CO7yIHSLAd1shV4
	 S9USUxCHSLGhwsLR3veVb2ffQEQGCw2EIs6jkKj3189uXfioWVyA6HdebKlnGtqOWB
	 fDjTIho6Hpokac1n3AaQqZnzRW8/2UiTgub0SVkDZ/2J6nO3PYQ48L3Ohs2YaGtk8t
	 Q13iWYHzjgyEg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Cameron MacPherson <cameron.macpherson@gmail.com>
Subject: [PATCH] kbuild: rust: avoid errors with old `rustc`s without LLVM patch version
Date: Sun, 27 Oct 2024 15:56:36 +0100
Message-ID: <20241027145636.416030-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some old versions of `rustc` did not report the LLVM version without
the patch version, e.g.:

    $ rustc --version --verbose
    rustc 1.48.0 (7eac88abb 2020-11-16)
    binary: rustc
    commit-hash: 7eac88abb2e57e752f3302f02be5f3ce3d7adfb4
    commit-date: 2020-11-16
    host: x86_64-unknown-linux-gnu
    release: 1.48.0
    LLVM version: 11.0

Which would make the new `scripts/rustc-llvm-version.sh` fail and,
in turn, the build:

    $ make LLVM=1
      SYNC    include/config/auto.conf.cmd
    ./scripts/rustc-llvm-version.sh: 13: arithmetic expression: expecting primary: "10000 * 10 + 100 * 0 + "
    init/Kconfig:83: syntax error
    init/Kconfig:83: invalid statement
    make[3]: *** [scripts/kconfig/Makefile:85: syncconfig] Error 1
    make[2]: *** [Makefile:679: syncconfig] Error 2
    make[1]: *** [/home/cam/linux/Makefile:780: include/config/auto.conf.cmd] Error 2
    make: *** [Makefile:224: __sub-make] Error 2

Since we do not need to support such binaries, we can avoid adding logic
for computing `rustc`'s LLVM version for those old binaries.

Thus, instead, just make the match stricter.

Other `rustc` binaries (even newer) did not report the LLVM version at
all, but that was fine, since it would not match "LLVM", e.g.:

    $ rustc --version --verbose
    rustc 1.49.0 (e1884a8e3 2020-12-29)
    binary: rustc
    commit-hash: e1884a8e3c3e813aada8254edfa120e85bf5ffca
    commit-date: 2020-12-29
    host: x86_64-unknown-linux-gnu
    release: 1.49.0

Cc: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Gary Guo <gary@garyguo.net>
Reported-by: Cameron MacPherson <cameron.macpherson@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219423
Fixes: af0121c2d303 ("kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/rustc-llvm-version.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/rustc-llvm-version.sh b/scripts/rustc-llvm-version.sh
index b6063cbe5bdc..a500d1ae3101 100755
--- a/scripts/rustc-llvm-version.sh
+++ b/scripts/rustc-llvm-version.sh
@@ -13,7 +13,7 @@ get_canonical_version()
 	echo $((10000 * $1 + 100 * $2 + $3))
 }
 
-if output=$("$@" --version --verbose 2>/dev/null | grep LLVM); then
+if output=$("$@" --version --verbose 2>/dev/null | grep -E 'LLVM.*[0-9]+\.[0-9]+\.[0-9]+'); then
 	set -- $output
 	get_canonical_version $3
 else
-- 
2.47.0


