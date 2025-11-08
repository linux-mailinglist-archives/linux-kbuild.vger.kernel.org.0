Return-Path: <linux-kbuild+bounces-9448-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C09C42428
	for <lists+linux-kbuild@lfdr.de>; Sat, 08 Nov 2025 02:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 459F13A8A6F
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Nov 2025 01:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3BB29D27E;
	Sat,  8 Nov 2025 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkyjnUVc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9069D1F4606;
	Sat,  8 Nov 2025 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762566282; cv=none; b=XkMwyUAp8WmquKXcX0SCcfrm8MNZHDUp7kyhhjmjXFlgUNkpFDJIT4AAvzGErtBo0mtvYjKcQ2rh4HhDjOnW8PBq1ndBYLJa+DB7GepWGYrocjkd0EGOmmUgFWtpI4fa4pYwfSueJKK2JeGRl0hBtZaE7T5WvshxIJJ91hawm+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762566282; c=relaxed/simple;
	bh=N6ZB0vPQ1iUXN/13423AnZI0AB5ZUFBO5Cwhw8Dsz4k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TZbGMWh1yA/9t83Uwofttb8g3bHQhYPs+NXHYwjrtLz4xYnvlLq2jLPEQH8Myxt8DxLh7t6l99ZUHR/Nc2d9HWbtTh7omEkhatWClgGKK4qY9bDygAeUQ9i+HMig/wrag8jNcUb7iV4FKrN7nj12mLi0VpM21BagSh7I0gfSlyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkyjnUVc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1710AC4CEF8;
	Sat,  8 Nov 2025 01:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762566282;
	bh=N6ZB0vPQ1iUXN/13423AnZI0AB5ZUFBO5Cwhw8Dsz4k=;
	h=From:To:Cc:Subject:Date:From;
	b=tkyjnUVcKQlCGb8EEDRFCHn6BPMZHz7JAPIBksj0RVj5080zzB1I/cSDzfGE/M5yz
	 4F+W2pRv4brpN/wzB11aPJ2Kwnazy3uw9y77h4qb3p8BTQpe12Az9nwADqQ4fbxX/p
	 iiSC2/gUqHwqazLj6dJ388qYmaj6qecWtIivQIcUye21CkJJEGnpYJaboo6MmR4htR
	 Lc7G/YbABbY6nGJO/DfJ8AVY5Ak5thD+bmlLRheHKMh/7+Xql/RlncKveOwKypecuK
	 XWkreliPgGGZyMN9t2tHWelxHPO+IjrNjPo1rI8JdChoMvrXMdmjxO64OmJyE81pmM
	 simSCfI12XlXA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	Haiyue Wang <haiyuewa@163.com>
Subject: [PATCH] rust: kbuild: skip gendwarfksyms in `bindings.o` for Rust >= 1.91.0
Date: Sat,  8 Nov 2025 02:42:46 +0100
Message-ID: <20251108014246.689509-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with Rust 1.91.0 (released 2025-10-30), in upstream commit
ab91a63d403b ("Ignore intrinsic calls in cross-crate-inlining cost model")
[1][2], `bindings.o` stops containing DWARF debug information because the
`Default` implementations contained `write_bytes()` calls which are now
ignored in that cost model (note that `CLIPPY=1` does not reproduce it).

This means `gendwarfksyms` complains:

      RUSTC L rust/bindings.o
    error: gendwarfksyms: process_module: dwarf_get_units failed: no debugging information?

For the moment, conditionally skip `gendwarfksyms` for Rust >= 1.91.0.

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Reported-by: Haiyue Wang <haiyuewa@163.com>
Closes: https://lore.kernel.org/rust-for-linux/b8c1c73d-bf8b-4bf2-beb1-84ffdcd60547@163.com/
Link: https://github.com/rust-lang/rust/commit/ab91a63d403b0105cacd72809cd292a72984ed99 [1]
Link: https://github.com/rust-lang/rust/pull/145910 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/Makefile b/rust/Makefile
index 3e545c1a0ff4..269bf7cf5b97 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -543,6 +543,7 @@ $(obj)/ffi.o: private skip_gendwarfksyms = 1
 $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
+$(obj)/bindings.o: private skip_gendwarfksyms := $(if $(call rustc-min-version,109100),1)
 $(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init
 $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/ffi.o \

base-commit: dc77806cf3b4788d328fddf245e86c5b529f31a2
-- 
2.51.2


