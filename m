Return-Path: <linux-kbuild+bounces-7069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3DAAB2473
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 May 2025 17:40:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 270F017D90F
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 May 2025 15:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E0122D4D4;
	Sat, 10 May 2025 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lxm.se header.i=@lxm.se header.b="PptzLYqb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1B4B1E57
	for <linux-kbuild@vger.kernel.org>; Sat, 10 May 2025 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.3.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746891638; cv=none; b=TCIgwXWNqsM3DahFZaM90C0xioMlLCNdclARxg1W2PxO+KfPv1lyqweXGZg/3NGBRT8B9tCp5bXsZEc/mzw5PIJsjCjfNGCT5WWVGeFOJ5sbm29//zuqTVJX5oLV2RILLzs2ln4vEby718DZiyrrwQKWKpB8wlXfQHoufI8LxT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746891638; c=relaxed/simple;
	bh=KQnU/8biptC1lyMJGcNts0DIV/7C76t6ScF3y+7ePT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=lkhkmjbhgJOXeWBU91Xm4YlRYiTLbkCI46n+Jgkl2iI7uoWBIc7Q/Uqq22zqdc2Ao2vzgv6W4VCzEndZZ0lnJpSyhkIoguuOEcXdkpOZ7dJyeHLLsV+VtGFvXMAtZ302dbAOHi3ozzJk0Ie3TyM0Rjb87HeNpXM1a472y9TX4F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lxm.se; spf=pass smtp.mailfrom=lxm.se; dkim=pass (2048-bit key) header.d=lxm.se header.i=@lxm.se header.b=PptzLYqb; arc=none smtp.client-ip=93.188.3.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lxm.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lxm.se
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id 5B412328922
	for <linux-kbuild@vger.kernel.org>; Sat, 10 May 2025 17:33:51 +0200 (CEST)
Received: from s934.loopia.se (unknown [172.22.191.6])
	by s807.loopia.se (Postfix) with ESMTP id 40F62326E58;
	Sat, 10 May 2025 17:33:51 +0200 (CEST)
Received: from s474.loopia.se (unknown [172.22.191.5])
	by s934.loopia.se (Postfix) with ESMTP id 37AE27CE9FA;
	Sat, 10 May 2025 17:33:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Authentication-Results: s474.loopia.se (amavisd-new); dkim=pass (2048-bit key)
 header.d=lxm.se
Received: from s979.loopia.se ([172.22.191.6])
 by s474.loopia.se (s474.loopia.se [172.22.190.14]) (amavisd-new, port 10024)
 with LMTP id vG2lrLdINikH; Sat, 10 May 2025 17:33:50 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: henrik@lxm.se
X-Loopia-Originating-IP: 92.35.16.29
Received: from pc.arpa.home (c-92-35-16-29.bbcust.telenor.se [92.35.16.29])
	(Authenticated sender: henrik@lxm.se)
	by s979.loopia.se (Postfix) with ESMTPSA id 9AE1410BC394;
	Sat, 10 May 2025 17:33:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lxm.se;
	s=loopiadkim1708025221; t=1746891230;
	bh=dGzqMlkGrM/RG1QWaZUTpamCo8a7h4gI2wxn4xA3pJw=;
	h=From:To:Cc:Subject:Date;
	b=PptzLYqbrSG951A+OIcWhz7KaS6qGgb4EiULRKlRyYTYZDU7MjrJJCuzgBEDnYxiP
	 b0/iZivq3HMEFzYOb8KOQDFybbY6/9/w1A9rxWs0bmvIV35+d8s4vlBBN/wnbbjs8o
	 Ve7yzFLJ+PCYwmOck3+gFcNd94Da+7yWbeRpzPpCxJMCL2RlVP2WOTtbyjjMnCOZOh
	 uc/JbGSq+dWUwXoUiNDjxpY/ROYAJAAwdXULOOgthaUgvI1LdCuQYZw2QXrWkvFJJL
	 hb+hyu8QMVmkAva54vfMJMjoCOsWWp1XNZTzxC35X83/1AdqDiuA5rQrf05wUhCrJW
	 IOuboXLs15GaA==
From: =?UTF-8?q?Henrik=20Lindstr=C3=B6m?= <henrik@lxm.se>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Henrik=20Lindstr=C3=B6m?= <henrik@lxm.se>
Subject: [PATCH] Makefile: remove dependency on archscripts for header installation
Date: Sat, 10 May 2025 17:32:04 +0200
Message-Id: <20250510153204.11052-1-henrik@lxm.se>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There doesn't seem to be any purpose behind this dependency, and it prevents
installing x86 and mips headers on non Linux systems. Doing so is useful when
building a cross compiler targetting Linux, which requires the header files.

Signed-off-by: Henrik Lindström <henrik@lxm.se>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b29cc321ffd9..0234faafe8f0 100644
--- a/Makefile
+++ b/Makefile
@@ -1366,7 +1366,7 @@ PHONY += archheaders archscripts
 hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
 
 PHONY += headers
-headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
+headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders
 ifdef HEADER_ARCH
 	$(Q)$(MAKE) -f $(srctree)/Makefile HEADER_ARCH= SRCARCH=$(HEADER_ARCH) headers
 else
-- 
2.39.5


