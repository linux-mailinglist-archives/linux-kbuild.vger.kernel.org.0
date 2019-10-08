Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F22F8CF115
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2019 05:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbfJHDLs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Oct 2019 23:11:48 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:31574 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729536AbfJHDLs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 23:11:48 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x983AYQL004728;
        Tue, 8 Oct 2019 12:10:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x983AYQL004728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570504235;
        bh=AG4ExTv6VHlw3h/+9FrYXRCm3WD49M9U2lAW3xkyHFs=;
        h=From:To:Cc:Subject:Date:From;
        b=ZIJVWUrYAiYYyMAUSb67GEjn/1xztX0tiv5+TQFBoVwCHMGDA0iS/Gq4+bnElaUEQ
         zEteCz4yBsjIWnOExpIy3EtL5bMyqaCw9tj2NqZvX7smvXV1odfzwKS3WP99q8pIpw
         HIzdDi0IZAQQCLfGyOcrnUhcuIDT4q7Lkfzk5w6XarMCgI3e8kquUR95STGqpCS6BB
         19CpEtg2wFMbwRPdGL91upESuq5XO087LlpZeviKzuGbWb+erua75GMt7TTnyFaS78
         1uRzRMWMjG55YBNQfknVOXCy2r1UrXL5KSyql+SsDDXiaj7yRgvWvnrwsoRiCPIpS5
         c2AV68Up9rX3Q==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Adam Zerella <adam.zerella@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] doc: move namespaces.rst from kbuild/ to core-api/
Date:   Tue,  8 Oct 2019 12:10:09 +0900
Message-Id: <20191008031009.17364-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We discussed a better location for this file, and agreed that
core-api/ is a good fit. Rename it to symbol-namespaces.rst
for disambiguation, and also add it to index.rst and MAINTAINERS.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/core-api/index.rst                                 | 1 +
 .../{kbuild/namespaces.rst => core-api/symbol-namespaces.rst}    | 0
 MAINTAINERS                                                      | 1 +
 3 files changed, 2 insertions(+)
 rename Documentation/{kbuild/namespaces.rst => core-api/symbol-namespaces.rst} (100%)

diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index fa16a0538dcb..ab0eae1c153a 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -38,6 +38,7 @@ Core utilities
    protection-keys
    ../RCU/index
    gcc-plugins
+   symbol-namespaces
 
 
 Interfaces for kernel debugging
diff --git a/Documentation/kbuild/namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
similarity index 100%
rename from Documentation/kbuild/namespaces.rst
rename to Documentation/core-api/symbol-namespaces.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 55199ef7fa74..a0ca64057b0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11547,6 +11547,7 @@ NSDEPS
 M:	Matthias Maennich <maennich@google.com>
 S:	Maintained
 F:	scripts/nsdeps
+F:	Documentation/core-api/symbol-namespaces.rst
 
 NTB AMD DRIVER
 M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
-- 
2.17.1

