Return-Path: <linux-kbuild+bounces-9911-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE451C93050
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 20:28:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 801AB3AD500
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 19:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AB5334698;
	Fri, 28 Nov 2025 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjvYmICV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2083332C924;
	Fri, 28 Nov 2025 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358086; cv=none; b=X1YhDg1qlvqCjcYaYBYLRoQ6Si4H+vH2dMRfVTkENOTNLgCO56as92TbB5dsEHY/BZI4NuHAgeFLEaqzFH5usUpAtI1aiRu5HrqfZTElCEkPWCZp220bzQjP8Y0iC2uUXmZKkqTjrcOJHBJiARFCGRXcQtD4ianoPncuVw1NClk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358086; c=relaxed/simple;
	bh=FjAtGK+0Lm9b/IbOJUCGSCWl/PrA21RK4TRffQOp9Co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bMlpS5xBnd1Is8x7lK8EVNqn2eNA3KHeJ2AniDStuK6UBAzyDG7hF3g71kP2F2nbxEh5uwc5JjBCdkUsd4I5400n8aWuJVkgeOou4uOGvvb6Vj7/TD2nf/Uap+v8kVUMl0WICaGq+abMVc139T4jyoS9E5kXaDPkld+yf7MBjIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjvYmICV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326A6C4CEF1;
	Fri, 28 Nov 2025 19:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764358084;
	bh=FjAtGK+0Lm9b/IbOJUCGSCWl/PrA21RK4TRffQOp9Co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RjvYmICV9iG0Sn7tuMwADzuKSj53aAdYl6h1B/zoYWZzeNQyYTvSZitd0RlQ2niTR
	 0yv+4Jk0i0D+bKEf3MmmJvOpdG0J/6ZW/uNN5wZVMp5tTqppBvalQwifwRvi5AOOjc
	 NHn+oyyEHviq46IXgDVPjQq5Zig4vPhj1nL64BAyTAEpyzQqLDRq85ayA0TkVrxRmZ
	 /LzjhdHhlBUcR22lVXy5Nj4kAR9FwhEeSA8hh9UygHAMVDeL+GbDU3ZCfeSbg8O4wd
	 Pf3KXrhucjxMr6BjrtjUjKjfaANXj44HXm5RER7dG6MtpEjE3rLOA3M40DGUZ+c7Tk
	 T4xAQOlbXuuWw==
From: Nicolas Schier <nsc@kernel.org>
Date: Fri, 28 Nov 2025 20:27:58 +0100
Subject: [PATCH 2/2] fortify: Cleanup temp file also on non-successful exit
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-fortify-improve-handling-of-tempfile-v1-2-a79d0d3abcac@kernel.org>
References: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
In-Reply-To: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: WangYuli <wangyuli@aosc.io>, WangYuli <wangyl5933@chinaunicom.cn>, 
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Nicolas Schier <nicolas.schier@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764358080; l=875;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=Q/trCOsm/FZAEgVV8TAe4RUPlG6Km8Hh2CDuNFVNAqc=;
 b=NKhu5kQpuFjJ2BWhOrnKeJUaIuYDjnLkZ/eAI6TQoTSoe/8qQ0eqJnsPUBprkzH7ygVQQJXBU
 DnKKtcusOe5AdZXZ80KNak2QsyMveKD64XiAPt70zaQAThkk9p+N9pw
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

From: Nicolas Schier <nicolas.schier@linux.dev>

Ensure cleanup of test_fortify.sh's temporary file also on script
interruption, or some common signals.

Reported-by: WangYuli <wangyuli@aosc.io>
Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
 lib/test_fortify/test_fortify.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
index 368d07d9acbf..ad6dd44fa31c 100644
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
2.51.0


