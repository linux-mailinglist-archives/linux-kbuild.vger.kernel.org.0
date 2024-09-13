Return-Path: <linux-kbuild+bounces-3544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 558EE97877A
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 20:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CEC01F258CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Sep 2024 18:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8013126BE6;
	Fri, 13 Sep 2024 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tj7Kua/3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99DB446AF;
	Fri, 13 Sep 2024 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726250788; cv=none; b=BXc3lMI+meO451bz7Tgzw/TQTM50fhHjIKUIdB3bi1ZzBzbIp2fnJHkM5glo7XHVq37eO+lrI5O6sa/Xs46dre/jAfswzAY4Ew8sK6/nDB+xMrDr7ohjFurX2EIYfzAXvTckCajPe7EpMw2sYlDa53U9Csr8AcwNADIjdiKQSQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726250788; c=relaxed/simple;
	bh=2jSUwK3ok+ItiZnWlopILuxmtn6sSOQCXeuyuT4Nx1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dnxXYHUvD12nEp0mgUH1RWRv2LsBx+wf+Hc20PzHVrUd4+poMyIVVmpb/9jSh4GWfITtpGM19lIACIyDM9l/krSF5CKJqnrIiyE0S1Dh8ZC7/HqK/qgqa/Y2i2G74Jc/e+ti6XpT9P2DS5ihhSfYUy3tDu5nELBW9Kx87VicLyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tj7Kua/3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5EFC4CEC0;
	Fri, 13 Sep 2024 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726250788;
	bh=2jSUwK3ok+ItiZnWlopILuxmtn6sSOQCXeuyuT4Nx1A=;
	h=From:To:Cc:Subject:Date:From;
	b=Tj7Kua/36ark1PAnazD1tCbN4lhY97h09dJ1Uo9PNkgVaDGDwQo/IX1Pfz33n0B9T
	 5SBnxDOMm7tpDJUZ2KbFb9kFBl4VUxvW17gNtafuHma4b1OAeiQ37xPdVNkN5piDuT
	 B5EWamN7pFv2HsuSBeygSYP0hV1Z7K1k8bpt/vnoQkxyPCsNNCYPT/OoWRNDHTNnXL
	 mx/H2w2BBO6/Dy4in/lfsES90QvMrUxXxtiWCiQ7ErkbgdkmrZ2ptA2GEVO1FJMUP8
	 wtSc0GwKTh1IuGzvgqpsF/1oZgiG5MuLh5rPrYEfaHT/DWUKbc3YdFaf88rCqbwfsI
	 Ulo1AjeA9ZUTg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	rust-for-linux@vger.kernel.org
Cc: Finn Behrens <me@kloenk.de>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: remove unnecessary export of RUST_LIB_SRC
Date: Sat, 14 Sep 2024 03:06:20 +0900
Message-ID: <20240913180622.1327656-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If RUST_LIB_SRC is defined in the top-level Makefile (via an environment
variable or command line), it is already exported.

The only situation where it is defined but not exported is when the
top-level Makefile is wrapped by another Makefile (e.g., GNUmakefile).
I cannot think of any other use cases.

I know some people use this tip to define custom variables. However,
even in that case, you can export it directly in the wrapper Makefile.

Example GNUmakefile:

    export RUST_LIB_SRC = /path/to/your/sysroot/lib/rustlib/src/rust/library
    include Makefile

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
This code was added by this commit:

  https://github.com/Rust-for-Linux/linux/commit/3f46885dc03ed2d750085b2237078a1628323964

Please me know if I am missing something.


 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index d57cfc6896b8..b194b7702a2e 100644
--- a/Makefile
+++ b/Makefile
@@ -578,10 +578,6 @@ else
 	RUSTC_OR_CLIPPY = $(RUSTC)
 endif
 
-ifdef RUST_LIB_SRC
-	export RUST_LIB_SRC
-endif
-
 # Allows the usage of unstable features in stable compilers.
 export RUSTC_BOOTSTRAP := 1
 
-- 
2.43.0


