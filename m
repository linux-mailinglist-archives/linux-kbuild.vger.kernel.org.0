Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 614A323BDC
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2019 17:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387864AbfETPTA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 May 2019 11:19:00 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:35310 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388752AbfETPTA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 11:19:00 -0400
Received: by mail-it1-f195.google.com with SMTP id u186so23732696ith.0
        for <linux-kbuild@vger.kernel.org>; Mon, 20 May 2019 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8bDPOW4T9PERtlCKjJ2lAbrC2Btl/gUnBtJeF4+SdEo=;
        b=M2FGtec4qwOQA9nWt3yNJamKQbZ6wWHEdQ7BldBsOi2SLF2pp3o3HgjfWthzjXcrkt
         1Hs+/DfFdQxqw0ItBC68YwvtUHfxSDPNMNLezriKfz417YqyxPA0xE315PCzAR3zfJwq
         sD4QG6ggCau9zHe06mjOfQ/XeYTExSpjEdqb9EfyT8q9xhCfiXdOI7D/5lD6jYqoWhyC
         KCI0lBwpSXxLHBGlYkTxZ182lmZPVwPKZjKhBCHRAF5RLHL/2mIcGf0eGvTbEPMZTbFy
         lRnLGTe/ufItgUvJSnsswcjufkJZChaO2cCIaWAhfiTpiBkCBx5/xWGe0JLXpAVpwW/L
         XZBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8bDPOW4T9PERtlCKjJ2lAbrC2Btl/gUnBtJeF4+SdEo=;
        b=rLEDFBEJl4OafjR+0g11CapbehC6DOW/zLxG4gsp+tCl2wFq/4WHwYpyxjUMjNV/iz
         lXQB716DZxkPNFt6LYF6GoX7MO99MOeLZ9xGja4LlhSmAKWm4eue2GgU1AVmXJ30Vf1Y
         O4AjaHy/T7Wpm1tLpaey7yrBeEj8YcBaae7z/ENvuZCCXyVsTD5c6rgY0awEz9ynuFst
         7qCU5gOBjGCye2XPoXxk2BtoVCctDl6MOvKz7bDpC1JX9TptaqK3rxekklMJSRuZtAPj
         sYF/i5q1jb1LHibLiE8fdoxMeF4vgHR6ADCNS1sNe2PoR39SNAQen05XhzhltnsYstwC
         2b9A==
X-Gm-Message-State: APjAAAULi0wY7RMnfy8/mMX+Vb9YEetSS/Ye8LS/dH0gB+jeYgHzhmJY
        wppZ36JQy1JCkhlRKHD9EzgNgg==
X-Google-Smtp-Source: APXvYqxPeWPsR3qi08xbeYLoNXEOxhRXLPb6AbDnMWGKPpAWkaPEec6V+TrN28W/Fq0LTraaojid4w==
X-Received: by 2002:a05:660c:107:: with SMTP id w7mr11276557itj.59.1558365539219;
        Mon, 20 May 2019 08:18:59 -0700 (PDT)
Received: from localhost (c-75-72-120-115.hsd1.mn.comcast.net. [75.72.120.115])
        by smtp.gmail.com with ESMTPSA id s8sm5513436iot.55.2019.05.20.08.18.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 May 2019 08:18:58 -0700 (PDT)
From:   Dan Rue <dan.rue@linaro.org>
To:     dan.rue@linaro.org
Cc:     linux-kselftest@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: teach kselftest-merge to find nested config files
Date:   Mon, 20 May 2019 10:16:14 -0500
Message-Id: <20190520151614.19188-1-dan.rue@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Current implementation of kselftest-merge only finds config files that
are one level deep using `$(srctree)/tools/testing/selftests/*/config`.

Often, config files are added in nested directories, and do not get
picked up by kselftest-merge.

Use `find` to catch all config files under
`$(srctree)/tools/testing/selftests` instead.

Signed-off-by: Dan Rue <dan.rue@linaro.org>
---
 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index a45f84a7e811..e99e7f9484af 100644
--- a/Makefile
+++ b/Makefile
@@ -1228,9 +1228,8 @@ kselftest-clean:
 PHONY += kselftest-merge
 kselftest-merge:
 	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m $(objtree)/.config \
-		$(srctree)/tools/testing/selftests/*/config
+	$(Q)find $(srctree)/tools/testing/selftests -name config | \
+		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
 	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 # ---------------------------------------------------------------------------
-- 
2.21.0

