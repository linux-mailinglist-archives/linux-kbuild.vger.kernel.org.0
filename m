Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8132833F0
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Oct 2020 12:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgJEKWm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Oct 2020 06:22:42 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:21254 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEKWm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Oct 2020 06:22:42 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Oct 2020 06:22:42 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1601893361;
        s=strato-dkim-0002; d=aepfle.de;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=KC64h9Wjos6xET3WvOm4lJYRQC6864ZNKSLmRbyaOD0=;
        b=gWCJmJyB/yV1bi7Dr86XfLy9uAWJusnR1VreJCCtVWwE/xfCIOdzL0suaWBfCBq+Ne
        QRr82lgQ2v6Z1pJl28gWZAhvVdr4NR8uRQTHiLLJ0xeQPD5aSOIuxdtXGBHcGokNXmTg
        gD6+51eWes4CcNmKl0PFqR/Zo+3DscF2qNJM4bbx3WZoXunlWFG47cF88gafUcwMuhmx
        6kj+ztey2X6qd38o6aiz6u9ySlq2ne2KcqwReZBEmOfuuM9AUslDwwU6AVqNU2sacr5c
        MGYwPZ9jiykLAnjzIKpvy+Ykw6LjDyMUz9Od4rgZUbIGvS4Gxdh87d1trzKslX/dnYY/
        MptQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G5Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
        by smtp.strato.de (RZmta 47.2.1 DYNA|AUTH)
        with ESMTPSA id e003b5w95AAeAb5
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 5 Oct 2020 12:10:40 +0200 (CEST)
From:   Olaf Hering <olaf@aepfle.de>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Olaf Hering <olaf@aepfle.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v1] kbuild: enforce -Werror=return-type
Date:   Mon,  5 Oct 2020 12:10:26 +0200
Message-Id: <20201005101026.21951-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Catch errors which at least gcc tolerates by default:
 warning: 'return' with no value, in function returning non-void [-Wreturn-type]

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index f84d7e4ca0be..7b2e63e7be18 100644
--- a/Makefile
+++ b/Makefile
@@ -942,6 +942,9 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
 # enforce correct pointer usage
 KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 
+# enforce correct return type
+KBUILD_CFLAGS   += $(call cc-option,-Werror=return-type)
+
 # Require designated initializers for all marked structures
 KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
 
