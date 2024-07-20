Return-Path: <linux-kbuild+bounces-2601-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209A9380B4
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 12:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 544591C21296
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 10:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E49342AAF;
	Sat, 20 Jul 2024 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpW63dWV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A0829AB;
	Sat, 20 Jul 2024 10:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721471458; cv=none; b=oIyH2qCpqdFCU2EdiQK0r+p2rWhQ467bs61wP/PYpi0oDSJHYDcv/ZuQVyiW4DDVZGAVzos8zmQJEwQs/lDk4WQ7wjmDtw7tTaiakuIM6cI4i+w2Zrc7eodf8Q43OW4utAmdAjbp5cMvjDH7SOwXW5qY98q0TqFEg2CtSDNhRmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721471458; c=relaxed/simple;
	bh=3WdX0nkfO4LbxitkdWg1wlALf7fMnNq3EvIWIU3bKL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lzjibd/mBSpiJui2OeLKPLueM+EpkV9fw2SO9yuUPQlk50B1yWFOMk7WfqcR8iYJ4+T6C9m7WwGJNwqd+JXYZ2rpLSXidrL6/hHJhj6fUMJoQ95cHKn1zXlDuVEOkqlZu7z7Z4ZAcqBynmyoCHd1Yc6Tzkdsr+sFSSWeViviGo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kpW63dWV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38D7C2BD10;
	Sat, 20 Jul 2024 10:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721471457;
	bh=3WdX0nkfO4LbxitkdWg1wlALf7fMnNq3EvIWIU3bKL4=;
	h=From:To:Cc:Subject:Date:From;
	b=kpW63dWVcT25nippSN6TOjVp+dzBRy+Qab8wIsvQ2/EoLWCH4Jj9hlJ8OCfDXzIX9
	 L/K+yx6JDUkVR9MdaSUzfvkjyP7FChufgq1w7kqvYbCzaOkOPKm8k/eGaG6t6elBYE
	 pn/0+biQZCnjwuwhvTcsD8uNHpQ/dXTsuFOfjkoSENQp9MbVdwgmQPCtMIRbOlCzv8
	 744QiU5wwIU+SIzaQbvB8RIFvRH3lSyv5Kendmj076IAS7YeQV9qjq1cOteDohziNL
	 c129jtxDtHm+jSgYYw8UWFxtPGOw70l/p/DY8U48Z0hQF8L6ZfyMopJ2RS1F3jS3un
	 VbUh1VYkURNkg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] kallsyms: avoid repeated calculation of array size for markers
Date: Sat, 20 Jul 2024 19:30:12 +0900
Message-ID: <20240720103053.2870014-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the markers_cnt variable for readability.

No functional change intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 55a423519f2e..f0ea8c922dc8 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -393,7 +393,7 @@ static void write_src(void)
 {
 	unsigned int i, k, off;
 	unsigned int best_idx[256];
-	unsigned int *markers;
+	unsigned int *markers, markers_cnt;
 	char buf[KSYM_NAME_LEN];
 
 	printf("#include <asm/bitsperlong.h>\n");
@@ -413,7 +413,8 @@ static void write_src(void)
 
 	/* table of offset markers, that give the offset in the compressed stream
 	 * every 256 symbols */
-	markers = malloc(sizeof(unsigned int) * ((table_cnt + 255) / 256));
+	markers_cnt = (table_cnt + 255) / 256;
+	markers = malloc(sizeof(*markers) * markers_cnt);
 	if (!markers) {
 		fprintf(stderr, "kallsyms failure: "
 			"unable to allocate required memory\n");
@@ -469,7 +470,7 @@ static void write_src(void)
 	}
 
 	output_label("kallsyms_markers");
-	for (i = 0; i < ((table_cnt + 255) >> 8); i++)
+	for (i = 0; i < markers_cnt; i++)
 		printf("\t.long\t%u\n", markers[i]);
 	printf("\n");
 
-- 
2.43.0


