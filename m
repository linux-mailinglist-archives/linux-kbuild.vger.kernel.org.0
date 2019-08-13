Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F578C0D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 20:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbfHMSi1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 14:38:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35768 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726295AbfHMSi0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 14:38:26 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B10212064A;
        Tue, 13 Aug 2019 18:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565721505;
        bh=e5qRrT3DFaqR3AvlWF6Q+ezhwd04lesrdhcTIbRJY0o=;
        h=From:To:Cc:Subject:Date:From;
        b=KImMVCTm2AafHdnUNYJ9siC/jp8uJ3nl6xtNWuAcx3qwrDXhHPrUKAYS3Y++0+PfF
         b5S6pI9hyiwv6eJEPMeBMCCBhk/kwqKpTTAZHbbxH2n0ml4sVH8r66xTRX3cUg2fCf
         c7IDpUYEDrPDCtDUjgDlw2rQNcMPROOsWqaqPX+M=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH] devicetree: Expose dtbs_check and dt_binding_check some more
Date:   Tue, 13 Aug 2019 11:38:25 -0700
Message-Id: <20190813183825.9605-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It wasn't obvious that this was a command to run based on 'make help',
so add it to the top-level help for devicetree builds. Also, add an
example to the documentation to show that db_binding_check can be run
with DT_SCHEMA_FILES= to only check one schema file instead of all of
them.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: <linux-kbuild@vger.kernel.org>
Cc: <devicetree@vger.kernel.org>
Cc: <linux-doc@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---

I didn't find this sent, so sending again!

 Documentation/devicetree/writing-schema.md | 1 +
 Makefile                                   | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/writing-schema.md b/Documentation/devicetree/writing-schema.md
index dc032db36262..17ad67887fde 100644
--- a/Documentation/devicetree/writing-schema.md
+++ b/Documentation/devicetree/writing-schema.md
@@ -120,6 +120,7 @@ This will first run the `dt_binding_check` which generates the processed schema.
 It is also possible to run checks with a single schema file by setting the
 'DT_SCHEMA_FILES' variable to a specific schema file.
 
+`make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/trivial-devices.yaml`
 `make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/trivial-devices.yaml`
 
 
diff --git a/Makefile b/Makefile
index 9be5834073f8..96bb28aa1c46 100644
--- a/Makefile
+++ b/Makefile
@@ -1503,8 +1503,10 @@ help:
 	@echo  ''
 	@$(if $(dtstree), \
 		echo 'Devicetree:'; \
-		echo '* dtbs            - Build device tree blobs for enabled boards'; \
-		echo '  dtbs_install    - Install dtbs to $(INSTALL_DTBS_PATH)'; \
+		echo '* dtbs             - Build device tree blobs for enabled boards'; \
+		echo '  dtbs_install     - Install dtbs to $(INSTALL_DTBS_PATH)'; \
+		echo '  dt_binding_check - Validate device tree binding documents'; \
+		echo '  dtbs_check       - Validate device tree source files';\
 		echo '')
 
 	@echo 'Userspace tools targets:'
-- 
Sent by a computer through tubes

