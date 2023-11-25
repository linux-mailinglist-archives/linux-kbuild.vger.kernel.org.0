Return-Path: <linux-kbuild+bounces-160-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF07F89EF
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 11:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8666D1C20C01
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Nov 2023 10:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DA463BD;
	Sat, 25 Nov 2023 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MVlOFapV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96463234
	for <linux-kbuild@vger.kernel.org>; Sat, 25 Nov 2023 10:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4015CC433C8;
	Sat, 25 Nov 2023 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700908292;
	bh=1NjYyVMTbEYrYJbWYo16fYRJ4go93r4tTFjTVNLyfms=;
	h=From:To:Cc:Subject:Date:From;
	b=MVlOFapVpx90KH1wMWShYB/xzzNDh16Atogs82J3zghXoqUFi+xcapJ6fODrvVGTj
	 f8PKozrX4yioUdDuibC4/52x5/HDy9jh35vyHoK+iBupoTA71fJr+6k4z6645jg/H3
	 1DeDWjz3kfsDpEBTUtmK/rSdVRrAMSH8fE0niSrFj27KTeohvchgKXObM8Yv+iBfH0
	 zwpEh9eRbOZOChuT7cADbeikGoVOADxGNRSWqov7vBf+f+53FjfsWulDh6Q92P88FW
	 ydTuV0NieSNCF0TTpjTj4wRpSEmRMBggu7emM7j7pbGQcOdiGN2CUYYWPjgOS4m9qy
	 FTIcDOzAUT3fw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/3] modpost: move __attribute__((format(printf, 2, 3))) to modpost.h
Date: Sat, 25 Nov 2023 19:31:14 +0900
Message-Id: <20231125103116.797608-1-masahiroy@kernel.org>
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
---

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


