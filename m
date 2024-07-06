Return-Path: <linux-kbuild+bounces-2411-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0039294AD
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 18:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7271F22CA7
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2024 16:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0768D6A357;
	Sat,  6 Jul 2024 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5bIbciu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11F228F0;
	Sat,  6 Jul 2024 16:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720281916; cv=none; b=qkaHIfjL0guaUsRkoNU5YcM5nXbocNIiL6+xz9DPhH5brXYDf/a68fud9pzwhXYo8+hAPmm+fokwAV3vNSkRMD6QBdv3gBf52CZbAILKnLzKB0XyjvBo26LjS6RBqEcfyGhXNZD5zFsFFKzGbb8TL4WhZw5ityaml14jJJig7Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720281916; c=relaxed/simple;
	bh=ms6L/Rney3iGNlXYi7ZatrUXfKj5UOXFg5RM41nLBYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=duUtfp4AxhkGYg68zTVk481zLDkHfAVgAvZiYIZHqMMmP7nWSCVfmKF4ebU5X21QEb6T/aezvPAaaYUo0rGm5DwQToXzKO8RZWNvO+WoSrca4yEVsYp9p640hGfq/+UvpSygv/InwHFtyDw9Rtodc/latQc7SkvzmrJS5dMjRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5bIbciu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11105C2BD10;
	Sat,  6 Jul 2024 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720281916;
	bh=ms6L/Rney3iGNlXYi7ZatrUXfKj5UOXFg5RM41nLBYk=;
	h=From:To:Cc:Subject:Date:From;
	b=m5bIbciuWwG+z0MWXS0ygugGtPQDLEuqZsoErT1HCog6+XZPugxSj/7ObtUN2MSLt
	 UC1RvX/Uhgb/2z7MQR1BE9YVl1vqRw83J2Vy9uxOdSQT5SQlI+Bq66mgkQv0t1kkrl
	 yJEcdPt5CeVRUqqMGIrczQXswhfiTRxorpfER+CG7kMKLbYb2AiQGBahBFmhqSPMF7
	 9SaDYcpDLYUZpsgOsjhRX3CwJ1ZTo/D0zrGlIQaPSmC28Tl5r1pz6KcoVBm9l3FiZR
	 el4+nX11fJGyJFgLitJyJ/Bvh0jUENp2UegoXy8rQbPin5AH+B7ghJNzQhgSv1lue2
	 c8+yCfBDNcgHw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] init: remove unused __MEMINIT* macros
Date: Sun,  7 Jul 2024 01:05:05 +0900
Message-ID: <20240706160511.2331061-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These macros are not used anywhere.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/linux/init.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index 58cef4c2e59a..b2e9dfff8691 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -99,10 +99,6 @@
 #define __INITRODATA	.section	".init.rodata","a",%progbits
 #define __FINITDATA	.previous
 
-#define __MEMINIT        .section	".meminit.text", "ax"
-#define __MEMINITDATA    .section	".meminit.data", "aw"
-#define __MEMINITRODATA  .section	".meminit.rodata", "a"
-
 /* silence warnings when references are OK */
 #define __REF            .section       ".ref.text", "ax"
 #define __REFDATA        .section       ".ref.data", "aw"
-- 
2.43.0


