Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6F92B5D4F
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 11:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbgKQKxy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 05:53:54 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:26613 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgKQKxy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 05:53:54 -0500
X-Greylist: delayed 361 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Nov 2020 05:53:54 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1605610433;
        s=strato-dkim-0002; d=aepfle.de;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=Hy8/WHGPlWpK/qYWNrXSgIdTBb+Qpp2vuw7CzzqM770=;
        b=spRnsivtKDPzElKhfxI1YAh211VwE555oj1HeVf5u+ujq5TiywzEHnR2drUo0FjsQn
        W90r8WAThVA+ut7F1oMC3RgctMeIDPk5bC/Z8dXiuEQY8ihpbi1vlkGzsxHtoI3jxN0P
        ZKa1DgjmvvU4rtCoc1hOPY0XoVUHfXeUUdsflUaVjH8GlTzB0QPfhnTFdf+eqCnS6lBp
        5b9RDNcb6ACy90oZ8jQk4D+t2WbfGASsg7eUqqSySNlYgjpDVlWHfUVLAVNt4PNQL05H
        9gAo6ExdKgHfE71oSMziCJDKPJVifwk8MXckdDW63aby+W6RN9LMe5uhbijfz//QaXf1
        Nt1w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS32xIjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id V0b6ccwAHAlfTEF
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 17 Nov 2020 11:47:41 +0100 (CET)
From:   Olaf Hering <olaf@aepfle.de>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Olaf Hering <olaf@aepfle.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v1] kbuild: enforce -Werror=unused-result
Date:   Tue, 17 Nov 2020 11:47:35 +0100
Message-Id: <20201117104736.24997-1-olaf@aepfle.de>
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
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e2c3f65c4721..c7f9acffad42 100644
--- a/Makefile
+++ b/Makefile
@@ -497,7 +497,7 @@ KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS   := -Wall -Wundef -Werror=strict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE \
 		   -Werror=implicit-function-declaration -Werror=implicit-int \
-		   -Werror=return-type -Wno-format-security \
+		   -Werror=return-type -Werror=unused-result -Wno-format-security \
 		   -std=gnu89
 KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_AFLAGS_KERNEL :=
