Return-Path: <linux-kbuild+bounces-4150-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8249A0C6F
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 16:19:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F1881C21100
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 14:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF6020C018;
	Wed, 16 Oct 2024 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="uYqr+c7M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338020ADDA;
	Wed, 16 Oct 2024 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729088326; cv=none; b=SIqu5COi2b/zYZDvXrU3m/AmOUd/l6u+a+tb67dOk6oMBaidCsbUXkPAZycgcIChe//jdDEw6QMQ2xFp1hYarR0uW9qknF1/0dk3lXCRHvB0KixtxbVL5CqYpDIwihyvPH9wTq6Exo3/8tJBxOfi70py0pVfjcz4plAF5VrWddY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729088326; c=relaxed/simple;
	bh=1SgBcW6Fix9iqgyCPKwWFUk/Intqb+PvahMLyVaBZNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fCmeJQHG/gDt/nyU7l5eKKqybMxjwlW0YJ2ohcQ4BCtg7SbEw/2Poax9mJ1qWMO5AJnFt6JHYQGE2QUIqTLnc0A0Y664CxhlX/WXnjhtsgvI9Wj/Mda1xNGnq+9oYOhfqJ25SOlQ1NZRnTRrEg7wOqVC7LnqaMYufIDFJbfhAtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=uYqr+c7M; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WVSfqM6t5XYigKCrGasm6YaByww0kzpN12wmfrKZMfo=; t=1729088324; x=1729520324;
	 b=uYqr+c7MMGwTSirTvKRIo3+BTDClGTyFO+P7T1S2Qa7lH1QYbeeoXGDu48gQ+tQ5U0SGb7QAsd
	bMT/NuM1IqHTO5MVtuTI3W/FxNnbPe5r4mNGW8Me9HVJBKiqiPx2yGz2DAPKk1OvvwCCirIKNP6Nl
	SSyclWOOYYHfxHsB4jO70e1inG3wClYzmUYBVxgqpT6VT5pD/syIz/s8+TVk6GV4qKEpxacC/QQlC
	9wDYzne2HbIUSHdB3BGk+JlmduI1p7X6jCbPyMLSHBLeTX9rF/DROJTjzNHd4yEpBe04PNj9pLo6Z
	4jnKD374W3XlIjbwOuYdnOWYcRId4/7/fYZ6Q==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1t14rJ-0003uH-QA; Wed, 16 Oct 2024 16:18:41 +0200
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-modules@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] module: sign with sha512 instead of sha1 by default
Date: Wed, 16 Oct 2024 16:18:41 +0200
Message-ID: <52ee32c0c92afc4d3263cea1f8a1cdc809728aff.1729088288.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1729088324;aa6d0e34;
X-HE-SMSGID: 1t14rJ-0003uH-QA

Switch away from using sha1 for module signing by default and use the
more modern sha512 instead, which is what among others Arch, Fedora,
RHEL, and Ubuntu are currently using for their kernels.

Sha1 has not been considered secure against well-funded opponents since
2005[1]; since 2011 the NIST and other organizations furthermore
recommended its replacement[2]. This is why OpenSSL on RHEL9, Fedora
Linux 41+[3], and likely some other current and future distributions
reject the creation of sha1 signatures, which leads to a build error of
allmodconfig configurations:

  80A20474797F0000:error:03000098:digital envelope routines:do_sigver_init:invalid digest:crypto/evp/m_sigver.c:342:
  make[4]: *** [.../certs/Makefile:53: certs/signing_key.pem] Error 1
  make[4]: *** Deleting file 'certs/signing_key.pem'
  make[4]: *** Waiting for unfinished jobs....
  make[3]: *** [.../scripts/Makefile.build:478: certs] Error 2
  make[2]: *** [.../Makefile:1936: .] Error 2
  make[1]: *** [.../Makefile:224: __sub-make] Error 2
  make[1]: Leaving directory '...'
  make: *** [Makefile:224: __sub-make] Error 2

This change makes allmodconfig work again and sets a default that is
more appropriate for current and future users, too.

Link: https://www.schneier.com/blog/archives/2005/02/cryptanalysis_o.html [1]
Link: https://csrc.nist.gov/projects/hash-functions [2]
Link: https://fedoraproject.org/wiki/Changes/OpenSSLDistrustsha1SigVer [3]
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

v2:
* use 'default MODULE_SIG_SHA512' in the "Hash algorithm to sign
  modules" choice instead of resorting the entries there.
* rewrite patch description
* drop RFC tag

v1: https://lore.kernel.org/all/42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info/
---
 kernel/module/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 7c6588148d42d3..0c746a150e34e2 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -231,6 +231,7 @@ comment "Do not forget to sign required modules with scripts/sign-file"
 choice
 	prompt "Hash algorithm to sign modules"
 	depends on MODULE_SIG || IMA_APPRAISE_MODSIG
+	default MODULE_SIG_SHA512
 	help
 	  This determines which sort of hashing algorithm will be used during
 	  signature generation.  This algorithm _must_ be built into the kernel

base-commit: d3d1556696c1a993eec54ac585fe5bf677e07474
-- 
2.45.0


