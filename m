Return-Path: <linux-kbuild+bounces-7994-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE83B02BC9
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 18:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9042E1C22ED9
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jul 2025 16:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC9428980A;
	Sat, 12 Jul 2025 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itF2LfcG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78381EFF96;
	Sat, 12 Jul 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752336086; cv=none; b=leceypFWIrSfKKwuRuPXlxK8m5SOBG0fu3wdiTG235nu6+2ZxWsZS/lVoFQZ0o61BDHqwVfLlsJstj22LbHT2T0+RaNX7y/Xl3jK8Hav+imM4oge4FPYPxOMdSfbkYhtM7equDIYGAXsIRlL/meLKalyvnzSqMw4WRoWlD5GJvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752336086; c=relaxed/simple;
	bh=5MG0jqUEHHH7R1NYtYRbqexXKZsa01vkH9O2WRtO+xI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AsWCpakgZ0D3D4xmmGWigMtVppD4y6wS6sI5zTZo8ydlls46M/2/ugPDQ2Qv92wrE3zNo8byvwidWZkR+qPW/JlPL8WuE9Xj66V3IYCWlWNHs8cjIjW5nLh0mcPzMbuHdNSFtc0yvzqgiAiVXtW6ucU52iqx/STZCoC1hj7Wcwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itF2LfcG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE93C4CEF0;
	Sat, 12 Jul 2025 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752336085;
	bh=5MG0jqUEHHH7R1NYtYRbqexXKZsa01vkH9O2WRtO+xI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=itF2LfcGg31HRC88aU/zIvE7XUv+nDu4nN3SEycyt+CEeTz2WShaCIVahMgt475nb
	 Xc7RDZRtEbyTBKy3X3LY4PipPZ5r4oZxGezjfla+gTS35Wf3a/wSzS3S1yu2bVz07E
	 IB6kDrJsPjfjpijxDkdfFBrU4r6Dld95P+UuLpdD+vnHNkE7p36Z7SFXdSEqd2hiq+
	 ZPOCYWMU5HbBtmcBqDgbg3SzCIZFC2ChF8phmouSAcWBgpGP92sdnhM2mHmhRIZYcW
	 c07W6I5kjhyJKo4f+SFCXCyBT5rAUTIhDTe7azKMacQAeikkjVUUUVYBVnuAuLhBno
	 DI5IuEGH47xtQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH 1/2] objtool/rust: add one more `noreturn` Rust function for Rust 1.89.0
Date: Sat, 12 Jul 2025 18:01:02 +0200
Message-ID: <20250712160103.1244945-2-ojeda@kernel.org>
In-Reply-To: <20250712160103.1244945-1-ojeda@kernel.org>
References: <20250712160103.1244945-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Starting with Rust 1.89.0 (expected 2025-08-07), under
`CONFIG_RUST_DEBUG_ASSERTIONS=y`, `objtool` may report:

    rust/kernel.o: warning: objtool: _R..._6kernel4pageNtB5_4Page8read_raw()
    falls through to next function _R..._6kernel4pageNtB5_4Page9write_raw()

(and many others) due to calls to the `noreturn` symbol:

    core::panicking::panic_nounwind_fmt

Thus add the mangled one to the list so that `objtool` knows it is
actually `noreturn`.

See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
for more details.

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f23bdda737aa..3257eefc41ed 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -224,6 +224,7 @@ static bool is_rust_noreturn(const struct symbol *func)
 	       str_ends_with(func->name, "_4core9panicking14panic_explicit")				||
 	       str_ends_with(func->name, "_4core9panicking14panic_nounwind")				||
 	       str_ends_with(func->name, "_4core9panicking18panic_bounds_check")			||
+	       str_ends_with(func->name, "_4core9panicking18panic_nounwind_fmt")			||
 	       str_ends_with(func->name, "_4core9panicking19assert_failed_inner")			||
 	       str_ends_with(func->name, "_4core9panicking30panic_null_pointer_dereference")		||
 	       str_ends_with(func->name, "_4core9panicking36panic_misaligned_pointer_dereference")	||
-- 
2.50.1


