Return-Path: <linux-kbuild+bounces-7724-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B572AEAD2D
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 05:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A342E4E0DC9
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Jun 2025 03:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1C0D13AC1;
	Fri, 27 Jun 2025 03:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rwt4erbc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDD823DE;
	Fri, 27 Jun 2025 03:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750993577; cv=none; b=Jn9llMh3LtbVst3ioOHZh9Ke05ajVAAl/XiuahpRqhzzCUsCMoSSEOq+Wjw0ztWQVoBVgA3jcKammSi9WhZnNDntkoKhKX21LLazoqcXN4z6Pxx2UyRtWRpOW70je0h28nB0nRyxPexiPMGvbD0zd4iOycMeEimE84n00LSs9pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750993577; c=relaxed/simple;
	bh=OdfNMvO6C+AwcE+wkC4lSx53URFhypOSDQd/uI8BzXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZKxx7/Udl+UCKBZu/ptLZJChV8mTdprfXINtEJ44m0dKRrBbVAUV9UKB62Va/tpR4Ey9xcQ720FTOWci8826YZGdgqMXun7AJSGA7TWNWHodWFNReWfzCOi9PpLVGbzeVrbn1ERTJMY71NTmddQw5Nnj23jUF96EyP8ivy2cUKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rwt4erbc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=wvFn8h03pISlbzQyEmEgqxWepal/xwwSPh6Ju9nB3/k=; b=rwt4erbcPRwmESXgI82I1GuA0y
	uT9PViKmVwFJ9y1OVZV7VbAS0ArqGyIvuq2kJDQdJEgT6ShdvooQKw1i1Qf8RlG/ZdtZUPRMsHyM8
	pq5gz5IdRmz5jeCnfkGnTvxRkXAgrK2QojndqF0ktswr2QY26QeXy4Cg0OjUUx+GX5yBqxwia+/D8
	p83Dl2BxiH0Vs/dTejf80ly+DM10rEdx6xd1SQ3rq5bQe3cgWeDWFEQlEQmK19Bih3keKChMpEcb2
	VKQUBgBlq73tlqzd68GGhvAq3j/v9imXtXxv5S5HqzZSU/C/xebPy1b09SeBtCjv3ohq9i+L/7JTd
	YgvmVf4g==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzPo-0000000DPhl-3FVT;
	Fri, 27 Jun 2025 03:06:12 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] docs: kbuild/kconfig: add alldefconfig to the all*configs
Date: Thu, 26 Jun 2025 20:06:12 -0700
Message-ID: <20250627030612.3887582-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "alldefconfig" to the explanation of the KCONFIG_ALLCONFIG
environment variable usage so that all targets that use KCONFIG_ALLCONFIG
are listed.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org
---
 Documentation/kbuild/kconfig.rst |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- lnx-616-rc3.orig/Documentation/kbuild/kconfig.rst
+++ lnx-616-rc3/Documentation/kbuild/kconfig.rst
@@ -67,12 +67,12 @@ Environment variables for ``*config``:
     with its value when saving the configuration, instead of using the
     default, ``CONFIG_``.
 
-Environment variables for ``{allyes/allmod/allno/rand}config``:
+Environment variables for ``{allyes/allmod/allno/alldef/rand}config``:
 
 ``KCONFIG_ALLCONFIG``
-    The allyesconfig/allmodconfig/allnoconfig/randconfig variants can also
-    use the environment variable KCONFIG_ALLCONFIG as a flag or a filename
-    that contains config symbols that the user requires to be set to a
+    The allyesconfig/allmodconfig/alldefconfig/allnoconfig/randconfig variants
+    can also use the environment variable KCONFIG_ALLCONFIG as a flag or a
+    filename that contains config symbols that the user requires to be set to a
     specific value.  If KCONFIG_ALLCONFIG is used without a filename where
     KCONFIG_ALLCONFIG == "" or KCONFIG_ALLCONFIG == "1", ``make *config``
     checks for a file named "all{yes/mod/no/def/random}.config"

