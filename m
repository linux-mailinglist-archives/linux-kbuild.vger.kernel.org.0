Return-Path: <linux-kbuild+bounces-2608-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA2F938213
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 18:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02918B20ED2
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2024 16:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B053146D41;
	Sat, 20 Jul 2024 16:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjRFI2oO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A71146A96;
	Sat, 20 Jul 2024 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721492503; cv=none; b=gRXNoOaugSamCsg+qXKJcVCO1jg9+ziT3Er2owAbeRufpAsoRZG/afaeTV5i2P4srrnWQR+9uXL9Zfl68H6PHNCPFIJs6zkkuQ78XVfI66YdGD3azKnpVnWU4i9wRiGbrf8r8jFbiZd+JUuCYXXNfn3KPGJZR/bkI1B8kvxWYaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721492503; c=relaxed/simple;
	bh=vL3miUANwmXmD+NJf1Syoh2nk+z/Q2eiOhWN7u9K1m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWEt7tWVfNaK1oFQVBrF54Mh3V1x39NDHXTabOKVRvVSKKuoI7AnlOMyexy8qUskxU8ji4NZcrFd8kLZFxvutVFB2sS2ii0ZMDNj9LfWmPHVqAj8KAzUl4uybjtqfoT6Jgkzen6OTWDWFnQRekU0Z9vSR9DrW5UsZRpRRr0jRag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjRFI2oO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B9FC4AF09;
	Sat, 20 Jul 2024 16:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721492502;
	bh=vL3miUANwmXmD+NJf1Syoh2nk+z/Q2eiOhWN7u9K1m4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjRFI2oOTJvpOhsjAzkxsugqhtMdy2Vuh0s+6OLbsjyLkuMmFgbs/x319HZ+B7OwT
	 HUo07x/81SxI2Wv9XHKuiSSS7+QfA/OXUHSYUX9bdtD80ARw8muRJdZ15gMDNlJrSb
	 37EpkM2gvNnZtAXKa57+nmaBqlsa7sfJcEG5tZx/ZVtF3Xuca6nylT4KbQmtS+J6pu
	 a/cyXI0ZNvquL49NMM+FJdzYOwlTdH3WSgRYi3JgBQLt6qGjlIw3qlUEMJt+N2N6ID
	 rLy8jNa1hkVJnL62z+j1VX9jS/meFFF5KaGFrfd14H6dsLRdPRHIctPqz9O86Peql/
	 rkj34p+/2e2/Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/2] kallsyms: change sym_entry::percpu_absolute to bool type
Date: Sun, 21 Jul 2024 01:21:14 +0900
Message-ID: <20240720162136.111898-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720162136.111898-1-masahiroy@kernel.org>
References: <20240720162136.111898-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is boolean.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 9a0535c59702..0ed873491bf5 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -36,7 +36,7 @@ struct sym_entry {
 	unsigned long long addr;
 	unsigned int len;
 	unsigned int seq;
-	unsigned int percpu_absolute;
+	bool percpu_absolute;
 	unsigned char sym[];
 };
 
@@ -181,7 +181,7 @@ static struct sym_entry *read_symbol(FILE *in, char **buf, size_t *buf_len)
 	sym->len = len;
 	sym->sym[0] = type;
 	strcpy(sym_name(sym), name);
-	sym->percpu_absolute = 0;
+	sym->percpu_absolute = false;
 
 	return sym;
 }
@@ -339,7 +339,7 @@ static int expand_symbol(const unsigned char *data, int len, char *result)
 	return total;
 }
 
-static int symbol_absolute(const struct sym_entry *s)
+static bool symbol_absolute(const struct sym_entry *s)
 {
 	return s->percpu_absolute;
 }
@@ -781,7 +781,7 @@ static void make_percpus_absolute(void)
 			 * versions of this tool.
 			 */
 			table[i]->sym[0] = 'A';
-			table[i]->percpu_absolute = 1;
+			table[i]->percpu_absolute = true;
 		}
 }
 
-- 
2.43.0


