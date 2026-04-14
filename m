Return-Path: <linux-kbuild+bounces-12786-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCJMEAOs3mn5HAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12786-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 23:05:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DC33FE833
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 23:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD61C3014BBC
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Apr 2026 21:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8E23233E8;
	Tue, 14 Apr 2026 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.scylladb.com header.i=@lists.scylladb.com header.b="LzLfrVNT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2015E31B824
	for <linux-kbuild@vger.kernel.org>; Tue, 14 Apr 2026 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776200703; cv=none; b=QUxunTQqlHPXCuJTYV5fguOSRYw2mKlTHUZ4UZsNVGVnaayYEYGy/GCpvLCPF6Wx2crvvEN/yPwHGYb/N2h1jtnIi9Xkh/XnKrqsRjF19rDHZp9ecFskI7fqtuQL4NqQrhC1XZYNJWVIZSKGUFuDOjAiziaEgSKoSPzvz+FIj+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776200703; c=relaxed/simple;
	bh=COhLwxvRzBp0V7ukO6ZZ6NgbsU2n1j2K7jPkdO6Wsiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pnbLCjhrcmfQqPtV6YVZC64bOk1RdxnhdzmPTsxn1mPlfbXxge/iawbcfQAxNpghIdigSLhCEjaXqtvCnn5Bmj3i4wbv5QBMdzcYj7oCYerfhbE4DBJqymJspxC/7tyuIkNAQ0Ly+G8Co+ePpoQSrq5GxbFP3bFaVHEdg4ah7k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.scylladb.com; spf=pass smtp.mailfrom=scylladb.com; dkim=pass (2048-bit key) header.d=lists.scylladb.com header.i=@lists.scylladb.com header.b=LzLfrVNT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.scylladb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scylladb.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a29e6110so65570845e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Apr 2026 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lists.scylladb.com; s=google; t=1776200700; x=1776805500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ekb2hScv1WGfpLhXac4QHmgrVb+ehIjMyNdlW/lSC5s=;
        b=LzLfrVNTWkXrpklB94DGnyYRbRBkNeSM4nNXkL/mhNrazZJaD2KDga3iVrzR1Ced2j
         r4qAd52CkUqGlB0o+8znkXN7TUeqnr5qYDXhpmSQUotcuRAeMxdYYnxZFSHIkjkDyyri
         JPXalDNLIYs6Re4d+7ZyGOZ2JD9zMuQm83v2JwNcAo4fJPT5Ri8ibO1s+s0OGf/gL+Er
         Ta3jXARoajB/h6D9AeYbKxRKtMsCxn281DnozwUrNJF0e9OaCYccEfB/8p/QMFNbnnMS
         2nAtp2D8K2J+oRtXIJmd0tKsMWXqx2G6aHWedJ5jUjg5zGG5pGLYsLx5CEbG48fNf0lk
         MiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776200700; x=1776805500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ekb2hScv1WGfpLhXac4QHmgrVb+ehIjMyNdlW/lSC5s=;
        b=ORkk5v51NNPZimOeQ0GSJhAhIVCvKaH8hFANZbWr5pf3feu7xUuQAZjRqgC7PTA6Hl
         SXfr7znxo8IRmY6TCb4+t5CsdSgjxSpVlvaDOOBMqOYAB59oGtoBhItmTVPt3iyxpVwE
         jRfl1yiFwiOsnm6w0U1rDHCeHCjO+iG9AX5xkOk0/OM68blKfax+cAmyjk0xfCB1UIBF
         +uz3D6GbIwkmuEXrvuLM3A/WSU5Nwcir9rcAEJjBsnVRgVZz/d70I4KUVrZmWD8omt7m
         05laDW1oqWtwdlYI3j/ZXdoUHdh7dKLqPlNnOOdowME55jNaHNB9g7cVDFtU2uaIzagh
         i01Q==
