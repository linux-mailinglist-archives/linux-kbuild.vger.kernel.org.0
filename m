Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 842D863B63
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 20:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfGIStZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 14:49:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56934 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIStY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 14:49:24 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <seth.forshee@canonical.com>)
        id 1hkvB4-0006CP-8Q
        for linux-kbuild@vger.kernel.org; Tue, 09 Jul 2019 18:49:22 +0000
Received: by mail-io1-f69.google.com with SMTP id f22so24034402ioj.9
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2019 11:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PxPSNMyhSc6n3DVu8+8initQj1WYg71cqa7Dt37YRsc=;
        b=qHbylZ43xDRjDzcyh6+tvI1FHfj4WWHEfu1q+lcIS5ZnHVkD+Kbs8AvvnQbbzxW/NR
         G5bnmNRaECN8JpHIl04cEI7ac7X80G/RsTvZqaUhHIcipFo9G//4rbS6wNQXfykAT3s5
         4Hisn0RwUl/P8ih0rv6GpSKQ42sePwKiFDn1OB/IA5yfeRnBdMX/Yz9fa8WZw5WcyKrx
         QbHW2Sbh4a+KtOUdW4077l90jaFdGYK0jCi2cbxYZaLaUqlGp7sGOdeCkL0kH04J5Xc+
         OBSB1sPYyMeJnzD9zgEyFrWZhVqRzutyx8+h6ED5lutxRxcUrJZTcN0t92zjaT7PUK3M
         6+Cw==
X-Gm-Message-State: APjAAAV4mJS0j+NGxACnw/Q7oaf1hS+0yO8jvXFLrfIEZr2fl43yGiC5
        iqZe/xI2zc/WW4hGVu4k4R0nB7XEWLM7muvOK/0zpYsskk7IUOTlyEDFjiMgPSrKYhwVIEpUEAr
        Rt4W8ClWJWmC7rMIlFISjq8AY8E7Vj6mrgybzttx8sg==
X-Received: by 2002:a02:cc50:: with SMTP id i16mr3728956jaq.50.1562698161275;
        Tue, 09 Jul 2019 11:49:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqww71No87FKb3rA8fwT+GlZqF9MtRtPIDfWtG04OMqHpUZRPq3+YiRqWPLQiJMSyPtIx7hDRg==
X-Received: by 2002:a02:cc50:: with SMTP id i16mr3728928jaq.50.1562698160978;
        Tue, 09 Jul 2019 11:49:20 -0700 (PDT)
Received: from localhost ([2605:a601:ac2:fb20:b0e0:a018:77ee:9817])
        by smtp.gmail.com with ESMTPSA id n17sm20052182iog.63.2019.07.09.11.49.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 11:49:20 -0700 (PDT)
From:   Seth Forshee <seth.forshee@canonical.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add -fcf-protection=none to retpoline flags
Date:   Tue,  9 Jul 2019 13:49:19 -0500
Message-Id: <20190709184919.20178-1-seth.forshee@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-mindirect-branch and -fcf-protection are not compatible, and
so kernel builds fail with a gcc build where -fcf-protection is
enabled by default. Add -fcf-protection=none to the retpoline
flags to fix this.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 3e4868a6498b..050f11d19777 100644
--- a/Makefile
+++ b/Makefile
@@ -636,6 +636,10 @@ RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
 RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
 RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
 RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
+# -mindirect-branch is incompatible with -fcf-protection, so ensure the
+# latter is disabled
+RETPOLINE_CFLAGS += $(call cc-option,-fcf-protection=none,)
+RETPOLINE_VDSO_CFLAGS += $(call cc-option,-fcf-protection=none,)
 export RETPOLINE_CFLAGS
 export RETPOLINE_VDSO_CFLAGS
 
-- 
2.20.1

