Return-Path: <linux-kbuild+bounces-6722-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB1FA96696
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 12:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18E3B189C2B5
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Apr 2025 10:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF02F20D51F;
	Tue, 22 Apr 2025 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XFW5uybK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A320CCC9;
	Tue, 22 Apr 2025 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745319338; cv=none; b=m1HPTYNF+wFaK5B1BWFIgim4cJiXyELvZLeFfjgrKWH525evnhXhLD8A8/SdRI+J+ALL+yZ8FH3OvMjv+ib6WbcRPSkX6SunpJUhSWBxDgib81sPiE/eynYWdd3wX0XW5VV6GKgizGXYzbbN98TQKN4k/U5GWOkW8vozDWqTdxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745319338; c=relaxed/simple;
	bh=H6B/LNi9Lw2EdZ+PMJUbrpuN1GGHt7wf9C5cOyHXv44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csxScqWVid6/PEQJX84wmkhD7yjA/ZS5aVepFfzsTZV4DD9dYUOV3xqw+Cd3PD5OGSti0kqbGXhd6Wg6RojuxUGrNoS+admCwKufJsiLnJ9sWiMAfYTQibZKrZMR3wi1Lzg210QoSc9g1wMjppvzVnq7puHVXZeDKPeir1W6sGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XFW5uybK; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745319297;
	bh=uD57WdS9tns5/9hKZ1o0HyNywAO6e71tUd0l2mx2sTU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XFW5uybKtTP/fmpVJ5uAksevtsJpICfWFiZLhsNoj4qdURZhEMZxDp7xnP4BblyLQ
	 Jt0GDIYLhT57/utAwEE1tHa4quzyOp6CVlHc7BDgDGRl7XV3ELuPBibSp8WFnqaLb4
	 PLxKMuB24kx0RqY+BN3ijVeWmIr1Osm5CmvwtLPc=
X-QQ-mid: zesmtpip2t1745319248t43ddaf76
X-QQ-Originating-IP: dFKMxt+BNwprxv8/aVmCdKiRp9WYbThVZ1EjuvjOXsY=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 18:54:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1616688773469971445
EX-QQ-RecipientCnt: 11
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: guanwentao@uniontech.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	niecheng1@uniontech.com,
	petr.pavlu@suse.com,
	samitolvanen@google.com,
	zhanjun@uniontech.com
Subject: [PATCH v3 1/2] kbuild: deb-pkg: Add libdw-dev:native to Build-Depends-Arch
Date: Tue, 22 Apr 2025 18:54:01 +0800
Message-ID: <70C0FECF7A9A7B62+20250422105402.145635-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com>
References: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MRw/zKT/0BpPMuPyGpuHpH72OmhcERvxLSZrFW8vAozhtnxq97/gL0AV
	CaEyvHd+KrTd6tD5YyRLHv84mRVE/RMDNLEnIS8VEErFEw+P2bySh0as8GdAtkclwAzLHUC
	0UHeYT3YB0ZImnmJ6+rBJd1/Vf5qR9fVey+8Fl7thN5t/DMquAX4eR5BoVpPSYrGINCzu7K
	XR18cp+abB5yTkA/R21JtQ6yQakynjME/nsMdVDCv+vpSW7yNsriMxiVKkiZStf2TaihkII
	MhUUBun0qzlrj6KHsXqBBQnmz13Us7JxoyrOB1WQEn/55jCGV5OlxgD1XaNfCGqeGwenPNp
	j/aw+UgcA9/RAViEaS3Sq176W8Pnnx63QMOntqpdyKPm2pXVk39RttIqVCPfm4EsudXO9Dv
	5OYpOs/DKPnDduFR1BmElBiApqlcC47JCx6whvW2GeWaiDXyaFX+ma9ttarClc+A2jDAFpo
	ccB2eCnQ4BpldSOwgdVV7gDTmOlHApdGlb+U7i3zwNIs7kgdLoodA6MYu9IK2tKSOJnZ9dB
	j2itMv43RFtXBhomGAaWWe6fp3YrsUvVUUgdLF7Yo0iGYuLb87dtvj50NozPX2sZWASPjj/
	WnTtpI5lYr+6yI96cW9EV9vtCni3GdRwmb4G2GYQUGD2heMaFtayLlHkhfuy1XUCJWdeZkO
	nMWtH++4+M6sATsFyGMJsiO61f0QLpIShP/zb31Urf/Jr9Mtu7U9Cs8dI5AqZIgoQBD8DO+
	8hy3kRU6H66EpTTsLLcV3ZWcH4N+IYyvng/cIGtxpJhHjB7fwbNjbMgaAOAW/8CCuupeAlP
	SwFj1BA6CG5gzs5M+WWO6ED1IXeSMEFQxfBPrjfRvW+EvJoWHkFfwaEe1BRY6qrZKBSd3tB
	jiw0qd+bs3NErAw+z/uP0xCtXyC8Z2VFrk1DjvC6Riez12oOcDpsCFfK4JST/Qrt3b/+pev
	j85P670rSpPoy7RIMOXDTV29Ulmmv9Bx5oxhpO24uv+Sw+KXELWQD30ufFA3dapdNc2773N
	lepNNSfwN3Qfwa82XHtKLYc+whTBLxu80HWmq1Tq545VJokuvxwFygwbv01eBxMZBKAwcaq
	wpvSQZNcAYoQ26Oakd3G6k=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

The dwarf.h header, which is included by
scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
package.

This portion of the code is compiled under the condition that
CONFIG_GENDWARFKSYMS is enabled.

Consequently, add libdw-dev to Build-Depends-Arch to prevent
unforeseen compilation failures.

Fix follow possible error:
  In file included from scripts/gendwarfksyms/symbols.c:6:
  scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
      6 | #include <dwarf.h>
        |          ^~~~~~~~~

Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/package/mkdebian | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 744ddba01d93..d4b007b38a47 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -210,7 +210,7 @@ Rules-Requires-Root: no
 Build-Depends: debhelper-compat (= 12)
 Build-Depends-Arch: bc, bison, flex,
  gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
- kmod, libelf-dev:native,
+ kmod, libdw-dev:native, libelf-dev:native,
  libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
  python3:native, rsync
 Homepage: https://www.kernel.org/
-- 
2.49.0


