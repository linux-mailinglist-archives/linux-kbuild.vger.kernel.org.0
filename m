Return-Path: <linux-kbuild+bounces-9782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6227FC7E58C
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 19:37:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D7E5434542B
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 18:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F5FF15A86D;
	Sun, 23 Nov 2025 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQ9APbWa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A713AD26;
	Sun, 23 Nov 2025 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763923015; cv=none; b=kiXy/ks4v0hz9M51HY9O+A2JCOrPj99e8zsdVcX6sw/RVAcuoqIReOkS8w3TfXQY86eYLsysEP3Sfe8J/s4XY2nkddZves6QZK4bAnB9IrPoN1Tz9/IxTeew5T3lFRXzs3kwt33JqRYCTo3lW+rTu2a5bjkCkr2jZeXRgBJcGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763923015; c=relaxed/simple;
	bh=FEMswfPCj1k1rdEYrvQHS1IYdrTw5pOqxKt5a4aQ1KI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ippdod6GDk/aEh8so59IFagEERvC5udkfzWgfUBulgVTICDM9fYPHrlsZztk7gBf5zy5ExVEpVjKUlrNQ/vOLZFUZA3J5pZluKfkN11L+rPc79keVD4g3DXD55hj/4Lzr4w+4iCoiiZ9DJTdMoJb7KYrn2AXtbtQxXo45ifgDyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQ9APbWa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C1EC113D0;
	Sun, 23 Nov 2025 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763923014;
	bh=FEMswfPCj1k1rdEYrvQHS1IYdrTw5pOqxKt5a4aQ1KI=;
	h=From:To:Cc:Subject:Date:From;
	b=sQ9APbWaOVzA03oEmvb3aCMaCKh7Uzh7pYJZ2LVLXGO0xi2RWbrd0AkRbtdZEyRZS
	 V99VL7lH/sOGqmLX9xL3NUwybRcZN9fekjY9lFZMNy4qzLbs6tABbUmlWOd7sl0Hfz
	 0ij1NBPR1JihaoCIk3p0d1S0jyPdwTFWG2C0i9lrkZTJTDrM5KqUvRt+KRxOKFkLBX
	 LRFeOiVvrPGpCaORyDBFmHoTNChmisB1WuLCgcQiEsf9eztkKKXv7RlDA34dYfT+Ld
	 nas0HLx/2AQGaPtCmJFBLJp2YiyM552XpSVpVqzUmRwTufmd29Bdwx8VbYJjFGAk/s
	 z31a14R5qoLMQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vNExA-00000007fjK-0nJv;
	Sun, 23 Nov 2025 18:36:52 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: [PATCH] kbuild: deb-pkg: Allow packages to be excluded from bindeb-pkg
Date: Sun, 23 Nov 2025 18:36:47 +0000
Message-ID: <20251123183647.76559-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, nathan@kernel.org, nicolas.schier@linux.dev
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

The bindeb-pkg target generates a number of individual packages:
the kernel package itself, the debug package, the kernel and libc
header packages.

It is at times useful to not generate all the packages, such as
the debug package, even if the kernel configuration has CONFIG_DEBUG.

For this purpose, let the user provide a DEB_EXCLUDE_PKG environment
variable that can contain exclusion patterns for some of the build
artefacts. This saves precious cycles when repeatedly building packages
for testing purposes, where not all packages are strictly necessary.

The default behaviour, with no variable defined, is of course unchanged.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 scripts/package/debian/rules | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
index a417a7f8bbc1a..cc5ebb8a37e1a 100755
--- a/scripts/package/debian/rules
+++ b/scripts/package/debian/rules
@@ -29,7 +29,12 @@ make-opts = ARCH=$(ARCH) KERNELRELEASE=$(KERNELRELEASE) \
 
 binary-targets := $(addprefix binary-, image image-dbg headers libc-dev)
 
-all-packages = $(shell dh_listpackages)
+# DEB_EXCLUDE_PKG excludes a list of packages from the set that would
+# normally be produced. Can be either explicit package names or patterns.
+# For example:
+# DEB_EXCLUDE_PKG="linux-headers-% linux-libc-dev linux-image-%-dbg"
+# limits the packages to the linux-image package.
+all-packages = $(filter-out $(DEB_EXCLUDE_PKG), $(shell dh_listpackages))
 image-package = $(filter linux-image-% user-%, $(filter-out %-dbg, $(all-packages)))
 image-dbg-package = $(filter %-dbg, $(all-packages))
 libc-dev-package = $(filter linux-libc-dev, $(all-packages))
-- 
2.47.3


