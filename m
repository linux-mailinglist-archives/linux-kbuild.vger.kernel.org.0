Return-Path: <linux-kbuild+bounces-2603-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 169339380B8
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 12:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFE491F21DD2
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 10:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A04486645;
	Sat, 20 Jul 2024 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCPrbLtb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3257785923;
	Sat, 20 Jul 2024 10:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721471462; cv=none; b=AND65rSg+Z8BLbukAhB6/LTu6sHj+CuLIRYb22qmOm3/6+1pfS0s37JlVfb/euBru91UNeYrAjMqR5qLeMPbC9mfaqePTBXmo5LtsiozGdMtEDyn4iqC2coj8+6vc/WeMldQd/myWHrdnUQ4sYg9xmbJhKs76k+cNaDxd67mLz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721471462; c=relaxed/simple;
	bh=CdM0mfeBZ7YQywmo6lZ+gVSYc4tCedR3ptcgXbsWHp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMtp9Xepj9Cw2v6cgR44Pv6+Ut+knP6UGrxm2ExtKh/QBL2pDgFDI2JxAMKU6YkzdO4Q5w2Cp+cpUBYfmWpoWrbiY7w2bwOkslWDlXbKrmEpYbDNayGB6tQ9elyA3w85ory0+ANJ220f6QiLeMaF7edGM7VjYEBfyw87l+5v5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCPrbLtb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6B7C4AF11;
	Sat, 20 Jul 2024 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721471461;
	bh=CdM0mfeBZ7YQywmo6lZ+gVSYc4tCedR3ptcgXbsWHp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WCPrbLtbL4Q6rPYB5/BEnaTJ1XydMHx2TN8Y6Pbn1NyPTV7EApvPrIozFwxVTugKa
	 yOoyDgWJ0kgnO5xRmL/hfpxktXwAPU2CyOYHr74bujCWaYOEiqT3HXtzwYw0D7JbXg
	 TpeY7D5XoD01tRZF0AaT4CTJ8o3MqlJhlM2lA4FxSWUMIFiVMFiF+sIRJbRTEv5Hx+
	 gbawquz4aZ8qsRX+nqfIUaa59duCN/C7yXyQu5xdiFxfJIi4o5azVD3AwqX2uQnniQ
	 PiM5HJCA8lL0C/5yZ0tXDHNb7/YtohwcJqrDeIYXRUVrAk0MHFjFoeFmzOcADpPTa0
	 bKiQ41vTyD5sg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kallsyms: add more original symbol type/name in comment lines
Date: Sat, 20 Jul 2024 19:30:14 +0900
Message-ID: <20240720103053.2870014-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720103053.2870014-1-masahiroy@kernel.org>
References: <20240720103053.2870014-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bea5b7450474 ("kallsyms: expand symbol name into comment for
debugging") added the uncompressed type/name in the comment lines of
kallsyms_offsets.

It would be useful to do the same for kallsyms_names and
kallsyms_seqs_of_names.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 164c04d22061..e291e34a450b 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -456,18 +456,16 @@ static void write_src(void)
 		}
 		for (k = 0; k < table[i]->len; k++)
 			printf(", 0x%02x", table[i]->sym[k]);
-		printf("\n");
-	}
-	printf("\n");
 
-	/*
-	 * Now that we wrote out the compressed symbol names, restore the
-	 * original names, which are needed in some of the later steps.
-	 */
-	for (i = 0; i < table_cnt; i++) {
+		/*
+		 * Now that we wrote out the compressed symbol name, restore the
+		 * original name and print it in the comment.
+		 */
 		expand_symbol(table[i]->sym, table[i]->len, buf);
 		strcpy((char *)table[i]->sym, buf);
+		printf("\t/* %s */\n", table[i]->sym);
 	}
+	printf("\n");
 
 	output_label("kallsyms_markers");
 	for (i = 0; i < markers_cnt; i++)
@@ -536,10 +534,11 @@ static void write_src(void)
 	sort_symbols_by_name();
 	output_label("kallsyms_seqs_of_names");
 	for (i = 0; i < table_cnt; i++)
-		printf("\t.byte 0x%02x, 0x%02x, 0x%02x\n",
+		printf("\t.byte 0x%02x, 0x%02x, 0x%02x\t/* %s */\n",
 			(unsigned char)(table[i]->seq >> 16),
 			(unsigned char)(table[i]->seq >> 8),
-			(unsigned char)(table[i]->seq >> 0));
+			(unsigned char)(table[i]->seq >> 0),
+		       table[i]->sym);
 	printf("\n");
 }
 
-- 
2.43.0


