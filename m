Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE1C47B129
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Dec 2021 17:36:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhLTQg4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Dec 2021 11:36:56 -0500
Received: from smtpout140.security-mail.net ([85.31.212.145]:47785 "EHLO
        fx405.security-mail.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S232898AbhLTQgz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Dec 2021 11:36:55 -0500
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Dec 2021 11:36:55 EST
Received: from localhost (localhost [127.0.0.1])
        by fx405.security-mail.net (Postfix) with ESMTP id 2FE22323912
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Dec 2021 17:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
        s=sec-sig-email; t=1640017771;
        bh=rCIBWYgxS7BYkjTjNFzi/rHvsMItvwZa/KUBaA6h/Y0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=kDq4sjqFQbEmcAsZE1dO/6UFGyHUA+VzYpQovPajmKBIUUVv8bQzl8WFH7UJ0qSdM
         pZqizD46oCoKk/gkUfhojI8l31NoC2bseeF41swiDWMD5S2oQg/HrqGwdm4w/i3Liw
         TsCIkACZ5dffsHwBTNIqv7rTmbJAjCqAEcxGbIjo=
Received: from fx405 (localhost [127.0.0.1])
        by fx405.security-mail.net (Postfix) with ESMTP id E370C323926;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <a374.61c0af6a.a4ea2.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by fx405.security-mail.net (Postfix) with ESMTPS id A5C643238B3;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTPS id 8B7A127E03C3;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 7505527E03C9;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 7505527E03C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1640017770;
        bh=H7VMKS0VCiHe/014VCYe+6GYKOV+DO05C08hNuv2qho=;
        h=From:To:Date:Message-Id;
        b=ggi/eTiIPnntq8hZ0Podq2zspP3ydbklqinD0QHMAYVCy2hUgIIHYn9iLuVXtX4Cb
         zsyN9pUDUru8gxZsjADvjU9OCJXKqEHSR9yYYz+7kWL5C54sWiKwV7J5WMqDlKQjEw
         LufWFC13iA3DNgNHiHt76NJdWlxPWta+h5ihRAvs=
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id MIlOTQ3U7_TI; Mon, 20 Dec 2021 17:29:30 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 5D55B27E03B6;
        Mon, 20 Dec 2021 17:29:30 +0100 (CET)
From:   Yann Sionneau <ysionneau@kalray.eu>
To:     linux-kbuild@vger.kernel.org
Cc:     ysionneau@kalray.eu, robh@kernel.org
Subject: [PATCH 1/1] Use target CPP to pre-process dts as supported flag checks are done on target toolchain
Date:   Mon, 20 Dec 2021 17:29:25 +0100
Message-Id: <20211220162925.14441-2-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211220162925.14441-1-ysionneau@kalray.eu>
References: <20211220162925.14441-1-ysionneau@kalray.eu>
X-Virus-Scanned: by Secumail
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If some flag is not supported by host toolchain but is supported by target toolchain, then
using host toolchain will fail here because the checks are only done on target toolchain.

Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---
 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 94133708889d..1d11b7a23957 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -316,7 +316,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
 	$(call if_changed,dt_S_dtb)
 
 quiet_cmd_dtc = DTC     $@
-cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
+cmd_dtc = $(CC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
 	$(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
 		$(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
-- 
2.17.1

