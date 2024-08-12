Return-Path: <linux-kbuild+bounces-2951-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9004194ED58
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 14:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 309581F22803
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2024 12:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8FE117BB2A;
	Mon, 12 Aug 2024 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGRthPTS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A243917BB21;
	Mon, 12 Aug 2024 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466946; cv=none; b=JdR7UdRHiZbWDMKX9bAMJLQlpCJrx4dWfGBFN3PuOA5du+VheqETDsmUHSClcnYWca7GkNwDQVXZn/+PxZGslPvZmEaZFO0O19wOcKfpz4E/xLjF0k/2riIBTnQ6iKLL5loQATc1Nk8mzoKNawc9d39Fu7LGA4bXIJKZyS7etI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466946; c=relaxed/simple;
	bh=ztG2yE6SHjyu4DtnrnBDimJEjkWcjurLBkb9I9GPUzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TO0BJ/K5GLOoLycvJHmAj7v/XcUQ73h67S6pp/w8LVrlqb3jVczVCJgnGCZnrP6bH9LvWmrOo6eT0dsnPDSplnkAVDB2bI3XP0wONLoBZlIkdnPzXR2spMl/71AGSTH3Ckp01hoAPZfRFOz4zANpJ//Bz6AMtuq1kht/mD1+JC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGRthPTS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E30EC4AF0F;
	Mon, 12 Aug 2024 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723466946;
	bh=ztG2yE6SHjyu4DtnrnBDimJEjkWcjurLBkb9I9GPUzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qGRthPTSs20hAyr/G8jZooEdzh+DZX4WB5g6Z16LsxJrw0OMDFJcdLwEMlI5bOeJ3
	 TdQMdL63+xfHoMnPAUz+6BTEIQetSRiDPVkKG1yd9Z5PHWtBfBU2B6AQvUWTFEBcUS
	 zxHa+1NkND+ek3vQQyF6kMCPcdjzUumGghPWOUmdUfOBc/hbkm3jdatBXCH9XlXtt1
	 EcaXvEO60c0F851D8wxzlImXq9uHP9OcHnkdEdHev8GZ/7KLpyWz7F/iGdBssNaZaQ
	 YFkaSH4gxT8Um0j1/K+K2kWqvLNL74hq7sZR2VKJTx6cE6XrkoFO+OOJuQp/6nFbHw
	 NJlulEP8p2j6g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/4] kallsyms: use xmalloc() and xrealloc()
Date: Mon, 12 Aug 2024 21:48:52 +0900
Message-ID: <20240812124858.2107328-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812124858.2107328-1-masahiroy@kernel.org>
References: <20240812124858.2107328-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When malloc() or realloc() fails, there is not much userspace programs
can do. xmalloc() and xrealloc() are useful to bail out on a memory
allocation failure.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 0ed873491bf5..53c433b2e591 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -28,6 +28,8 @@
 #include <ctype.h>
 #include <limits.h>
 
+#include <xalloc.h>
+
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))
 
 #define KSYM_NAME_LEN		512
@@ -171,12 +173,7 @@ static struct sym_entry *read_symbol(FILE *in, char **buf, size_t *buf_len)
 	 * compressed together */
 	len++;
 
-	sym = malloc(sizeof(*sym) + len + 1);
-	if (!sym) {
-		fprintf(stderr, "kallsyms failure: "
-			"unable to allocate required amount of memory\n");
-		exit(EXIT_FAILURE);
-	}
+	sym = xmalloc(sizeof(*sym) + len + 1);
 	sym->addr = addr;
 	sym->len = len;
 	sym->sym[0] = type;
@@ -281,12 +278,7 @@ static void read_map(const char *in)
 
 		if (table_cnt >= table_size) {
 			table_size += 10000;
-			table = realloc(table, sizeof(*table) * table_size);
-			if (!table) {
-				fprintf(stderr, "out of memory\n");
-				fclose(fp);
-				exit (1);
-			}
+			table = xrealloc(table, sizeof(*table) * table_size);
 		}
 
 		table[table_cnt++] = sym;
@@ -413,12 +405,7 @@ static void write_src(void)
 	/* table of offset markers, that give the offset in the compressed stream
 	 * every 256 symbols */
 	markers_cnt = (table_cnt + 255) / 256;
-	markers = malloc(sizeof(*markers) * markers_cnt);
-	if (!markers) {
-		fprintf(stderr, "kallsyms failure: "
-			"unable to allocate required memory\n");
-		exit(EXIT_FAILURE);
-	}
+	markers = xmalloc(sizeof(*markers) * markers_cnt);
 
 	output_label("kallsyms_names");
 	off = 0;
-- 
2.43.0


