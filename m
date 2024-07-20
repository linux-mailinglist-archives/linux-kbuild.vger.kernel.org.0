Return-Path: <linux-kbuild+bounces-2607-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B85B938211
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 18:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1CF1F21697
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 16:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC62313C3F2;
	Sat, 20 Jul 2024 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pASLfWW6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23FE83CDB;
	Sat, 20 Jul 2024 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721492501; cv=none; b=HR3NjOLRzq1NwpUt83g6LAD+o729x/FrR7uW0uU8T2dLqLaE4biPU59o149gJBDy9bhbrNVfhBeLi40CcbyygqTM43+00wmWqqG5bQzePe88Qx/DI4rod+SHwIMljk98btBd2OaMDuAD32V6UhCqCR9yaRa50l4TTTIZD8FE390=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721492501; c=relaxed/simple;
	bh=PAUwm1I5mdnfi1Vk2EodpjrA/IhnO7lVRUkHoUJsJ3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NehUKiSq9Lge6fszR2VLThKjN/wTe8Cgr5N52X3krNUhbOh8MN+TdUiejNDh/MlEv2hrwfIr6IXO2YJIHvQZSgG7hBPNgbSjOrV7/xTC+DD7BHJEkaYn5k3o5mbHgl3s2nZZKQWsCwYfqawXl5tt7bykP8PVvEvavjdvxZ7ZSuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pASLfWW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5807DC2BD10;
	Sat, 20 Jul 2024 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721492501;
	bh=PAUwm1I5mdnfi1Vk2EodpjrA/IhnO7lVRUkHoUJsJ3s=;
	h=From:To:Cc:Subject:Date:From;
	b=pASLfWW6dvWL59zwxzGVWMTQ11q1JjEmAz5LBchZpzk0Rp1sJrMhduR55WQkMdNoG
	 hpYgNYbCzJNamqXdsNdSU2/bYjfGXsxv4bjFgdSXmRkT6Lt5ILCKpRIGTo6l5aP5Q4
	 ZtgznuCYwgn6wKsuWFT7v/mOPmrjDZzMV0CpigyT2JluG1oC6lYw7SRwMAV+Wzhc8J
	 dlZUHNfgDRQr/o4PwoXMtcU4kNuwXs4WhCP2GiP3WQ/T+9xBw2GSaM3XqlWOIC5rsA
	 2EPGKF8JVFHEA4cljUPyRPsYsTy9SbQD8QWXh+7rjoqnuvOI1Q2X9Ueco1c7yMB1nO
	 vlw/6Inp6FvAQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kallsyms: unify seq and start_pos fields of struct sym_entry
Date: Sun, 21 Jul 2024 01:21:13 +0900
Message-ID: <20240720162136.111898-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct sym_entry uses the 'seq' and 'start_pos' fields to remember
the index in the symbol table. They serve the same purpose and are not
used simultaneously. Unify them.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index e291e34a450b..9a0535c59702 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -36,7 +36,6 @@ struct sym_entry {
 	unsigned long long addr;
 	unsigned int len;
 	unsigned int seq;
-	unsigned int start_pos;
 	unsigned int percpu_absolute;
 	unsigned char sym[];
 };
@@ -278,7 +277,7 @@ static void read_map(const char *in)
 		if (!sym)
 			continue;
 
-		sym->start_pos = table_cnt;
+		sym->seq = table_cnt;
 
 		if (table_cnt >= table_size) {
 			table_size += 10000;
@@ -762,7 +761,7 @@ static int compare_symbols(const void *a, const void *b)
 		return wa - wb;
 
 	/* sort by initial order, so that other symbols are left undisturbed */
-	return sa->start_pos - sb->start_pos;
+	return sa->seq - sb->seq;
 }
 
 static void sort_symbols(void)
-- 
2.43.0


