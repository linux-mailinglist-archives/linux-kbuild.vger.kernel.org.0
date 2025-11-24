Return-Path: <linux-kbuild+bounces-9806-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9082DC814AC
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE309347E3E
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29D5314A89;
	Mon, 24 Nov 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCncgcZo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BC6314A80;
	Mon, 24 Nov 2025 15:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997557; cv=none; b=uYoLdsB1k61Lc37ShiVwsuDqKkSJxXG3y8qPP8AK1VSSuCa4/Gnh5BNl62DbGPSkQNPhA4nTO392sri7EfEzP5xrHleD91eGqAxIDYG3boxTRHGQX+lN2AxLrltKyYNEBEzFQjx1TPU+vbofmlcfaddAZ+aofPtFIEx4qwbVflE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997557; c=relaxed/simple;
	bh=BYq28y2dSLEjQ5ZXYLjJVlE82VaBFdRbCujBSLfgKb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aWx+rQ9lhDD9AUD8cElwjYw3QpdpDOoyLVF8nCCtqpkAzNkV41go+k1G4FLO2IYXF9QrvW4Ksu1FE+wj4tO/T87S5lmyUggqq0ssH/5vUCPJaY13IGiuZH2xt5k08V9CDQGeiOOalRgAXOK3BbaFaJ6rHeZ0jT8DMoYLu4fcZJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCncgcZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A82C116D0;
	Mon, 24 Nov 2025 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997557;
	bh=BYq28y2dSLEjQ5ZXYLjJVlE82VaBFdRbCujBSLfgKb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nCncgcZovWdjf7jPcvgBsiEYMQXZwHpn7KP7SEh1sGDSvmKbeUAX9tzd1EpbN3r5v
	 DnF7phm6zt+jiN5y+zyPyxI7CYTOpHbwCLF3NG1vLhIm+K3ZZPOp0ttmDLmMcID8Ex
	 28ifw6viYURIQfS+4GKPyODveRmVoqIP+mDhVK5WvQohyjSddg3QrkkHf8EHTvJJ3h
	 YviCrY306H+C+8isMOHcA41j+a4cH/3CyjgIavt4kt8OYRB+Visgrt2NzZ5gBmDau3
	 NNtI97f6fAm6GK02u1+7Mg54whKiMvWMOoaIPUtBpxCViE7htDUi3HrbrArRO1pmMN
	 yVRvilZQAWeHw==
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
Subject: [PATCH v2 04/20] rust: kbuild: support skipping flags in `rustc_test_library`
Date: Mon, 24 Nov 2025 16:18:16 +0100
Message-ID: <20251124151837.2184382-5-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Crates like `quote` (added later) will need the ability to skip flags
in the `rustc_test_library` command.

Thus add the support for it.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 45ef84513b6c..6fdab341fc48 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -172,8 +172,8 @@ rustdoc-clean: FORCE
 quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
       cmd_rustc_test_library = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
-		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
+	$(RUSTC_OR_CLIPPY) $(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
+		@$(objtree)/include/generated/rustc_cfg \
 		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
 		--out-dir $(objtree)/$(obj)/test --cfg testlib \
 		-L$(objtree)/$(obj)/test \
-- 
2.52.0


