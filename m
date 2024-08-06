Return-Path: <linux-kbuild+bounces-2872-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 084DC949C56
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 01:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD3EC1F24421
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 23:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122F2176230;
	Tue,  6 Aug 2024 23:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EreqYhvy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12EE39FE4;
	Tue,  6 Aug 2024 23:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722987382; cv=none; b=NDsqVHGXISmesawNM/+usVgp9gjyMtuUsm+7yeFNCRpsTtwBWjwD1uI5sPDGq39eOYlo/2uuEe+1isSXtfjgcQqjWwIdARXajafzCQOabwIXrz8AVeNS1Hm7eYPG6JOyge0BTemiECpopK1mWKJytEGEcNmUBpCiNMwaiqR4nDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722987382; c=relaxed/simple;
	bh=HvuOrPo3FbqeTebg5upB2dxLOqiJwN9g17WEbgv8D1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vCnF185afgmHzwEyapah5DxaGKMoj3Pm6wNbJo5pBCerDStnR4LY70I9r5qO2vt2+ERvx5F0hZKrhVttvt13oh9gocPdDbzO+1j4rd2SJYMoyfZ6t4dVTt2h2lWQkOatTZNb/nYOylTh92cWhIPq2JoWl+AJUVeuHbSi3yEQfaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EreqYhvy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C01AC32786;
	Tue,  6 Aug 2024 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722987381;
	bh=HvuOrPo3FbqeTebg5upB2dxLOqiJwN9g17WEbgv8D1E=;
	h=From:To:Cc:Subject:Date:From;
	b=EreqYhvyNoRowfK5YDAYT+Q9YFplpoUPvsVWRJ+7OsSysmHp8R21pwP/XCOhHmP7P
	 ffgtGpsGlrefCTpjNlemtOz4X35Nv4x8avRhkJ8hqgX4fqYh4rMqSXX8IuP8D2XABV
	 siGkPllRao1NPfJ9o4O4SzTSrvinokrgE6Ap8x4BYKapmsV/VIlX531qp8u7KAPLc0
	 09tfhQIF+hGdJTtZPmMn0zRWy7bTtwnuaxvO7ewowu71UxqoL9Lp5CFjEFpPdvXOrX
	 4ZDlcLXPG8jqdEvOozk3TJETaAk1ZBbOq6H38WSl0BjxbDxV39GfZ70r0YnQZ92hkN
	 6PyAoKbA5128A==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH] kbuild: rust-analyzer: mark `rust_is_available.sh` invocation as recursive
Date: Wed,  7 Aug 2024 01:35:59 +0200
Message-ID: <20240806233559.246705-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling the `rust_is_available.sh` script, we need to make the
jobserver available to it, as commit ecab4115c44c ("kbuild: mark `rustc`
(and others) invocations as recursive") explains and did for the others.

Otherwise, we get a warning from `rustc`. Thus fix it.

Fixes: 6dc9d9ca9a72 ("kbuild: rust-analyzer: better error handling")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 44c02a6f60a1..9a33b6063a30 100644
--- a/Makefile
+++ b/Makefile
@@ -1963,7 +1963,7 @@ tags TAGS cscope gtags: FORCE
 # Protocol).
 PHONY += rust-analyzer
 rust-analyzer:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
+	+$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
 	$(Q)$(MAKE) $(build)=rust $@
 
 # Script to generate missing namespace dependencies

base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
-- 
2.46.0


