Return-Path: <linux-kbuild+bounces-13028-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YG0bOrkN+mntIgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13028-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 17:33:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E36B4D0423
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 17:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63EE73029E68
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 15:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A921A480950;
	Tue,  5 May 2026 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REwnltqG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8737C11B;
	Tue,  5 May 2026 15:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995020; cv=none; b=U4T2nrKq1kPEPNmAGg3LXgTEMVgF/3ttfduGTFEf+MEWkyxLnXKrdBHZ7hi8DMTrutBpzmsqQulSmDp96qBeMEAgqvT5Uw488DeshOSFM/d0PfoCy3ca24OOh0lRFtSLJeAsqR1Ol/wuEQFEc0+SRP0aKqq8N0xC1kUgUDhtnt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995020; c=relaxed/simple;
	bh=rbG0Au3ctJfWhVSRC2/5kBZAvhsXHaStitzyhF3Soik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JTbqEDCJ2UFPj/dxJHi8A6MPoS0ficY9R0H3Dj8F8FOnclZTLdNZ7qzOZt9iEMncnLWw9FdnPwYxA4nGBIIRaTYlP+n06F+XmvlsL7F7W4Nlvicbv4GX/YG7C9Id1N8upvsFsNwjZCXOQyIjHpYMPfuNnPxBDsyIDKjr++5Hn5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REwnltqG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B676C2BCB4;
	Tue,  5 May 2026 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995020;
	bh=rbG0Au3ctJfWhVSRC2/5kBZAvhsXHaStitzyhF3Soik=;
	h=From:To:Cc:Subject:Date:From;
	b=REwnltqGtW4CE7UbjnVn9qvHDSueVWepKkTMR35frNCSlMdJwZJfN9QxglL1jDVMK
	 qbmffiqTUpS6dNbbhhcHw6P2bceR+gGkPuLOFFjGv+LXY7pzgubDPVV+SdC0EYEKQ7
	 XKqIGT6vQYTbJFBhyN/SKpdufb2J8PRBFXKbuE4NRAseZTdT0z2vJXkkzCpJTYwMaf
	 Y3W5omZ5aMHME4uZpb1hapfAECWJw7LN1CxrXCV8UVUx91mAJwFAQAnEvCm1YQAyva
	 NIfwsp/oCsjGKreN6PstFM4O1eF6ctYoxVJJHkYcnyjiy4l6YxEJt1GEEbWwtbCPs0
	 ynTDThqcv7tow==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	nathan@kernel.org,
	nsc@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] kbuild: deb-pkg: Allow setting package name at build
Date: Tue,  5 May 2026 10:29:54 -0500
Message-ID: <20260505152957.695641-1-superm1@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8E36B4D0423
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13028-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Users can change the source package by setting variable `KDEB_SOURCENAME`,
but the binary package name is hardcoded.

Add support for setting binary package name by using `KDEB_PACKAGENAME`
and let it affect both kernel image and debug image packages.

Update kbuild documentation to include defaults and mention both
`KDEB_PACKAGENAME` and `KDEB_SOURCENAME`.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 Documentation/kbuild/kbuild.rst | 10 ++++++++++
 scripts/package/mkdebian        |  6 ++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 5a9013bacfb75..cbdd2224c3a55 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -177,6 +177,16 @@ the UTS_MACHINE variable, and on some architectures also the kernel config.
 The value of KBUILD_DEBARCH is assumed (not checked) to be a valid Debian
 architecture.
 
+KDEB_SOURCENAME
+----------------
+For the deb-pkg target, allows overriding the default source package name.
+The default package name is "linux-upstream".
+
+KDEB_PACKAGENAME
+----------------
+For the deb-pkg target, allows overriding the default binary package name.
+The default package name is "linux-image".
+
 KDOCFLAGS
 ---------
 Specify extra (warning/error) flags for kernel-doc checks during the build,
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index d4b007b38a475..cbe4266fac732 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -166,7 +166,9 @@ else
 fi
 sourcename=${KDEB_SOURCENAME:-linux-upstream}
 
-if [ "$ARCH" = "um" ] ; then
+if [ "${KDEB_PACKAGENAME:+set}" ]; then
+	packagename=$KDEB_PACKAGENAME
+elif [ "$ARCH" = "um" ]; then
 	packagename=user-mode-linux
 else
 	packagename=linux-image
@@ -252,7 +254,7 @@ fi
 if is_enabled CONFIG_DEBUG_INFO; then
 cat <<EOF >> debian/control
 
-Package: linux-image-${KERNELRELEASE}-dbg
+Package: $packagename-${KERNELRELEASE}-dbg
 Section: debug
 Architecture: $debarch
 Build-Profiles: <!pkg.${sourcename}.nokerneldbg>
-- 
2.53.0


