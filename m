Return-Path: <linux-kbuild+bounces-2123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4B190843B
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 09:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145181F23741
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 07:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DC11474B5;
	Fri, 14 Jun 2024 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TQ8oKK6L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA820317;
	Fri, 14 Jun 2024 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349327; cv=none; b=Plbkv994v7vCqPUB0pvJejsNXWYgSm+JKEfsTatbkmMQvGe97kcWk8NWBbStM+BDJG0waku6c+LL1FJhmwb2yS7eClYjmlV/vAtOSYL+hqCsrXCh9Zop2drokitlUFK2VDjGHNDvVrM0Wp1aym2muzacYkBMMw9od3OAIMOVloY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349327; c=relaxed/simple;
	bh=v5AMpN5DYyM3f+Xn84fM+3GMWQHLMCXOB6gjmmA7s24=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rRMvmQkkYRAH3K2Y1lxsLWmlJHBA0AhdF4VRsMqM5oJm6soR3N6KvFhylmhqnrsSfzh7RRH+Krv1omGhStpJjNo7WG4dK9fcsgj8XVN5xXKR6YTqFnnUNUsPzvhaqHPAr4YlDwf0/0rL4iI+8N3+b/tjE5rpSpju1JP/NL8qgas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TQ8oKK6L; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: dc4a37d22a1d11efa54bbfbb386b949c-20240614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tfh75ueWVlJEBbGX4eUx02SwpuikQxjyrP+FXeiLmzA=;
	b=TQ8oKK6LlxcocHVmcOEI/yQwV9APQgc+MtQeCBLazXYLzWRBgSSa3WVUT7rXvLF+8Ujs1LRPp/ncLtcwz9CuTzsiGWhnwaxfAsqTLADrzddOz3Lp+JKbi8Hq6lX4+hFVTRgJhlUnZtFvZhLWYuBsrPNZK33gkGe+EQBU/axwF5I=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:77a28801-640e-4f6c-b9d5-89c618b5d2d8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:ed579244-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: dc4a37d22a1d11efa54bbfbb386b949c-20240614
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587594635; Fri, 14 Jun 2024 15:15:21 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 14 Jun 2024 00:15:20 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 14 Jun 2024 15:15:20 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet
	<corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, <mark-pk.tsai@mediatek.com>,
	<linux-kbuild@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] kbuild: doc: Update default INSTALL_MOD_DIR from extra to updates
Date: Fri, 14 Jun 2024 15:15:02 +0800
Message-ID: <20240614071507.11359-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

The default INSTALL_MOD_DIR was changed from 'extra' to
'updates' in commit b74d7bb7ca24 ("kbuild: Modify default
INSTALL_MOD_DIR from extra to updates").

This commit updates the documentation to align with the
latest kernel.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 Documentation/kbuild/modules.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a1f3eb7a43e2..131863142cbb 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -128,7 +128,7 @@ executed to make module versioning work.
 
 	modules_install
 		Install the external module(s). The default location is
-		/lib/modules/<kernel_release>/extra/, but a prefix may
+		/lib/modules/<kernel_release>/updates/, but a prefix may
 		be added with INSTALL_MOD_PATH (discussed in section 5).
 
 	clean
@@ -417,7 +417,7 @@ directory:
 
 And external modules are installed in:
 
-	/lib/modules/$(KERNELRELEASE)/extra/
+	/lib/modules/$(KERNELRELEASE)/updates/
 
 5.1 INSTALL_MOD_PATH
 --------------------
@@ -438,10 +438,10 @@ And external modules are installed in:
 -------------------
 
 	External modules are by default installed to a directory under
-	/lib/modules/$(KERNELRELEASE)/extra/, but you may wish to
+	/lib/modules/$(KERNELRELEASE)/updates/, but you may wish to
 	locate modules for a specific functionality in a separate
 	directory. For this purpose, use INSTALL_MOD_DIR to specify an
-	alternative name to "extra."::
+	alternative name to "updates."::
 
 		$ make INSTALL_MOD_DIR=gandalf -C $KDIR \
 		       M=$PWD modules_install
-- 
2.18.0


