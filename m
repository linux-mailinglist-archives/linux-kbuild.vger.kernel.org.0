Return-Path: <linux-kbuild+bounces-2531-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DEC931719
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 16:45:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98F4A1F22037
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2024 14:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6086B18F2C1;
	Mon, 15 Jul 2024 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YiGPMb2l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339F218EFF4;
	Mon, 15 Jul 2024 14:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721054739; cv=none; b=YkGNPcDM5rWzTeli23+q1Derva6DwevmFBoDjhGpLOEPD4DQaxPtDWkwOBeuzA+e6SrMavOmfw2ycpTHUvT+PZVXQadVnAlMcojek+Elo67S9ywQBOfuUtarjmA2aIO01DhPFgcHMWZdiS80Iw+xXA+AN9l5gAUnDXepmgWg7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721054739; c=relaxed/simple;
	bh=uENVxCzbhu/T3G6xZkCmbtIfX6OdbYhATRVi52swhfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUMkI2AzZZfd03Maeb+B89HXVEcQSJrYMa5gm9rSXX/GE7W9ydcw4R2B+wfZYKGQvHGBHBqShD/N8R+XqrC6CEiu+Lm67gSpLUywlf2PRYAEnhaw3N0Xp79fRWn7Ha/m9S0HeJaaCA0sfN9WLVkHwrWouPr3uD9QtO5kU4XLXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YiGPMb2l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CC9C4AF0E;
	Mon, 15 Jul 2024 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721054739;
	bh=uENVxCzbhu/T3G6xZkCmbtIfX6OdbYhATRVi52swhfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YiGPMb2lk+ivb/0sq8TQnKJcEO3BqgZmuwYirEmG/HRziAZ8xIGRql9jt1yjdOw3V
	 qG7ELJ7Ac4i0zAlCeFWf36wKBybvdXxETcvqemC7WEX7443M8s+UWQCvJJ9f9RI4lo
	 cYNizWmWFZPed8AHylfVHZY+DtbZKkwJBcrutM7WqK0YFAdlPNN/UaQH3ZT9a+Z28x
	 Z2WvliExKd9oBXNTRlu1X46z+eoKjrCEg71cjmyTIxJ3JdN4LpS8zUKbzKZiKraJlW
	 uWFadBIgnrg1Y2Cpc+6Qezh914JX/jDyMiSZfccvnPmbFpt4WoOMbLxLJA+Ifakpwz
	 p/DxyS5cMvS5A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] fortify: use if_changed_dep to record header dependency in *.cmd files
Date: Mon, 15 Jul 2024 23:45:23 +0900
Message-ID: <20240715144529.101634-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715144529.101634-1-masahiroy@kernel.org>
References: <20240715144529.101634-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After building with CONFIG_FORTIFY_SOURCE=y, many .*.d files are left
in lib/test_fortify/ because the compiler outputs header dependencies
into *.d without fixdep being invoked.

When compiling C files, if_changed_dep should be used so that the
auto-generated header dependencies are recorded in .*.cmd files.

Currently, if_changed is incorrectly used, and only two headers are
hard-coded in lib/Makefile.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 lib/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/Makefile b/lib/Makefile
index 30337431d10e..429b259b5b64 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -408,11 +408,9 @@ targets += $(TEST_FORTIFY_LOGS)
 clean-files += $(TEST_FORTIFY_LOGS)
 clean-files += $(addsuffix .o, $(TEST_FORTIFY_LOGS))
 $(obj)/test_fortify/%.log: $(src)/test_fortify/%.c \
-			   $(src)/test_fortify/test_fortify.h \
-			   $(srctree)/include/linux/fortify-string.h \
 			   $(srctree)/scripts/test_fortify.sh \
 			   FORCE
-	$(call if_changed,test_fortify)
+	$(call if_changed_dep,test_fortify)
 
 quiet_cmd_gen_fortify_log = GEN     $@
       cmd_gen_fortify_log = cat </dev/null $(filter-out FORCE,$^) 2>/dev/null > $@ || true
-- 
2.43.0


