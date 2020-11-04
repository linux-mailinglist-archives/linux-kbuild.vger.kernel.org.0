Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBE22A5B4F
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Nov 2020 01:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730071AbgKDAyB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Nov 2020 19:54:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729711AbgKDAxv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Nov 2020 19:53:51 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 392DEC0401C1
        for <linux-kbuild@vger.kernel.org>; Tue,  3 Nov 2020 16:53:51 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id b10so8643190qvl.8
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Nov 2020 16:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=ER2UhxLP/araVfLtlLjju4GHW3AHwOn+yA1clWZujmw=;
        b=lwlMImIcTQAVaDbbenxl4PNIkFP0dw+hbwp6OPrJqtdRsKWXuTgdl+u+4dhuUI9M+w
         x+3kd70TRUibgU+0GOHIFaKZr00XWg+cGBVEpYq/B8lnowm6gyWkbN0a1cLg91eXwAVT
         ztcClXf8oIXQbBLrv/K7KMCU77lKmpzhn3Se1tRSOZJIV+g5dqpMqe2utqEE8VwYApuu
         sKPk7wzbiAa3PPrObYdO6e8w984ykDAbIm0b4O3um+YcDP/H0VDN1KesSSD7lLKI5u+X
         pYiPLSJqQCY0vM7iCiR9ZoPYAp9JlLSkINKgtzlOuH+JixRCUkCIT90FMGjY5RmZiocQ
         3o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ER2UhxLP/araVfLtlLjju4GHW3AHwOn+yA1clWZujmw=;
        b=FvrkpusTLWiB6aQnJhkHi4rRrKISckVdZdURCdKc3adrqkojQ0YgjpQ6l5y5Cj3mat
         NbjGpKUzRhNUntfK82DajCtgt9ojBvR7rk5ZR7CEyDbyTVtAvtruqkyQDSxK9TUA4fFf
         5KsqKwqMBOnpo6ZjYrbiv3xfPhsKPZ0QYjCb0Z4HK24UdGWsPrYeqLApXPH8TS14Rv2L
         3M8f9UDARNt8eR1W6mJLCq70Tn+25TfXoYebk8PoE/pXQno+Z7s4wwgErqbV1tn6NqaK
         Ez2Rf8PryRBTeqMwfErbCEzFtFq2lL6BU8j1uYgyw3RbnCxhOsop7+OwP7dn2dcOFasS
         a2iA==
X-Gm-Message-State: AOAM531SCDKfmRAtBFEqURwvUy7YLjI0LB9W2Sd3T04ohO2zwZTj1qcR
        qYTMgqX02bOuME+Ws3/w0iOyFLlCrnjfpo9vEmc=
X-Google-Smtp-Source: ABdhPJzQ73ZhQDdFkPA1QFS9pu0DXoPIbMx7Ycdh0bPQcut/yMWJCZak+bSzxq0mZVYWrwL972FN4TJ990rU3I+E18w=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:fac6:: with SMTP id
 p6mr30296428qvo.5.1604451230411; Tue, 03 Nov 2020 16:53:50 -0800 (PST)
Date:   Tue,  3 Nov 2020 16:53:41 -0800
In-Reply-To: <20201104005343.4192504-1-ndesaulniers@google.com>
Message-Id: <20201104005343.4192504-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v2 2/4] Kbuild: do not emit debug info for assembly with LLVM_IAS=1
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Clang's integrated assembler produces the warning for assembly files:

warning: DWARF2 only supports one section per compilation unit

If -Wa,-gdwarf-* is unspecified, then debug info is not emitted.  This
will be re-enabled for new DWARF versions in a follow up patch.

Enables defconfig+CONFIG_DEBUG_INFO to build cleanly with
LLVM=1 LLVM_IAS=1 for x86_64 and arm64.

Cc: <stable@vger.kernel.org>
Link: https://github.com/ClangBuiltLinux/linux/issues/716
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Suggested-by: Dmitry Golovin <dima@golovin.in>
Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index f353886dbf44..75b1a3dcbf30 100644
--- a/Makefile
+++ b/Makefile
@@ -826,7 +826,9 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
+ifndef LLVM_IAS
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
+endif
 
 ifdef CONFIG_DEBUG_INFO_DWARF4
 DEBUG_CFLAGS	+= -gdwarf-4
-- 
2.29.1.341.ge80a0c044ae-goog