X-Gm-Message-State: AOJu0YxDB3slMpwjdDPVWy8gVdulfDdZCfXucGm+bv6sAbDL+SG9tJtD
	nCmMCaJaB7I6tblULV5Pibhvpi0HOING2FwxtEXWTLfchHzV8SRSMUvZmix+ePw5b/D8frvURLP
	ZQ9sAukhjs3YqTNLMSLEu+4zbsG/S4q/A3NVTrmx687EmgsRL0MZOJp9iupt9B27wSoxtf2ZjOU
	1FO8kE3VW6h6PF+X15/RGKWVGH4Nx7mrZ/z+WXBNfByqjIg3a4WtVhWdnUJO6HXqygPak5wqDaY
	vcjR2M16uNyca2hDqx4/sgWGGm9q7P02BVwJdj3VsIsjPB8nQAYOKzr78uuh2riSA95WVQxSmeR
	Ub6h7Agp4oerNwfb1sE2mTg2FxP6fn1H9jnOUb8ffNmme5ZnJaDXnDWr8cAq9krBVg==
X-Gm-Gg: AeBDievEfeKsZLXvx0vxO19MfC/pgOK554SQ3r1sqoaL4olE46OJb2He4w9lpwrN0P5
	CHTpZ0AFE+tRz6FiyHIUa+k645zyht4tQAdK8lk5w8okmfhV95b8ul98C1BVoObi0Y5AkwQXLeb
	qWpfS9OOBsLQWH7poqYDmN3p4L4YcwBIns1fvhm67wx23Etf/rryHfvceqHWFX/qEHYAsLrYP0S
	e7TkzVq6Xb5UzvXIzFXP6DysQvHIBo7fu1bGjbtfPaDnMDeHuZ4OJhN1xJmSM4Yk4SwOAp7Wrzp
	0l8ujonfrQzv5qFi5CI6PzhiqrPeseXayeLXE3jUbD4epuelbmqfNyC14g1ksJ1MnRAY0VN0w00
	0bzjrDYu0AOV3T581hGQV80UhIpMzZsh465dmSDy+c9mTFVc5e55x7jdC+gNKhSvN1A4f8G/KL3
	EXtYo0YG80a4e3YfXuD2DLxAoYZKN7UwwV
X-Received: by 2002:a05:600c:608e:b0:488:a2ac:a336 with SMTP id 5b1f17b1804b1-488d688d2f0mr261945465e9.19.1776200700054;
        Tue, 14 Apr 2026 14:05:00 -0700 (PDT)
Received: from avi.scylladb.com ([77.137.21.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ee03898bsm74201435e9.11.2026.04.14.14.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:04:59 -0700 (PDT)
From: Avi Kivity <avi@lists.scylladb.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v1] kbuild: rpm-pkg: provide kernel{-devel}-uname-r
Date: Wed, 15 Apr 2026 00:04:57 +0300
Message-ID: <20260414210457.41675-1-avi@lists.scylladb.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: scylladb,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: scylla,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[lists.scylladb.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[lists.scylladb.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[lists.scylladb.com:+];
	TAGGED_FROM(0.00)[bounces-12786-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[avi@lists.scylladb.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2DC33FE833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Avi Kivity <avi@scylladb.com>

Fedora kernels provide, and the akmods external module build tools
expect, kernel-devel-uname-r virtual packages. To improve the life
of those who depend on akmods, do the same with the kernel's RPM
packages.

Assisted-by: OpenCode:claude-opus-4.6
Signed-off-by: Avi Kivity <avi@scylladb.com>
---
 scripts/package/kernel.spec | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index b3c956205af00..dcb04c1e7e8ef 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -13,10 +13,11 @@ Vendor: The Linux Community
 URL: https://www.kernel.org
 Source0: linux.tar.gz
 Source1: config
 Source2: diff.patch
 Provides: kernel-%{KERNELRELEASE}
+Provides: kernel-uname-r = %{KERNELRELEASE}
 BuildRequires: bc binutils bison dwarves
 BuildRequires: (elfutils-devel or libdw-devel)
 BuildRequires: (elfutils-libelf-devel or libelf-devel) flex
 BuildRequires: gcc make openssl openssl-devel perl python3 rsync
 
@@ -38,10 +39,11 @@ glibc package.
 %if %{with_devel}
 %package devel
 Summary: Development package for building kernel modules to match the %{version} kernel
 Group: System Environment/Kernel
 AutoReqProv: no
+Provides: kernel-devel-uname-r = %{KERNELRELEASE}
 %description -n kernel-devel
 This package provides kernel headers and makefiles sufficient to build modules
 against the %{version} kernel package.
 %endif
 
-- 
2.53.0


