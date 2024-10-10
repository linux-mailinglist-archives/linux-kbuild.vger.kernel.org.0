Return-Path: <linux-kbuild+bounces-4018-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E388D997E0F
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 09:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B7201C23EB3
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 07:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2B7196450;
	Thu, 10 Oct 2024 07:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="vT4R1yDs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFF2AEEC;
	Thu, 10 Oct 2024 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543658; cv=none; b=dVt7hnxzYvfGehG2upCBfT5SDAxnL4OcEz4Hz0Xxb/CK8k/O64ke69Y7ZRTnwRRKy8q8mRrw5IK4ZcK6+6F0iQrTLuZAo1arUjoqW5vO8eeJrE1LcNOdrOZr9XMMj9LwQkNs4phgvlwo98tuChjcB/wz8moeVIgNA6ZGLlEQ/gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543658; c=relaxed/simple;
	bh=xPcBq5knZtMMUnDNrRnIbLcNwaOEkqYFUGVYYA5J5wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G5pQPIgA5MIfhuJkeR6RMEjLwexdRiT/sb6om9UsWQcS84fTBvtXxjgx1N7J6RD6xRcLxfKCcaZA6n0SD+v6HuCD196zocDCSuEMSgnc64QukAaQjM7eicqQiVetGNQqGca9SDhB5Crfzg7k4HuyHvA8ZdU5OMTsKeZ+vIxJlFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=vT4R1yDs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:From:Sender:Reply-To:Subject:Date:
	Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=pJBhocdo6Har7104NrpVpHyik04x81ViwI6R3YxrsfM=; t=1728543656; x=1728975656;
	 b=vT4R1yDsgvShlN6yLpEoiVu+3hfYAV/qtK+AT0iem/511TXuKJ0PDSeSEFb7gwhyms0XABLHZu
	Ug6Xg9AUScyEyWUDvaytm4kkFacY7CwqRc+9iBRFtiWtn3KqbIGMAjqZgAXEguT+/VkfuTNvSm4n5
	BbC9hi1gWyxCUQLbLbHixhhSNd/imrIOffN7H7T6sCuQfTlz19jNrhX6T9EQG6pyNs2Cm+DhL+mZ0
	l9UAeGaAwDS4HKVjgGg57RyvrxZYj15kEjc9y0MYJ2ucdOGYqoqSIcmC8dfMoNoxJ7CkGAg4qvtIG
	FAINCoLjYDu+Bu8g4GaAC5hCSP83mWZumMonQ==;
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1synAM-0006FU-CN; Thu, 10 Oct 2024 09:00:54 +0200
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-modules@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1] module: sign with sha512 by default to avoid build errors
Date: Thu, 10 Oct 2024 09:00:53 +0200
Message-ID: <42aa307d7ffae1851b4a8787f5c276dd0b3beece.1728543368.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1728543656;8b200004;
X-HE-SMSGID: 1synAM-0006FU-CN

Avoid build errors with allmodconfig on Fedora Linux 41+ by reordering
the Kconfig choices so modules are signed with sha512 by default. That
way sha1 will be avoided, which beforehand was chosen by default on
x86_64 when running allmodconfig -- which on the latest Fedora leads to
the following build error when building the certs/ directory:

  80A20474797F0000:error:03000098:digital envelope routines:do_sigver_init:invalid digest:crypto/evp/m_sigver.c:342:
  make[4]: *** [.../certs/Makefile:53: certs/signing_key.pem] Error 1
  make[4]: *** Deleting file 'certs/signing_key.pem'
  make[4]: *** Waiting for unfinished jobs....
  make[3]: *** [.../scripts/Makefile.build:478: certs] Error 2
  make[2]: *** [.../Makefile:1936: .] Error 2
  make[1]: *** [.../Makefile:224: __sub-make] Error 2
  make[1]: Leaving directory '...'
  make: *** [Makefile:224: __sub-make] Error 2

OpenSSL causes that error, as it now distrusts sha1 signatures by
default on Fedora[1]. This can be worked around locally by switching to
an earlier policy using 'update-crypto-policies --set FEDORA40'.

This change makes things work by default again and will avoid similar
problems on other distributions, as those sooner or later are likely to
apply similar measures; for regular users this likely is a wise move,
too.

Link: https://fedoraproject.org/wiki/Changes/OpenSSLDistrustsha1SigVer [1]
Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

Lo! This is a submission in the style of "I don't know what I'm doing
and this patch is mainly meant to start a discussion to resolve a
problem I ran into". The patch solved the problem for me, but there
might be a better way to make Kconfig use sha512 by default -- ideally
while keeping the menu in an order that makes more sense for humans.

I furthermore chose sha512 without any strong reasons; I first
considered sha256, but then settled on sha512 because Fedora uses it. So
I'm not attached to this. Ciao, Thorsten
---
 kernel/module/Kconfig | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 7c6588148d42d3..3647ff25d49d67 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -238,18 +238,6 @@ choice
 	  possible to load a signed module containing the algorithm to check
 	  the signature on that module.
 
-config MODULE_SIG_SHA1
-	bool "SHA-1"
-	select CRYPTO_SHA1
-
-config MODULE_SIG_SHA256
-	bool "SHA-256"
-	select CRYPTO_SHA256
-
-config MODULE_SIG_SHA384
-	bool "SHA-384"
-	select CRYPTO_SHA512
-
 config MODULE_SIG_SHA512
 	bool "SHA-512"
 	select CRYPTO_SHA512
@@ -266,6 +254,18 @@ config MODULE_SIG_SHA3_512
 	bool "SHA3-512"
 	select CRYPTO_SHA3
 
+config MODULE_SIG_SHA384
+	bool "SHA-384"
+	select CRYPTO_SHA512
+
+config MODULE_SIG_SHA256
+	bool "SHA-256"
+	select CRYPTO_SHA256
+
+config MODULE_SIG_SHA1
+	bool "SHA-1"
+	select CRYPTO_SHA1
+
 endchoice
 
 config MODULE_SIG_HASH

base-commit: d3d1556696c1a993eec54ac585fe5bf677e07474
-- 
2.45.0


