Return-Path: <linux-kbuild+bounces-12614-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDIDLA2DzmmDoAYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12614-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 16:54:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C4238ADB5
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 16:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF359301FA51
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 14:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CF7264A65;
	Thu,  2 Apr 2026 14:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b="NaZVLdgl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AB61BF33
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141492; cv=none; b=F1YBQmStTtRG3/dIGT/cwm5Kva3hrD+OfhJj0SJNXe5z/7fueSIGaiAzb5hueFf6HIkJnVrx8Gp1CQkj80KOFszjFj1m+egehhUINygCFUPvkV1+oFhhsaRKNB2zbAzGMo41wNuy61Dz3FmjJCB6PmfBFjZYxshWiVvPEL91Zhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141492; c=relaxed/simple;
	bh=/4RxxzT9HbpXB3Xply4j3GLJQ8N0m6KcmqwwvXT3Uhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6pIzOYdHD/DEABzAa+Ym9zu6TmNj/Uz2LCgtmH2MKZpHrpb13Y+beWaKTPq1Vnq4KtHE1tZxcuYgAmBJOi0IkgdV3sgE/TjdW2LRpJYddBgC9njcMm4jPMQEHPQM11uoH6PsTf/ke459jUzH5HeEF4fWpgkdGCrvx5xZQi84lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net; spf=pass smtp.mailfrom=opensrcsec.com; dkim=pass (2048-bit key) header.d=grsecurity.net header.i=@grsecurity.net header.b=NaZVLdgl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=grsecurity.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensrcsec.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486b96760easo10730435e9.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec; t=1775141489; x=1775746289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZNgpVBBWBt/BjcBEIpUwFfEzWDtVQ/A+P1HrdOGo8M=;
        b=NaZVLdglOoUcQ/WfBiqlOGKo9nevzVMZs8EPQAC8PSby7m27zkJa9Vrv8nclTy8tlf
         NRg9bOl55+reIdsjoaJUditALpx0oXwVs4k6VKruFx2n5HC371Y34SLoaGI8ijP64nQd
         LM0bPzdn76wUJZp8TRnwTGcW8PDsoWzBwmW5l7zOwlmtNwLUw60vPqI4xNSzrrj6wy9j
         MaTuz02jrZ+vO0sUbZpBt/+bwf4MyH2vgnk2tELHMxICsCPSou9OFbKYlP/bvFrOaKKM
         fNFJyYBGY+8XZkVVL+9AYfqO1SFijcof3SlQKL7d0oDzC4J5mV8tNpnynEnPkZdeNuZD
         NOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141489; x=1775746289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZNgpVBBWBt/BjcBEIpUwFfEzWDtVQ/A+P1HrdOGo8M=;
        b=jDWzm2nX/tc1su+xam/X2W7HTlrYFgGtS1qY0aGVPRlglvAqalYGU3Y3vXqmr5/g+E
         buZtnBrzMkeMHpVWZrksbEu/P8acDvcmfRpStGYj6y+xkPUr4H7k0WETOZUnpAX2uxG/
         zIJoCVrd0NP4kvPN3UmYFtgcvkzoEJbHtFs/Yzxk8/j9lciV4M2NaSBFDZPV09TIuVJ9
         oy8lwRbiPaaj3daCeKrW+lGga7SvGOmiI0xDBFvSZr7fvt6FS4mIcTmBEKXdnXFhMsQF
         mHdnNgSqZad1Honceqdp9aUxnnp7oq/MOccNV/dgSc6nW+543/jWQfRbVtsBkV0UnAxP
         SOmg==
X-Forwarded-Encrypted: i=1; AJvYcCVsRN9MkTZI63hTGJCrWTx5tu3Q8aTPCMR9oz1/VQeAtfJIl5TUshUvZjzWC4SmL+ct5WtaPdO0HFos0vQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7+exa1MxTsXutZlVh+vYpikvQAGONWwihqYYZKcoE58x90LJ2
	csYy9ea44qmI2py+lIv8mu8xBO1mFAI6IOlcki5nnWSKnBOQOkQuYOwegOM4XOOkSmA=
