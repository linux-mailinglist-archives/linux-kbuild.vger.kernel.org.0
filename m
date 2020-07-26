Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6342822E2CD
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Jul 2020 23:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgGZVoc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 26 Jul 2020 17:44:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:57058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbgGZVoc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 26 Jul 2020 17:44:32 -0400
Received: from localhost (p5486c93f.dip0.t-ipconnect.de [84.134.201.63])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98742206E3;
        Sun, 26 Jul 2020 21:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595799872;
        bh=SZMIr6muQdPJOFU/cgQ96LByk+Rc1qbotY7+Hc+iyA8=;
        h=From:To:Cc:Subject:Date:From;
        b=NOxh0GXk7jQUDzUFug/IX15KccdyjJgJ2UDPira8qcFvk9PlrzpnhkTm6b+M6igfB
         R2C9NAtvMW0qmPWsUS0dVw+SH1zZwvsh2vLpP9bJEnK1MFRShklN47JIwbkGzUJySX
         QCd5qO9TQy+S49ShpvMirWvlLB8Yu8H40U8zC2es=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] modpost: explain why we can't use strsep
Date:   Sun, 26 Jul 2020 23:44:19 +0200
Message-Id: <20200726214419.3362-1-wsa@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Mention why we open-code strsep, so it is clear that it is intentional.

Fixes: 736bb11898ef ("modpost: remove use of non-standard strsep() in HOSTCC code")
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 scripts/mod/modpost.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 45f2ab2ec2d4..69341b36f271 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -144,6 +144,7 @@ char *get_line(char **stringp)
 	if (!orig || *orig == '\0')
 		return NULL;
 
+	/* don't use strsep here, it is not available everywhere */
 	next = strchr(orig, '\n');
 	if (next)
 		*next++ = '\0';
-- 
2.27.0

