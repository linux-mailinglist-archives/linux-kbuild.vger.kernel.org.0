Return-Path: <linux-kbuild+bounces-7263-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8B7AC3C63
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 11:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EE307AAFC1
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 May 2025 09:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7191EF09D;
	Mon, 26 May 2025 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HG8kHD6M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437141EA7CE;
	Mon, 26 May 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250500; cv=none; b=IyVf3cupKNxndsLArinINaq2rr2jkKIL17ZwZ6RlIDR2F0GYGqNwUPRDmw2DivxWF8pTLX6AKZmRMaEDNZgRYs/uWiq79Z0SQ+Hh+YXxXsOKm/UIVjuzFY+T7w2dxKJss5+SESiq1jnHwLUpSuErayZ8LVJmdPvZuCxkqGg5hMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250500; c=relaxed/simple;
	bh=nJBb/1/0YdGIGTTqBoalgYHLW1hWuWEj4N87pCrndLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1uuyrNSTsa4TjzUu2VIa6kka5L9+vPUSDQNVMiybvOD/IoXnffJVByvjUrtWusgfMiMgh5YSRYLPmbqN2knygiq+rtczo30aFZwhdEDopHBORiz1BYw3UOU9EAog/JhM50tLWsXoIVUH3FN5W3cyiCgvGLJ+f5DUeP54NXZEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HG8kHD6M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B1BC4CEEE;
	Mon, 26 May 2025 09:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748250499;
	bh=nJBb/1/0YdGIGTTqBoalgYHLW1hWuWEj4N87pCrndLg=;
	h=From:To:Cc:Subject:Date:From;
	b=HG8kHD6Mi13KDEkpfxXvGcgdk7GqulDYqITm+MHSEGnLerWuJ00vnnSVJ6yPYqCE3
	 65AZwRfmSDRj1T6lLX57tKBxUDYKGv5heSuF+57kg8An/p1fS+K1UE+mJrzOH8kC+n
	 HyBWq/GiCBEbxKQC1w8+R86nDNYaO+Y+BsC56SLLsTqxE0qp6iof4TNpl6FvATc0VF
	 U3SVoxJ9ChLHNfl8XOLQYMLqERJ4uXxkNxJzyYFPmbUi0y4NVYObcRnhVmhXYrkPQh
	 5I/fDfod2ZsHFglRIl0ivKsd3sMaMogDSYMnwNlxmGpx2kJGaTEEtqA//YqWsYa8FU
	 vhqgzziofg77g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] tinyconfig: enable CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
Date: Mon, 26 May 2025 18:07:51 +0900
Message-ID: <20250526090815.416922-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This CONFIG option, if supported by the architecture, helps reduce the
size of vmlinux.

For example, the size of vmlinux with ARCH=arm tinyconfig decreases as
follows:

   text	   data	    bss	    dec	    hex	filename
 631684	 104500	  18176	 754360	  b82b8	vmlinux.before
 455316	  93404	  15472	 564192	  89be0	vmlinux.after

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/configs/tiny.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
index b753695c5a8f..5dd0f0a34a73 100644
--- a/kernel/configs/tiny.config
+++ b/kernel/configs/tiny.config
@@ -2,3 +2,4 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_KERNEL_XZ=y
 CONFIG_SLUB=y
 CONFIG_SLUB_TINY=y
+CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y
-- 
2.43.0


