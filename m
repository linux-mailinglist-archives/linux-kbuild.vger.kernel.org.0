Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4EC79C2FD
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Sep 2023 04:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238040AbjILCc6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Sep 2023 22:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238449AbjILCcj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Sep 2023 22:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2CA4E16DD6F
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Sep 2023 17:14:11 -0700 (PDT)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-Phy95IUDN2WVqDQ6Do8P6w-1; Mon, 11 Sep 2023 19:45:39 -0400
X-MC-Unique: Phy95IUDN2WVqDQ6Do8P6w-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6c0f2a1da4fso1020628a34.2
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Sep 2023 16:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694475938; x=1695080738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVho9DFdy9WX2sV5QCNmMLyT6ZAwYjpgqtFPu/9HvYo=;
        b=sVYdT4GZq1nkFjeU6tmxDui6NOPsvLyO450Zi5eChkDKmk4KZrm5JEkeBPZ1uwYI9D
         54siSDwdIF4q5hju0Go9FXZT15skJH77FTfuV52/2hBsjolqSVhb1FsYE/i29UjVBmCl
         vsV6X5/rKM3xSM4bzsZPXqycVtE/5DIBCADHymaQI4JEPzCuwXTIMoEYwf1o/Xw6HhzH
         /7lJ0KuK4PRI8Bpimm4gpocdywAHwf56DhZgm2FmD6LnF12F/YAIaMHNB5w3zMz861WB
         5z7wkxVbi1Qnc4+6VdoIND4v5jUtssA9q+iW/BNjr8qlxnPcvZVegYR7ApVniUdaVVXh
         47tg==
X-Gm-Message-State: AOJu0Yz2IXIRHriK2NdvGecAe06TOnBO995UJUu8rMjrb3/g7e7oXuXG
        xKL/MWAPF9u2vLrXNy/LFrcidycXaUEcBOkAgH7IbRzqmbpZbTnH/y6UkDsCQw5PZuQe13IBv88
        Tdrfw4DRjOnDAwYuWsFHiRMgQiqRwLjOd
X-Received: by 2002:a9d:6d19:0:b0:6bc:c542:6f75 with SMTP id o25-20020a9d6d19000000b006bcc5426f75mr12808184otp.0.1694475938733;
        Mon, 11 Sep 2023 16:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPpJM2jDI9Nw3z0LJidGHjDMA/sa6wLPPzWY/rhO4GYN6s/67nHlerNd4ErB5Sr6FlG6KNOQ==
X-Received: by 2002:a9d:6d19:0:b0:6bc:c542:6f75 with SMTP id o25-20020a9d6d19000000b006bcc5426f75mr12808172otp.0.1694475938540;
        Mon, 11 Sep 2023 16:45:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a803:c91:da45:7fbc:86c3:920a])
        by smtp.gmail.com with ESMTPSA id a2-20020a9d6e82000000b006b89596bc61sm3547839otr.61.2023.09.11.16.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 16:45:37 -0700 (PDT)
From:   Leonardo Bras <leobras@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [RFC PATCH v2 1/1] scripts: Introduce a default git.orderFile
Date:   Mon, 11 Sep 2023 20:44:17 -0300
Message-ID: <20230911234418.38154-2-leobras@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When reviewing patches, it looks much nicer to have some changes shown
before others, which allow better understanding of the patch before the
the .c files reviewing.

Introduce a default git.orderFile, in order to help developers getting the
best ordering easier.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---

Please provide feedback on what else to add / remove / reorder here!

Changes since RFCv1:
- Added Kconfig* (thanks Randy Dunlap!)
- Changed Kbuild to Kbuild* (improve matching)

 scripts/git.orderFile | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 scripts/git.orderFile

diff --git a/scripts/git.orderFile b/scripts/git.orderFile
new file mode 100644
index 000000000000..819f0a957fe3
--- /dev/null
+++ b/scripts/git.orderFile
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+# order file for git, to produce patches which are easier to review
+# by diffing the important stuff like header changes first.
+#
+# one-off usage:
+#   git diff -O scripts/git.orderfile ...
+#
+# add to git config:
+#   git config diff.orderFile scripts/git.orderfile
+#
+
+MAINTAINERS
+
+# Documentation
+Documentation/*
+*.rst
+
+# build system
+Kbuild*
+Kconfig*
+Makefile*
+*.mak
+
+# semantic patches
+*.cocci
+
+# headers
+*.h
+
+# code
+*.c
-- 
2.42.0

