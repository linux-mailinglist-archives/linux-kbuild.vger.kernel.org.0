Return-Path: <linux-kbuild+bounces-238-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB64280224F
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04AFB1C204AB
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 09:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0267465;
	Sun,  3 Dec 2023 09:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdCQBWpJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126A028F5
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Dec 2023 09:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F62C433C9;
	Sun,  3 Dec 2023 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701596995;
	bh=DQgligyVko6JOkpsukWsLHEde1ox5xe3QB7/zY+o3mc=;
	h=From:To:Cc:Subject:Date:From;
	b=MdCQBWpJATcuy0G8YGsVOOdYN6tVbI+HTba5TIrjOmIdUpI/IfuDMiUCCkk7sxNOq
	 f3f/l9bHGyWii4wNCS7cbYACpBT403QtK+zJ5DgB2ui3BjGnMUuALVc3pH6EgBV+ZI
	 bQoRQ43aqM5VVIqg4x2SgfId0j9Na0Kpei38vJLAFyQZjbZpa6FY388+nCMt+T9mz2
	 WCCxyX4ceHbHSwI6nMxJRsjNCwtJZZe417YofNj8Ew+3LU0mvm/YcM1BqlurDizojU
	 D/xH2D1K9j8HnYPQ3I/ptSgdJbp5bvb3/ejDqp5Cz9+Qw3776utGljLpRllPyvimkF
	 cOzThHeNnVlxg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andi Kleen <ak@linux.intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] modpost: move __attribute__((format(printf, 2, 3))) to modpost.h
Date: Sun,  3 Dec 2023 18:49:31 +0900
Message-Id: <20231203094934.1908270-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This attribute must be added to the function declaration in a header
for comprehensive checking of all the callsites.

Fixes: 6d9a89ea4b06 ("kbuild: declare the modpost error functions as printf like")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

(no changes since v1)

 scripts/mod/modpost.c | 3 +--
 scripts/mod/modpost.h | 3 ++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index cb6406f485a9..ca0a90158f85 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -60,8 +60,7 @@ static unsigned int nr_unresolved;
 
 #define MODULE_NAME_LEN (64 - sizeof(Elf_Addr))
 
-void __attribute__((format(printf, 2, 3)))
-modpost_log(enum loglevel loglevel, const char *fmt, ...)
+void modpost_log(enum loglevel loglevel, const char *fmt, ...)
 {
 	va_list arglist;
 
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 69baf014da4f..9fe974dc1a52 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -197,7 +197,8 @@ enum loglevel {
 	LOG_FATAL
 };
 
-void modpost_log(enum loglevel loglevel, const char *fmt, ...);
+void __attribute__((format(printf, 2, 3)))
+modpost_log(enum loglevel loglevel, const char *fmt, ...);
 
 /*
  * warn - show the given message, then let modpost continue running, still
-- 
2.40.1


