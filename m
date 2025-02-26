Return-Path: <linux-kbuild+bounces-5913-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB612A460F0
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2025 14:30:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC92D177E5E
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2025 13:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D085101FF;
	Wed, 26 Feb 2025 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="mQIX7WSq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1E74A32;
	Wed, 26 Feb 2025 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740576635; cv=none; b=D/Jlra/ZnwxZHy/PnBauAL5su7CiVR10TZulPUbT0TGDMWO1gC2ywMSQSbIYs4KEwBZpeKJooR0WhKOXm+fYT0VzmQy2fu/GHFiVpy8aZ9k8uBC1nKNd+Xl6IXQPmSKF54qK++234Legl3PlMgykJAF7M21/GgPxP0cInGDFllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740576635; c=relaxed/simple;
	bh=WUCn3NR9PxdbMqa3sx2Zz8b2LWvwcQQuQ0f4+sSp+oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=amWPlyVkHAZYNV94rihz2g/CIuLJv/D5dpMz9DU7i2Iv/kt5FhWWbMFphn4kaxCz2HdjJWX9ExsScOsgStJb0B9iLVFRIygiTIJ6o459AqBbe5Ji9oRx8kO/FpiZnhQryY/asoXr2B54BwwOIDDYRoGNCUc4Ye0W7WA7wVx3smE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=mQIX7WSq; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1740576633;
	bh=nMbc5CnbI6I8clY9cZ5d8AQEmOjE8gCVJmupuYyFtt0=;
	h=From:To:Cc:Subject:Date:From;
	b=mQIX7WSqXvqz9PMK9PFNmIZaPG6MY5KC4HyPJypgirSNR/qsrng82mlOU2oyKk7Bi
	 AS+gjxsRrPEOExEPQgrqqkHuFDaK/CVD2VPLaXYQaDA6T/7pqmLrwcR/rkWKxgr3sw
	 2NCYmJP+4KNNgP2oG4Cp4D4UiUXIErFkEq+fMJ28=
Received: from stargazer.. (unknown [IPv6:240e:456:1120:44ab:6cbe:bf9d:b543:fee6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id AA6C01A3F54;
	Wed, 26 Feb 2025 08:30:28 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] kbuild: add dependency from vmlinux to sorttable
Date: Wed, 26 Feb 2025 21:30:14 +0800
Message-ID: <20250226133014.381585-1-xry111@xry111.site>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without this dependency it's really puzzling when we bisect for a "bad"
commit in a series of sorttable change: when "git bisect" switches to
another commit, "make" just does nothing to vmlinux.

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 scripts/Makefile.vmlinux | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 873caaa55313..fb79fd6b2465 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -79,6 +79,10 @@ ifdef CONFIG_DEBUG_INFO_BTF
 vmlinux: $(RESOLVE_BTFIDS)
 endif
 
+ifdef CONFIG_BUILDTIME_TABLE_SORT
+vmlinux: scripts/sorttable
+endif
+
 # module.builtin.ranges
 # ---------------------------------------------------------------------------
 ifdef CONFIG_BUILTIN_MODULE_RANGES
-- 
2.48.1


