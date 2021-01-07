Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457272ECA80
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Jan 2021 07:26:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbhAGG0Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Jan 2021 01:26:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbhAGG0P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jan 2021 01:26:15 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A923C0612F4
        for <linux-kbuild@vger.kernel.org>; Wed,  6 Jan 2021 22:25:35 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 11so3245509pfu.4
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Jan 2021 22:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v2Yn25XHl+ymzY6Sqqp8UyYBl8VsyNvH90saFA5KVqE=;
        b=CFWiH0vHlQlCWzZ6uoudGfqkjTG6FuRGE+oehRL8JLVPg5kEFaayNmKPJDaKYSepwx
         asWdl+k4sLZZUf40Llz/JCQQbEIZVILztGZmUoEPJRvHLGIYlulJg3hv1GdYzibEYH3+
         OL8cdUaVgPMbhN/hBw+MDKfIgOPdsVzbOCeuuPMPpxRCcyqr3hAGRsVesIs1HYQ8gP8p
         dZz7FsHBlYNDXRuARxZNoRr4lznWhNGrTPuhbBAHugkyY4IwOPZO+LJh8qzCFusu39eD
         XcDUUvVWe2uiJ52FRDUv8/T0Hurmx+uAHKsQU3s5RMbVBpCP3vOUQGtxMNFrDRf9yCXL
         dBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v2Yn25XHl+ymzY6Sqqp8UyYBl8VsyNvH90saFA5KVqE=;
        b=MA5zD3uM1oHXLGNqX1+4+W25gN4gZVlDiUQuErhnLjE8Ul1SBOKHKvsc+ODweZr3Hc
         WP0IimroMUVhukBSWukC8red5hLQeT+oFs+80RkyuJMKkAkVtqwmeaCLHOMobBxUlB5n
         PoBnAby9WAs6sng7pEE1hiNvbLNdf5Lupcnss8oOwraqe21m8+hk2utFix0VfO4903k4
         3IiybArDwd2WAa21J5jEaRBiJNimajZ1zWzBteDj8eI9+6uKc86qYhaR5lTIMfKqMYE0
         CwdLUZxSWvqRBynmrXxsuryunHRKc4/WeYb6qllePQGa/8VTeAjN0cgJpzYHMay1mVpo
         Higw==
X-Gm-Message-State: AOAM533YjFc3H6845UWwR4Nbpxi+0fCgadSj05X9WIdguW9t+nUt+LY1
        UNce/K5qOa73MkeD8dchwM/Jyw==
X-Google-Smtp-Source: ABdhPJx+9DCdLWEGE2j0i/7q95jblzmahtAd7GMBvwYIilUL0Sl5xhOn5xANSXK9MFPrau1CKWxiUA==
X-Received: by 2002:a63:8c15:: with SMTP id m21mr355344pgd.396.1610000735086;
        Wed, 06 Jan 2021 22:25:35 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id n4sm4326020pfu.150.2021.01.06.22.25.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 22:25:34 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH V3 2/2] scripts: dtc: Build fdtoverlay and fdtdump tools
Date:   Thu,  7 Jan 2021 11:55:10 +0530
Message-Id: <72c3a4f63dde3c172c11153e9a5b19fb6cdb4498.1610000585.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
References: <CAK7LNAQT5nVHGAZDhj4dct0v8UMzQ+-mdfBXJsfedR-7mZTnyA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We will start building overlays for platforms soon in the kernel and
would need these tools going forward. Lets start building them.

The fdtoverlay program applies (or merges) one ore more overlay dtb
blobs to a base dtb blob. The kernel build system would later use
fdtoverlay to generate the overlaid blobs based on platform specific
configurations.

The fdtdump program prints a readable version of a flat device-tree
file. This is a very useful tool to analyze the details of the overlay's
dtb and the final dtb produced by fdtoverlay after applying the
overlay's dtb to a base dtb.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V3:
- Updated log
- Remove libfdt_dir

 scripts/dtc/Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index 4852bf44e913..472ab8cd590c 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -1,12 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
 # scripts/dtc makefile
 
-hostprogs-always-$(CONFIG_DTC)		+= dtc
+hostprogs-always-$(CONFIG_DTC)		+= dtc fdtdump fdtoverlay
 hostprogs-always-$(CHECK_DT_BINDING)	+= dtc
 
 dtc-objs	:= dtc.o flattree.o fstree.o data.o livetree.o treesource.o \
 		   srcpos.o checks.o util.o
 dtc-objs	+= dtc-lexer.lex.o dtc-parser.tab.o
+fdtdump-objs	:= fdtdump.o util.o
+
+libfdt-objs	:= fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
+libfdt		= $(addprefix libfdt/,$(libfdt-objs))
+fdtoverlay-objs	:= $(libfdt) fdtoverlay.o util.o
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt
-- 
2.25.0.rc1.19.g042ed3e048af

