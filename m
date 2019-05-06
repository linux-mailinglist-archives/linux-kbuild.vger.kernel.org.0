Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D15414A21
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 May 2019 14:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfEFMrF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 May 2019 08:47:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:33114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726094AbfEFMrF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 08:47:05 -0400
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 144072087F;
        Mon,  6 May 2019 12:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557146825;
        bh=lkMURuHPmndHsKv/xNRxkM36nmz+UNgv58V2CbK3ODE=;
        h=From:To:Cc:Subject:Date:From;
        b=Pu7OiE9CvOhqYMLBmN/bJXiwSlntZ5MH7N/HYxkZsSDaqZigAAgLX5XTLtfi69+gi
         xZeZQZO2QAMzh6BXLk+oZ72uCwLpJcQr9NPolIWAfKgV53apgi/gayl/sEJ1av6OGM
         UdTXrUiAw8++DqJtnDj3NKddGoS2C+Xq2pnAoUaI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] MAINTAINERS: kbuild: Add pattern for scripts/*vmlinux*
Date:   Mon,  6 May 2019 14:47:00 +0200
Message-Id: <1557146820-13059-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/link-vmlinux.sh is part of kbuild so extend the pattern to match
any vmlinux related scripts.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c61c49dd3643..aa0a61c7736b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8523,6 +8523,7 @@ F:	scripts/Kbuild*
 F:	scripts/Makefile*
 F:	scripts/basic/
 F:	scripts/mk*
+F:	scripts/*vmlinux*
 F:	scripts/mod/
 F:	scripts/package/
 
-- 
2.7.4

