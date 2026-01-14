Return-Path: <linux-kbuild+bounces-10580-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32165D1F453
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 15:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA15C313084F
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 13:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A45C27E1A1;
	Wed, 14 Jan 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fu7NPq6/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D041E25F9;
	Wed, 14 Jan 2026 13:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399050; cv=none; b=uJl8iKqMNAMvHT5SQ1/6Ax1wGDSX+bXmgGOSYFyGXlZdNCXGQ/HNESbEn0UDgG9wSLwFduYMb8/DI4iLL5m59sdmrOeIhnGBlQS9y6nbRrPo114yiWv9ahWgIikeDwSoZPHLzzORXBkUe9JI9deNgfVhR/rZ6JiiJydEtktCyiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399050; c=relaxed/simple;
	bh=sv6so1kAWDstRTHH9n09D8fRDroRVEa1x32rvkw/VJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHIthNO2eRBtqXRwNhbjwJXFd0fpCB8CQ1R6xQVu8maNJu3LujDof+lNhDvO4Ad//LuS+Y5LXt8wpIm1cYPoCo+GdV7amex3SNuypFuuvoJGNrOn/O1Eeo+r0Z6/935LHqth3xVlXdf/KGxrtmNRgy3+C9P++KuaainugWjYpeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fu7NPq6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D82C16AAE;
	Wed, 14 Jan 2026 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399050;
	bh=sv6so1kAWDstRTHH9n09D8fRDroRVEa1x32rvkw/VJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fu7NPq6/5Yz27+CRF235QGwz8QhQzdXAyCsYF3xmHYlXix6wwXg3JMFFQ2zU3azST
	 n7XQuB5LnysRQURFB3HIPnt+2inoAy5uYkIZ6ynobBuDqmJzPJ0V1649SgQqKe2loA
	 sBobkyBECVksGERwvQPaZ3n7su7jOYar84fzHAEquF55veYToZ8A1QId6BeonN97eM
	 esysauvxCYv5d58U9xZNeBSMnIL9UJQKWwL7QH92TZpvvqSd5NF4nFGyA0Ub07OaaH
	 8zSS5LcPBiw+meCaIeCZsZ8AasAr7iumYYNYGK+4crDjmH461g3hELxSNfZDQq9zkX
	 N9xtU4IJKIkKw==
From: Nicolas Schier <nsc@kernel.org>
Date: Wed, 14 Jan 2026 14:57:15 +0100
Subject: [PATCH v2 2/2] fortify: Cleanup temp file also on non-successful
 exit
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-fortify-improve-handling-of-tempfile-v2-2-63b86c4dbd0e@kernel.org>
References: <20260114-fortify-improve-handling-of-tempfile-v2-0-63b86c4dbd0e@kernel.org>
In-Reply-To: <20260114-fortify-improve-handling-of-tempfile-v2-0-63b86c4dbd0e@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, 
 WangYuli <wangyuli@aosc.io>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768399036; l=1024;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=sv6so1kAWDstRTHH9n09D8fRDroRVEa1x32rvkw/VJA=;
 b=1TtsteheMDjFq0FlufKyn5Ge631Q8bpNrEyQg4F61tMMYLvq961Z2cyy+NNtS6R6aMCHlBPh/
 wOYyBwBypzlBoOzwM+gdG+2Go6Ynsx0jiBMnpra3ZIa2/lFrEtx6B+y
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

Ensure cleanup of test_fortify.sh's temporary file also on script
interruption, or some common signals.

Reported-by: WangYuli <wangyuli@aosc.io>
Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: WangYuli <wangyuli@aosc.io>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 lib/test_fortify/test_fortify.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
index 368d07d9acbf737be376756b39def87f12f4e9bf..ad6dd44fa31c0ad3a063cd0caab3a4664f9f3f31 100644
--- a/lib/test_fortify/test_fortify.sh
+++ b/lib/test_fortify/test_fortify.sh
@@ -29,7 +29,7 @@ shift
 __cleanup() {
 	rm -f "$TMP"
 }
-trap __cleanup EXIT
+trap __cleanup EXIT HUP INT QUIT TERM
 
 # Function names in warnings are wrapped in backticks under UTF-8 locales.
 # Run the commands with LANG=C so that grep output will not change.

-- 
2.47.3


