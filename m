Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D393341F8B
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Mar 2021 15:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhCSOfv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Mar 2021 10:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhCSOfj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Mar 2021 10:35:39 -0400
X-Greylist: delayed 176 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 19 Mar 2021 07:35:38 PDT
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:400:100::c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2D6C06174A;
        Fri, 19 Mar 2021 07:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616164356; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tt9djRckmK71ceD8HxV5dLDlWikC9DdjBxpoGbeq9pMIJ0rm1eoq+YVCyPInT32xwa
    ZvZ3xWn02XsE7rKL7Da/Cz+guwRNB3R4mKjKY1ijr0Q6TirFkM8jAtz1RiroCLo1k18R
    G8RxUyBzJbdcQj+qGbBCdot24WgnH6cJvV0kb8jTEk37C2RiGEolxOp10XdynoKjvTBv
    cv+HMjYFGcFUF5Zu/TczPUwFMda9aBUdc8AU9AMLfJLg8vutIowKhBWOdC2PvDgHfG6B
    RCF+wJd9ycJkvTTOxXt5lEHzZ3O/pjVRy5p3j2SUMQpNB+8g8jHtYLUDV3zjwd0tBgi/
    GF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1616164356;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=KGzxKbIHnQcvHgHKZ5DjQzsm3s5Xw/potfFZ/ejNYAA=;
    b=P98egNYLFg1dj3jULXXwdWAQEfBEA/nnKEMnRHz1NypI9WD7MYWQmN8DC8QNP3LxnA
    RJHAq1UMeQz4TR14PNjlgNlMLce6tEJ+e52iX12HDxKwDoA0VoGDwETkGiepZEc+gMoU
    gvL+l1PcjCB6xDvbxNj0LRQP+cKcScGJHjgc86zJZUirDHyWIqRFbPIbkCQELKKyocpX
    i0qAyO5R0Qwep4nnSNpRDdE7twL1Fjj9ppiY6KizYNcV002njjtBizoEWShhtbfYwC4q
    dtqm60H3A8FbyvDuLC1CFHD09QqA8HoK9AlHmZtpvTPgZe8ZWEFnG/uSAgbJDqqu+Ycl
    FQow==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1616164356;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=KGzxKbIHnQcvHgHKZ5DjQzsm3s5Xw/potfFZ/ejNYAA=;
    b=qljbFpCEOROWiklRPkBafoJhb/yxTF3aQ9CNnZM9xqwsMDhnxs+fSV1y/9UEdceZPJ
    uZHhZMvxgLn4jpALmXNffRle+a4Mi4xVBwyx3OxiLvLJC+mRj0+O8iXINQGZPWTYGA4q
    kKJ38XcFbNyjiIm2ft3eB1mbgVZp2+8omVzqBrtDnP/i1BRHOofgjY1bmB89w904nAfF
    xyxEPMbaycjHGJkxjti+hmGlbNzmIAjcZ+9fNIWtsiNp/zHrlyeJcqsMLEuVl9x4tI/7
    vjUJACzLmuGC2WB3YhugbcOFd2k3ucW5gVgneS43voWi9ZpO/s1NhGUY+BNicrQmntX6
    +FTA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS325Pjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
    by smtp.strato.de (RZmta 47.21.0 SBL|AUTH)
    with ESMTPSA id k0a44fx2JEWZB8P
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Mar 2021 15:32:35 +0100 (CET)
From:   Olaf Hering <olaf@aepfle.de>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Olaf Hering <olaf@aepfle.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2] kbuild: enforce -Werror=unused-result
Date:   Fri, 19 Mar 2021 15:32:31 +0100
Message-Id: <20210319143231.25500-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It is a hard error if a return value is ignored.
In case the return value has no meaning, remove the attribute.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
v2:
  resend

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a28bb374663d..9b7def6db494 100644
--- a/Makefile
+++ b/Makefile
@@ -495,7 +495,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror=implicit-function-declaration -Werror=implicit-int \
-		   -Werror=return-type -Wno-format-security \
+		   -Werror=return-type -Werror=unused-result -Wno-format-security \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_AFLAGS_KERNEL :=
