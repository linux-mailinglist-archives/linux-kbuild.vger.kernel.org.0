Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C0B405EE5
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 23:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348393AbhIIVco (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 17:32:44 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:41629 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347899AbhIIVcm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 17:32:42 -0400
Received: by mail-oi1-f175.google.com with SMTP id 6so4448559oiy.8;
        Thu, 09 Sep 2021 14:31:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4RGipb3g9UyGGbTnPe+UXBQocgQri+M+u0rf69gVlyU=;
        b=kua8rCpvSgpDQ5tL+6uktjqQ4CiZfh8EjR7pXzHwHeMsP1bTOKOuPBddT63Y9/lpXh
         eNne8cN8yvFRuLHwpljU5cFV9k76CF4ADbYdME8wzYzi86L/08+kOct1El+P+Mqn1SeM
         cz6KZ0V9YkGiz8HZhAbES+dpcJC+QtLrhyRNiKG7L0ckC0PfbD2zeVx/vrQd5ThbzHOb
         lWZMGq6puGyzz+re2nTIEMAiM5kegW/aSpp8Puhj8WNGXDTyiM/VbrPbUaNQg2yFTHDa
         XCKLNPWHkAEHs4EKVnFTmdOQCAByx9IxFGIqk92JCFjjrNwtYQFaRRYxyan2lC0cVKna
         3vvg==
X-Gm-Message-State: AOAM531RehDSoG7B/EJtzJlk2Or9/PtA5cqB8hNjdn20oby/7w7Blx0m
        4fxl/xzX/Sti1kAsGVUoYw==
X-Google-Smtp-Source: ABdhPJxjPch2dyLlqk9vwZMGMtLlzJCA5Y28kCLbGxV+UcOlddl4grhLvoxGHj6VSU7s1UUryJS5IA==
X-Received: by 2002:aca:3051:: with SMTP id w78mr1553627oiw.159.1631223091455;
        Thu, 09 Sep 2021 14:31:31 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id m24sm694929oie.50.2021.09.09.14.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 14:31:30 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Subject: [PATCH 8/8] kbuild: Enable dtc 'unit_address_format' warning by default
Date:   Thu,  9 Sep 2021 16:31:18 -0500
Message-Id: <20210909213118.1087083-9-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909213118.1087083-1-robh@kernel.org>
References: <20210909213118.1087083-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With all the 'unit_address_format' warnings fixed, enable the warning by
default.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 scripts/Makefile.lib | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 54582673fc1a..56d50eb0cd80 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -310,7 +310,6 @@ DTC_FLAGS += -Wno-interrupt_provider
 # Disable noisy checks by default
 ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
 DTC_FLAGS += -Wno-unit_address_vs_reg \
-	-Wno-unit_address_format \
 	-Wno-avoid_unnecessary_addr_size \
 	-Wno-alias_paths \
 	-Wno-graph_child_address \
-- 
2.30.2

