Return-Path: <linux-kbuild+bounces-7090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF00AB3D24
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 18:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2332B1892A2C
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 May 2025 16:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A0324E01D;
	Mon, 12 May 2025 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lxm.se header.i=@lxm.se header.b="4YraQ8qL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78424DFF3
	for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 16:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.3.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066270; cv=none; b=ab463NZ5sC0xo9qyIajqcXlkhlqlXp6n0Irqk3o3p7vO9Nc/9k+WiUORMkroEPx4O1Zu8vU8B+0v3YkbG7lgQxZvdMi9B45Ew65Mjf4nKI8sGzNYMimZcXD4x+r0//IAP5Vx0RhyzJVoCbl6GPOQQEHOMzKJ/cSaZkxNjkRl5tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066270; c=relaxed/simple;
	bh=RQRyODuNr0D4NNmwjC0Zwm0i4yTKTVuUH6f8SMYkgxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=e0RJKzp5Pmw8z14pAY5z8xKyeAF6xu6284quOkMB5JBk6D6tWhfyTxbqXafqKuRpqlVGvG5asNGjum/NY1LSGh3nl8VVKFUyVjOEkzpfA4rH3He+0zC7rolNnQk1pcfuuVQfUDGtovNbsCTYijYDuQzGtT87hz+51MQOxeLM0DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lxm.se; spf=pass smtp.mailfrom=lxm.se; dkim=pass (2048-bit key) header.d=lxm.se header.i=@lxm.se header.b=4YraQ8qL; arc=none smtp.client-ip=93.188.3.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lxm.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lxm.se
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id D31E739951D
	for <linux-kbuild@vger.kernel.org>; Mon, 12 May 2025 18:10:59 +0200 (CEST)
Received: from s899.loopia.se (unknown [172.22.191.6])
	by s807.loopia.se (Postfix) with ESMTP id BF97E39971C;
	Mon, 12 May 2025 18:10:59 +0200 (CEST)
Received: from s473.loopia.se (unknown [172.22.191.5])
	by s899.loopia.se (Postfix) with ESMTP id BCEE82C8BAB3;
	Mon, 12 May 2025 18:10:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Authentication-Results: s473.loopia.se (amavisd-new); dkim=pass (2048-bit key)
 header.d=lxm.se
Received: from s979.loopia.se ([172.22.191.6])
 by s473.loopia.se (s473.loopia.se [172.22.190.13]) (amavisd-new, port 10024)
 with UTF8LMTP id 3qEctYUmI_On; Mon, 12 May 2025 18:10:59 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: henrik@lxm.se
X-Loopia-Originating-IP: 92.35.16.29
Received: from pc.arpa.home (c-92-35-16-29.bbcust.telenor.se [92.35.16.29])
	(Authenticated sender: henrik@lxm.se)
	by s979.loopia.se (Postfix) with ESMTPSA id 433BB10BC4C8;
	Mon, 12 May 2025 18:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lxm.se;
	s=loopiadkim1708025221; t=1747066259;
	bh=rVNVIZR6jhzRzell4N/9BD6EuMsEHhSNV4xvFIzSOec=;
	h=From:To:Cc:Subject:Date;
	b=4YraQ8qLVcRkYknOG0mt5BMYEUJeYXFGI7WRKh523EzG00w3LOFB1ZFwhGgadjgHx
	 vc2Nd7pInNvR5dpHyWaIY2lNoOfdSsolPJlbZrHKPbtUhp12+YMfS8RWy/LrDQuWft
	 lngiyFtrqLaQMYBTvuyCB086P+Zd0Fwphk7Z4Zr5XuZ4rNL/SFjm55TZ9+ExCfHqMO
	 F/gW4hvCM1JGu5CMbTRZuil4ewZ39iVnQv56e2UN8aFX8TIYpujX18wv53TiUgKZqo
	 ZRzZAadpGwt9ovL4S6mrR4DVLwC5aSisHER5/czvxjdcZD7PjOLt23IaIhHbybckcO
	 NrW1+k263T8DQ==
From: =?UTF-8?q?Henrik=20Lindstr=C3=B6m?= <henrik@lxm.se>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Henrik=20Lindstr=C3=B6m?= <henrik@lxm.se>
Subject: [PATCH v2] Makefile: remove dependency on archscripts for header installation
Date: Mon, 12 May 2025 18:10:06 +0200
Message-Id: <20250512161006.7787-1-henrik@lxm.se>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

archscripts has nothing to do with headers_install.

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


