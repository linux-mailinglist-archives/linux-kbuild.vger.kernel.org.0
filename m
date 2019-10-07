Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06057CDB1C
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2019 06:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbfJGEhC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Oct 2019 00:37:02 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:27824 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfJGEhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 00:37:02 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x974aGu4005037;
        Mon, 7 Oct 2019 13:36:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x974aGu4005037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570422977;
        bh=9zS2kiZ0aonbgklY7VJR/3auMJ79kULynEoV6u5gXu8=;
        h=From:To:Cc:Subject:Date:From;
        b=X9DSPAMmfrMfjqLY943MtrqsF2TF56THsox9uJuCMzHjI0C6ouVr/Ml13c3Co55Ag
         lpga6L7mh+Avb+4G6IrSqBQL+ueIDSgIXjWthvV3JLWIHmQj+YOCvPhPxgdvo4ZaXt
         6hIXXThkb3M7q5x2O8cV4c0YsAAh3La9+Tt1Db+Re9QnHr7utMiE4ySD8QfPjGHJMp
         fwkfFSdelbwNFIry2V09mzYhrpRYofsqCAR5N/RU4YjNVWe2A37jclIpMbuJoHPH1a
         0iHhyBVUZlyTgiCyoL79+qGjLYLE3MDqYUl5eqyTTtulHxnuMe18g0DCtZgA0H/g0a
         VtxTCL3QVbUPg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Adam Zerella <adam.zerella@gmail.com>,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] doc: move namespaces.rst out of kbuild directory
Date:   Mon,  7 Oct 2019 13:36:11 +0900
Message-Id: <20191007043611.31036-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I did not notice this document was added to Documentation/kbuild/,
and I do not understand how it is related to the build system.

Kick it out of the kbuild directory.

I am not sure if this is the perfect place, but I added its index
close to the module-signing.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/admin-guide/index.rst                  | 1 +
 Documentation/{kbuild => admin-guide}/namespaces.rst | 0
 MAINTAINERS                                          | 1 +
 3 files changed, 2 insertions(+)
 rename Documentation/{kbuild => admin-guide}/namespaces.rst (100%)

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 34cc20ee7f3a..ca632fda700f 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -65,6 +65,7 @@ configure specific aspects of kernel behavior to your liking.
    parport
    md
    module-signing
+   namespaces
    rapidio
    sysrq
    unicode
diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/admin-guide/namespaces.rst
similarity index 100%
rename from Documentation/kbuild/namespaces.rst
rename to Documentation/admin-guide/namespaces.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 55199ef7fa74..91815dcc5914 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11547,6 +11547,7 @@ NSDEPS
 M:	Matthias Maennich <maennich@google.com>
 S:	Maintained
 F:	scripts/nsdeps
+F:	Documentation/admin-guide/namespaces.rst
 
 NTB AMD DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
-- 
2.17.1

