Return-Path: <linux-kbuild+bounces-239-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A342F802250
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:50:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 536061F21037
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 09:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB658F48;
	Sun,  3 Dec 2023 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krGY099a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C3828F5
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Dec 2023 09:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41B7C433CC;
	Sun,  3 Dec 2023 09:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701596996;
	bh=rmsWponTX5RKX19qzp5R0zCYaOiow+z0DQeDMbnv4hs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=krGY099aw4XVTLnHqechM+QYTTiVpi77Y5Sg9sl2m20KUWYFikFGob/yeUNdPDMvv
	 mgL2T/dyKctjBYe85UnYisBy0M2w6RF8eyks00H1v2cEq/PNLT2vbw4Mj2fKyWo8N/
	 JwwI/sZKc1f1xcAziikHBfx/kdu/y1JwYg4bi5F4gj+/3oRg8/alQrKu+nAZeHVaF2
	 PWnaplfhFxxhvlxy9pk0fAS+zw1DaDb0noGL+ok4nxxUhYPT+K9cpVzhxLcW9SX+h5
	 KsDXXZiroAkKy0hAhm3AZiQiFiUDB1nqv+UAPqgtImF0L2OdDi9TqeSSTXZMlM2nTW
	 JNVr0n4xoXzPg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] modpost: inform compilers that fatal() never returns
Date: Sun,  3 Dec 2023 18:49:32 +0900
Message-Id: <20231203094934.1908270-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203094934.1908270-1-masahiroy@kernel.org>
References: <20231203094934.1908270-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function fatal() never returns because modpost_log() calls exit(1)
when LOG_FATAL is passed.

Inform compilers of this fact so that unreachable code flow can be
identified at compile time.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v2:
  - Use noreturn attribute together with alias

 scripts/mod/modpost.c | 3 +++
 scripts/mod/modpost.h | 5 ++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index ca0a90158f85..c13bc9095df3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -90,6 +90,9 @@ void modpost_log(enum loglevel loglevel, const char *fmt, ...)
 		error_occurred = true;
 }
 
+void __attribute__((alias("modpost_log")))
+modpost_log_noret(enum loglevel loglevel, const char *fmt, ...);
+
 static inline bool strends(const char *str, const char *postfix)
 {
 	if (strlen(str) < strlen(postfix))
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 9fe974dc1a52..835cababf1b0 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -200,6 +200,9 @@ enum loglevel {
 void __attribute__((format(printf, 2, 3)))
 modpost_log(enum loglevel loglevel, const char *fmt, ...);
 
+void __attribute__((format(printf, 2, 3), noreturn))
+modpost_log_noret(enum loglevel loglevel, const char *fmt, ...);
+
 /*
  * warn - show the given message, then let modpost continue running, still
  *        allowing modpost to exit successfully. This should be used when
@@ -215,4 +218,4 @@ modpost_log(enum loglevel loglevel, const char *fmt, ...);
  */
 #define warn(fmt, args...)	modpost_log(LOG_WARN, fmt, ##args)
 #define error(fmt, args...)	modpost_log(LOG_ERROR, fmt, ##args)
-#define fatal(fmt, args...)	modpost_log(LOG_FATAL, fmt, ##args)
+#define fatal(fmt, args...)	modpost_log_noret(LOG_FATAL, fmt, ##args)
-- 
2.40.1