X-Gm-Gg: ATEYQzwHi+RKaEr2JB8izrusUGD+4ESlTISWAMbSPZ3o3/4Q8iJN2sJFewrAjKdq9uQ
	XJAElcQZq6XO0rvB5e5DcccP81S4uQ8xHMoQ0/wNoW716ajJL/WpijRe7h5nXDvC3dTjrgyT/+a
	2O8IDzWj5KWbhe/VnyEN+fHii0bTfzO5LFYMfFkmLdSMShJNtl5SqXIS/g0PAHWfUdbYdWCWGPF
	gv4PoqBVL7ZkofADhu0bhOfntduhwwQsEyCY9lU+YK0Fkeg8JDhQLqdU/TNubiZRxBnYrlLdMp1
	vX42tzdViVmXklob9J/TfNv8QB6s/WCAkv7lPx7kmgdMxB3OpHqXb00BfK2YKMGkqs5nT2fY/eY
	eWHpSc93ZFmmcvGZCnnflepd1mqfBGnHHrqBfZn6NGQuFiAf+GisF16tQFs1LCE8DH9lIXzQn59
	F2wC6AqQUp53t4lfyHjCt6FqBPFva8wBRmwgMxfa3To64w3WQi/sB0IFenwf4cEQlOj4rQfCFk5
	xLb66KLWAp8om5hxHo=
X-Received: by 2002:a05:600c:a11:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-4888355e7cfmr145427425e9.6.1775141488931;
        Thu, 02 Apr 2026 07:51:28 -0700 (PDT)
Received: from bell.fritz.box (p200300faaf260200051aef03a698a1fc.dip0.t-ipconnect.de. [2003:fa:af26:200:51a:ef03:a698:a1fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c637asm8122938f8f.14.2026.04.02.07.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:51:28 -0700 (PDT)
From: Mathias Krause <minipli@grsecurity.net>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org
Cc: Mathias Krause <minipli@grsecurity.net>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: builddeb - avoid recompiles for non-cross-compiles
Date: Thu,  2 Apr 2026 16:51:16 +0200
Message-ID: <20260402145116.1010901-1-minipli@grsecurity.net>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[grsecurity.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[grsecurity.net:s=grsec];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12614-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minipli@grsecurity.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[grsecurity.net:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,grsecurity.net:dkim,grsecurity.net:email,grsecurity.net:mid]
X-Rspamd-Queue-Id: 16C4238ADB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit e2c318225ac1 ("kbuild: deb-pkg: add
pkg.linux-upstream.nokernelheaders build profile") changed how
install-extmod-build gets called, making it always rebuild the host
programs below scripts/ if HOSTCC wasn't specified with its full triplet
on the make command line. That is, apparently, needed to fix up commit
f1d87664b82a ("kbuild: cross-compile linux-headers package when
possible") for cross-compiles. However, in the much more common case of
non-cross-compile builds this will lead to unnecessary rebuilding of
host tools including gcc plugins. This, in turn, will lead to a full
kernel rebuild on the next 'make bindeb-pkg' which is unfortunate.

Avoid that by only triggering the rebuild of host tools for actual
cross-compile builds.

Signed-off-by: Mathias Krause <minipli@grsecurity.net>
Fixes: e2c318225ac1 ("kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile")
Cc: Masahiro Yamada <masahiroy@kernel.org>
---
 scripts/package/builddeb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 3627ca227e5a..ba1defc61652 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -139,7 +139,13 @@ install_kernel_headers () {
 	pdir=debian/$1
 	version=${1#linux-headers-}
 
-	CC="${DEB_HOST_GNU_TYPE}-gcc" "${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
+	# Override $CC only for cross-compiles, to not unnecessarily rebuild
+	# scripts/ including plugins, which may lead to a full kernel rebuild.
+	if [ -n "${CROSS_COMPILE}" ]; then
+		CC="${DEB_HOST_GNU_TYPE}-gcc" "${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
+	else
+		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
+	fi
 
 	mkdir -p $pdir/lib/modules/$version/
 	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
-- 
2.47.3


