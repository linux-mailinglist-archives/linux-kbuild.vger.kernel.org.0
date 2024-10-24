Return-Path: <linux-kbuild+bounces-4313-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E09AED34
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 19:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43401F20FF2
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 17:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21ABE1F9EDE;
	Thu, 24 Oct 2024 17:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHu2/k0V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A471F9EC8;
	Thu, 24 Oct 2024 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729789789; cv=none; b=RcAosLdo5Q4jcc3kjJIdeSiDDgLoClJPqUAQG6xnyxWFQ5Uv40aEN4R/0lXC5JAO+eKULKCq0oLWyym3nVRvbatH2puJy0p2PxS1PecQZoZJSkOyqO+IUEDKXlEsd+y695Tf4pr+/G13mFjlhx3UQxLqH0z9I3WDEXG7+b9XKtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729789789; c=relaxed/simple;
	bh=CyuZyMSHUH950XnFjZcDtRSS16p129Q/WANbny7txC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUnimS4eQWUWzcFNQWdso9e9yWywmZipor++7eCA/nh1KIu7qxGpgbaptT79w/x83WzUrGpBKLgy0a0xPbA53N8V7MRg0crE2ltUBhpk6y934lhpyxxEm4Pe4jPo/BJbBuiJ43uOhEpYU5/fncHzHK16hdY2DNtDC6d+QGC5K0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHu2/k0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B580CC4CEC7;
	Thu, 24 Oct 2024 17:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729789788;
	bh=CyuZyMSHUH950XnFjZcDtRSS16p129Q/WANbny7txC8=;
	h=From:To:Cc:Subject:Date:From;
	b=WHu2/k0VbBXjIUAEXv5TZexZsoN2dEl21z9T8Wxro4RE2L01jjIdw+PWh/Q1sc/RR
	 7ZtdvqkiUHN8StnCaAffXi1aaybMNzzDbxqOEiT99ape5ABC1lieWiOUgzCB2BkQfx
	 a+74UlHJAEaPJDOIVcUBmMXqSUB+X5UIZ4iSJGpP4be4EEcX0tuMIRZ5a9GGh3/ihw
	 bus+JJp7656weG0d71j+Q+gOwsUqhnVRj2PynHpKxGBVdkecBUf0XmWoegvOKHr+6X
	 L5xBBKPMK1El7Z5Ml9yRyAFgoaoFfH4yV5nJ6BvdKcB2Y/MGpWkb+kZiuoBHJKfLzE
	 rD0QEopub78sg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <n.schier@avm.de>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: simplify rustfmt target
Date: Fri, 25 Oct 2024 02:09:22 +0900
Message-ID: <20241024170936.1922548-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to prune the rust/alloc directory because it was
removed by commit 9d0441bab775 ("rust: alloc: remove our fork of the
`alloc` crate").

Pruning the rust/test directory is unneeded because no '*.rs' files are
generated within it.

To avoid forking the 'grep' process, filter out generated files using
the option, ! -name '*generated*'.

Now that the '-path ... -prune' option is no longer used, there is no
need to use the absolute path. Searching in $(srctree) is sufficient.

The comment mentions the use case where $(srctree) is '..', that is,
$(objtree) is a sub-directory of $(srctree). In this scenario, all
'*.rs' files under $(objtree) are generated files and filters out by
the '*generated*' pattern.

Add $(RCS_FIND_IGNORE) as a shortcut. Although I do not believe '*.rs'
files would exist under the .git directory, there is no need to traverse
it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
---

Changes in v2:
  - Merge the previous two patches
  - Remove -prune completely
  - Filter out 'generated' files by the find option
  - Remove the unnecessary comment
  - Add $(RCS_FIND_IGNORE)

 Makefile | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index eaa8511dc4bf..9f251f528504 100644
--- a/Makefile
+++ b/Makefile
@@ -1754,18 +1754,9 @@ rusttest: prepare
 # Formatting targets
 PHONY += rustfmt rustfmtcheck
 
-# We skip `rust/alloc` since we want to minimize the diff w.r.t. upstream.
-#
-# We match using absolute paths since `find` does not resolve them
-# when matching, which is a problem when e.g. `srctree` is `..`.
-# We `grep` afterwards in order to remove the directory entry itself.
 rustfmt:
-	$(Q)find $(abs_srctree) -type f -name '*.rs' \
-		-o -path $(abs_srctree)/rust/alloc -prune \
-		-o -path $(abs_objtree)/rust/test -prune \
-		| grep -Fv $(abs_srctree)/rust/alloc \
-		| grep -Fv $(abs_objtree)/rust/test \
-		| grep -Fv generated \
+	$(Q)find $(srctree) $(RCS_FIND_IGNORE) \
+		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
 
 rustfmtcheck: rustfmt_flags = --check
-- 
2.43.0


