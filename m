Return-Path: <linux-kbuild+bounces-162-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F2F7F89F1
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 11:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45F021C20C4F
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 10:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0B7D260;
	Sat, 25 Nov 2023 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDxIF4NT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E36063BD
	for <linux-kbuild@vger.kernel.org>; Sat, 25 Nov 2023 10:31:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E947FC433C8;
	Sat, 25 Nov 2023 10:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700908294;
	bh=zXAi/9CNLqqmyNpA1eHsdMgrholOb1Cem6oT1U9JQNo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PDxIF4NTuqIxsAI3HnxjK3nRVHtYRRrbTyEAn91gJaUSI+4jcXTx7+ZmEb0DiRpuw
	 ZpEB3K3hDfONj7vO+ClsEoi4G6OaSM5mBhq8t3yFd5gJBfju+qPh5dxc6/7QmP8AET
	 QjHILXceyTEE+584cTyh6nQKAlk+1jLk7sXrqP8/oZBVl3QT0UVXbEpwlO1XfxwZVs
	 aeM0IfKjS4y6KQ9Hacx76TpyKvhbQ0fbbjccFIR9qun5Y23cj/Cep7TC+CNO1iMhma
	 bHKSgMjUFLo5bEgF7sfoYFvBATQgsbUGvLZ8IVDR2kji2kUgCw4iJ42E8l/BkXm6nm
	 IYN+/qEqZ3sDA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] modpost: move exit(1) for fatal() to modpost.h
Date: Sat, 25 Nov 2023 19:31:16 +0900
Message-Id: <20231125103116.797608-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125103116.797608-1-masahiroy@kernel.org>
References: <20231125103116.797608-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fatal() never returns, but compilers are not aware of this fact because
exit(1) is called within the modpost_log() definition.

Move exit(1) to the fatal() macro so that compilers can identify
unreachable code flows.

Remove the initializer for 'taddr' in section_rel(), as compilers now
recognize this is not an uninitialized bug.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 4 +---
 scripts/mod/modpost.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 013fc5031bc7..696c583a14ec 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -84,8 +84,6 @@ void modpost_log(enum loglevel loglevel, const char *fmt, ...)
 	vfprintf(stderr, fmt, arglist);
 	va_end(arglist);
 
-	if (loglevel == LOG_FATAL)
-		exit(1);
 	if (loglevel == LOG_ERROR)
 		error_occurred = true;
 }
@@ -1415,7 +1413,7 @@ static void section_rel(struct module *mod, struct elf_info *elf,
 
 	for (rel = start; rel < stop; rel++) {
 		Elf_Sym *tsym;
-		Elf_Addr taddr = 0, r_offset;
+		Elf_Addr taddr, r_offset;
 		unsigned int r_type, r_sym;
 		void *loc;
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 9fe974dc1a52..aaa67b24775e 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -215,4 +215,4 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...);
  */
 #define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
 #define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
-#define fatal(fmt, args...)	modpost_log(LOG_FATAL, fmt, ##args)
+#define fatal(fmt, args...)	do { modpost_log(LOG_FATAL, fmt, ##args); exit(1); } while (1)
-- 
2.40.1


