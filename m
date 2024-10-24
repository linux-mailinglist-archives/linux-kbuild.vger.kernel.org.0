Return-Path: <linux-kbuild+bounces-4310-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 525F59AE3CC
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 13:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14401F23485
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Oct 2024 11:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184E61CCED2;
	Thu, 24 Oct 2024 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApHRTKER"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CFB1B85DB;
	Thu, 24 Oct 2024 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729769153; cv=none; b=ru9D7e8Jc0Lf3C0BkVrXAxqoX1u0B1DJr+mVnz8Ca9ix7pstYKi4T9ElyOSrYJVB4lHXHvJcLakxmWSnfapg69RuMSodnMw5DXiZMhU+wFHGma4/uIyWoHWluDN3Q5J8eGG2oOiOT1sA435u+vSZaiwgo5Jp3t/BS3u0BXUGprk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729769153; c=relaxed/simple;
	bh=yeqed8Av//TbMP+Pk9YeRFSeHsxAW5ErOnVhQclvqvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7DTIS+KaWCmqOw6ZgCQaK+qvWPqvEXP57jj7TZ8YhEAj/IEtLqKZjplSGDrk5CuodsYUlTp+jdo3paP1uumn6akfRR8cCFm5CvHdxQ2A/mwgrv3wG+NRlyJ2pgRfoubMk30YJgmy7Ma52a2T1jWscimyR2KrYRawaKd3nAEN9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApHRTKER; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AEBC4CEC7;
	Thu, 24 Oct 2024 11:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729769152;
	bh=yeqed8Av//TbMP+Pk9YeRFSeHsxAW5ErOnVhQclvqvc=;
	h=From:To:Cc:Subject:Date:From;
	b=ApHRTKERHTnPhcsmpTFCd5uwEXdtL/Cio7raj6N6yX2QDTGN8Ir9AnC5bY7Sd/SpK
	 W0cFgurjLrAGu6yas9E8QKkWs77ER3c5KFytC6ANO6XyBuXKadFyGGb1Nw7I2ZhML3
	 rTFnQFBBHajsJYpYWs3Bty84J0RI4dPHHOa/tv/ZUGlOfvOTkjF969by3F5T3pgLsZ
	 E2AuHQmIRPP8r0TnerJ9i/VFdLFCD7eOLAKL6RaHPxxNoNUkoVNerpMGZYpGScfeP2
	 +Apo2C8kpjK7e+oTgMD2yyhnns9zJlglEolZaKauwjRT8c0XWzirnCi2bbA3HaUvas
	 CHZGfV0vOQmmQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: document the positional argument in the help message
Date: Thu, 24 Oct 2024 20:25:45 +0900
Message-ID: <20241024112548.1438155-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The positional argument specifies the top-level Kconfig. Include this
information in the help message.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/conf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 3d7d454c54da..8abe57041955 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -628,7 +628,7 @@ static const struct option long_opts[] = {
 
 static void conf_usage(const char *progname)
 {
-	printf("Usage: %s [options] <kconfig-file>\n", progname);
+	printf("Usage: %s [options] kconfig_file\n", progname);
 	printf("\n");
 	printf("Generic options:\n");
 	printf("  -h, --help              Print this message and exit.\n");
@@ -653,6 +653,9 @@ static void conf_usage(const char *progname)
 	printf("  --mod2yesconfig         Change answers from mod to yes if possible\n");
 	printf("  --mod2noconfig          Change answers from mod to no if possible\n");
 	printf("  (If none of the above is given, --oldaskconfig is the default)\n");
+	printf("\n");
+	printf("Arguments:\n");
+	printf("  kconfig_file            Top-level Kconfig file.\n");
 }
 
 int main(int ac, char **av)
-- 
2.43.0


