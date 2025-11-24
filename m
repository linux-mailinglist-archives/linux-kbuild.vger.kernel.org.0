Return-Path: <linux-kbuild+bounces-9807-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9D1C814B5
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D53BE346283
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8131F313E19;
	Mon, 24 Nov 2025 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn+1KhbR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BAE313E06;
	Mon, 24 Nov 2025 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997561; cv=none; b=tJkKuyUC/JH4NoXVrNRg98y9WHfe7bvck6KqAivosA3r/rUTesLqPXyXFOxmz3mlAYSMpXVFiFW8Sk11gdW6j0S7dPh6aLLHCd493O3Gcq6z2SagYystf968b7PPjY+hJztMObuFyMfuTOklbcXk8P6XLAKM5TgVIjA9vJXL86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997561; c=relaxed/simple;
	bh=xvgRLIv5dNjSzULhi3eB0gHy3Q8Jnreth6xUv0VM3ZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QVm0VP1FEC4zoa0OsDf5DjTAnH2KoUTr9PaQYTfb2kEOBo9d8rydBrpveHvCzfzYsmBJdZduZ5Vv0sE8oi1NkenRI6T1vNOLuHe5fSw1M1EgxEsa3YpMjfpWPeQI7jeSjgyAEaF9gvLOXEXm8hCSYXNcDCims1cJRWX67jo86Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn+1KhbR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77491C4CEF1;
	Mon, 24 Nov 2025 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997561;
	bh=xvgRLIv5dNjSzULhi3eB0gHy3Q8Jnreth6xUv0VM3ZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rn+1KhbRY3v/FKQBVbCDvk6aM89E9yb1zidCQCKRvtI3TW3NjO8WAf3rCB7to/SN0
	 p37PYLh/jEahxDApbsZtFd9yLjCjS/dX7W86SQbYTIYx/hPRqZd4eFe1wjUwQfApiV
	 Uo7tkLx4FnzINYSuQXuBJz080NK0tukrejiZC3+BWDW1I9fRTd6F0S8iqDVly9iyN0
	 JDczr2xJYYf8OrXyFEfDGiU+Rgkcq1iihZzWvDXeZ1zSwOgAjVeXy9HRTfGw0QT167
	 tFqWeO4tsyLcxj1riPun57NghOezPTsAfQl4Av8abCRc4tXzHmg6SXxB9geE7EVPmT
	 mmgzefoF+2+Jw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 05/20] rust: kbuild: support using libraries in `rustc_procmacro`
Date: Mon, 24 Nov 2025 16:18:17 +0100
Message-ID: <20251124151837.2184382-6-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Proc macros such as `macros` and `pin-init` will need the ability to use
libraries such as `syn` (added later) in the `rustc_procmacro` command.

Thus add the support for it.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 6fdab341fc48..0288ca8d270c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -437,7 +437,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro \
+		--crate-type proc-macro -L$(objtree)/$(obj) \
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
-- 
2.52.0


