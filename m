Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAC479B694
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Sep 2023 02:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353042AbjIKVtW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Sep 2023 17:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244210AbjIKTjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Sep 2023 15:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7970C12A
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Sep 2023 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694461097;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BAo7XhrjvK/3ybteqvsiiDZDbALbJjGeMr635r5XCfY=;
        b=MpRFoM0InEbgqQzBXHLsyxkov8NRG7GbeWSPKwHdHcXYiPHdCSXEPqQB+P0nCWZK2BVJDg
        WsMH6MRQR5p+Gi+Zp141XJEFEa0n7IwHxmoUsfUstQ/eUnrmL0I4YfyUMoLmFcncIDzx4J
        nzZg0udla9D0+34ncuJtYWG1JIfPyns=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-31E4i44BPBe3Ae7yNeg82w-1; Mon, 11 Sep 2023 15:38:16 -0400
X-MC-Unique: 31E4i44BPBe3Ae7yNeg82w-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6bf001e729bso5141398a34.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Sep 2023 12:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694461095; x=1695065895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAo7XhrjvK/3ybteqvsiiDZDbALbJjGeMr635r5XCfY=;
        b=RzdK+T0JM8jC/jdVMBv9YSov5jWbpiU/B2i4zb84LhwZEMv0St5T2lpSaY7Oq73kJZ
         uTBzk7tDrYy15ncDvCdBT3nmGUt3GEqoOAA2ya91f4G2I+wCaFRMSXWKlqoNvWwRKBaG
         H7IuO8e4odBxxJMwHid0ZPNJDNhoxATYP371ZkiJqKi9rdfOATJx8/oq/5x4mXWukz9U
         kORNe8PYfH51uCh7EWeRP4lM4iEkTbmwLTlIZfE39St8EXJKgLiK5Fde5f1bHKGyQNtM
         CvYZZQvRqjPTXhTt7HjlaHQA30eCzV7WZiiqP3c8wcgVzc3r8tvaK1NLYtDMJXduhyUt
         8P2w==
X-Gm-Message-State: AOJu0Yy/Svp9/KtG0DzhxLgv2n/g2hnP/bqnuwMegVA56Sc4otIV5Iso
        54G1vX4lvFzJHHQcXxum6baUe5iOF5u5i0b6ny073+gkKM3eghEOipQmN51WlGM7WGq/455SBYh
        HMLwCKtBx4GEF2NlEUqilJaRt
X-Received: by 2002:a05:6830:1692:b0:6bf:29d4:1886 with SMTP id k18-20020a056830169200b006bf29d41886mr10934388otr.34.1694461095423;
        Mon, 11 Sep 2023 12:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtvtstpw9gL5+/J9wmqaf20G5/bfkGVLGUBNzaC/2aa3xh3lly3d7FY52n+lm1dBU5D608bA==
X-Received: by 2002:a05:6830:1692:b0:6bf:29d4:1886 with SMTP id k18-20020a056830169200b006bf29d41886mr10934379otr.34.1694461095225;
        Mon, 11 Sep 2023 12:38:15 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a803:c91:da45:7fbc:86c3:920a])
        by smtp.gmail.com with ESMTPSA id v62-20020a4a5a41000000b005634ef4f1c0sm3662444ooa.31.2023.09.11.12.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:38:14 -0700 (PDT)
From:   Leonardo Bras <leobras@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 1/1] scripts: Introduce a default git.orderFile
Date:   Mon, 11 Sep 2023 16:37:51 -0300
Message-ID: <20230911193752.27642-2-leobras@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
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

 scripts/git.orderFile | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 scripts/git.orderFile

diff --git a/scripts/git.orderFile b/scripts/git.orderFile
new file mode 100644
index 000000000000..3434028be2f2
--- /dev/null
+++ b/scripts/git.orderFile
@@ -0,0 +1,31 @@
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
+Kbuild
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

