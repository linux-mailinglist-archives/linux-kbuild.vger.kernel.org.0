Return-Path: <linux-kbuild+bounces-5973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D03A50B72
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 20:27:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A98233AD0E6
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Mar 2025 19:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80800253B7C;
	Wed,  5 Mar 2025 19:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="g3omvRn6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD9C24C062
	for <linux-kbuild@vger.kernel.org>; Wed,  5 Mar 2025 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741202867; cv=none; b=kTeMXwCJfBcZ5BblaUAgWJmxvSk3DuclaIIgkGCcl3aOhSfo7ewimpwV2/WHfXb/XhgUvPvIWUylIP5unL92MyILL3zbsPnHWTjhLRZODAnY/5KbgIrEEHV066z8YRV06iW5i3UDNfJ3JUmKWneLE3Kp3QC9NN9bGhG6ZyApDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741202867; c=relaxed/simple;
	bh=qgFufaYHE7ZhKPMw+c54H6YIs8L7NTTUgMvALYLQB4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=Ky9VgbuVAeAath3vFtewdiPXUlIwqWGv/4VaJRMo5so8Srfq5WWFTSs4E7XI1LSLbTrOzkYIryDUAYlcpNnb1iL0KFe+/noUfUjBAlfSjR6MRtFjHHZkZP0DI5Nvgcm/C2wFPF9DlMKLsxhp0eMZReoOgPxUW/h3A1J4zbqCfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=g3omvRn6; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1741202863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nKyJxOhXzkW5rTLblcneQpSA0/ozUONR0BpbeodOjQ8=;
	b=g3omvRn6nTrvKh/uvhf/6VuSKIk7gfh3iLkBvpDIcwXMsCaxPdFVnSSJiFm7pEML6ycZ7h
	pvWCmhks9sgP30HWiofDnH3lT6F9S7Jww8UNUHMD1EVRfkJoIhXXQGUFVJB8wdLM7S58Zo
	4yeptKOBN+SFQsH0GiUVOlL6DKcZYp0=
Received: from g7t16451g.inc.hp.com (hpi-bastion.austin1.mail.core.hp.com
 [15.73.128.137]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-584-ZaGcdk-JMCmGo1aiqBHA9A-1; Wed, 05 Mar 2025 14:27:41 -0500
X-MC-Unique: ZaGcdk-JMCmGo1aiqBHA9A-1
X-Mimecast-MFC-AGG-ID: ZaGcdk-JMCmGo1aiqBHA9A_1741202860
Received: from g7t16459g.inc.hpicorp.net (g7t16459g.inc.hpicorp.net [15.63.18.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by g7t16451g.inc.hp.com (Postfix) with ESMTPS id 233306000B60;
	Wed,  5 Mar 2025 19:27:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [15.53.255.151])
	by g7t16459g.inc.hpicorp.net (Postfix) with ESMTP id 1517E6000097;
	Wed,  5 Mar 2025 19:27:36 +0000 (UTC)
From: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	linux-kbuild@vger.kernel.org
Cc: nicolas@fjasle.eu,
	linux-kernel@vger.kernel.org,
	Alexandru Gagniuc <alexandru.gagniuc@hp.com>,
	stable@vger.kernel.org
Subject: [PATCH] kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION indiscriminately
Date: Wed,  5 Mar 2025 19:25:36 +0000
Message-ID: <20250305192536.1673099-1-alexandru.gagniuc@hp.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dpnOO8GLazrTEI1EFN3uTlv-H3x8enLuJyxenkWs9vU_1741202860
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true

In ThinPro, we use the convention <upstream_ver>+hp<patchlevel> for
the kernel package. This does not have a dash in the name or version.
This is built by editing ".version" before a build, and setting
EXTRAVERSION=3D"+hp" and KDEB_PKGVERSION make variables:

    echo 68 > .version
    make -j<n> EXTRAVERSION=3D"+hp" bindeb-pkg KDEB_PKGVERSION=3D6.6.6+hp69

    .deb name: linux-image-6.6.6+hp_6.6.6+hp69_amd64.deb

Since commit 7d4f07d5cb71 ("kbuild: deb-pkg: squash
scripts/package/deb-build-option to debian/rules"), this no longer
works. The deb build logic changed, even though, the commit message
implies that the logic should be unmodified.

Before, KBUILD_BUILD_VERSION was not set if the KDEB_PKGVERSION did
not contain a dash. After the change KBUILD_BUILD_VERSION is always
set to KDEB_PKGVERSION. Since this determines UTS_VERSION,the uname
output to look off:

    (now)      uname -a: version 6.6.6+hp ... #6.6.6+hp69
    (expected) uname -a: version 6.6.6+hp ... #69

Update the debian/rules logic to restore the original behavior.

Cc: <stable@vger.kernel.org> # v6.12+
Fixes: 7d4f07d5cb71 ("kbuild: deb-pkg: squash scripts/package/deb-build-opt=
ion to debian/rules")
Signed-off-by: Alexandru Gagniuc <alexandru.gagniuc@hp.com>
---
 scripts/package/debian/rules | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/package/debian/rules b/scripts/package/debian/rules
index ca07243bd5cd..bbc214f2e6bd 100755
--- a/scripts/package/debian/rules
+++ b/scripts/package/debian/rules
@@ -21,9 +21,13 @@ ifeq ($(origin KBUILD_VERBOSE),undefined)
     endif
 endif
=20
-revision =3D $(lastword $(subst -, ,$(shell dpkg-parsechangelog -S Version=
)))
+debian_revision =3D $(shell dpkg-parsechangelog -S Version)
+revision =3D $(lastword $(subst -, ,$(debian_revision)))
 CROSS_COMPILE ?=3D $(filter-out $(DEB_BUILD_GNU_TYPE)-, $(DEB_HOST_GNU_TYP=
E)-)
-make-opts =3D ARCH=3D$(ARCH) KERNELRELEASE=3D$(KERNELRELEASE) KBUILD_BUILD=
_VERSION=3D$(revision) $(addprefix CROSS_COMPILE=3D,$(CROSS_COMPILE))
+make-opts =3D ARCH=3D$(ARCH) KERNELRELEASE=3D$(KERNELRELEASE) $(addprefix =
CROSS_COMPILE=3D,$(CROSS_COMPILE))
+ifneq ($(revision), $(debian_revision))
+    make-opts+=3DKBUILD_BUILD_VERSION=3D$(revision)
+endif
=20
 binary-targets :=3D $(addprefix binary-, image image-dbg headers libc-dev)
=20
--=20
2.48.1


