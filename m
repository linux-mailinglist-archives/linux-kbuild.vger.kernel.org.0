Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC3F1893D
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 13:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfEILtL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 07:49:11 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38763 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfEILtL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:49:11 -0400
Received: by mail-ed1-f65.google.com with SMTP id w11so1753945edl.5;
        Thu, 09 May 2019 04:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sNtboVBsghPQj/AL2Rkd+eRn4TqkkpR3VO8biQ2JG28=;
        b=XWzYavZYttBb9NOMXcOout6a0NX8kk2ndPLZ7RyOn7OwEKP+42cET2l/Nnerw/Feps
         ALFHHyetwg9B78KJjlwHF3tAxV1n3aRmCkcu/jCPX8Gkv7or/sG+Jkntb73yD6hGRb3y
         ab9huSIRKzHYjQTSNn3Bt3386NgHx2Zbg7u7Oq4S49s85t8D9xKg7HDGBw2v8t7PGTFe
         8i2VWQco/1jUUrvW3GmJYJqcuZpI6c19Tg0fTK5GMO+XllQ95+qY8qAAT31DBNVVy9Hx
         0zM75xPUIjzPnIl7G5IcXUtzTALFbeKkUxBRQA/Y+aLvZOlAsnu/+IEi5y7H0XIO5QgQ
         cBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sNtboVBsghPQj/AL2Rkd+eRn4TqkkpR3VO8biQ2JG28=;
        b=gMEh2z7HhXABEVzy1JSrd2NFmllvKtoEdorgqt1EUAKy6fTWsu/a1WyBP08v7G2Ntg
         pXm040nwjZsN8X3nh35VP7jJzIALSdjWYhe+WmhhQjKN1CQdl4pXVDxJ9BAaGOUm4IYa
         nStIEFe25EKADCQ8MboDGpy5aVTAUIObeySS2Dze0GEnKZxVfFkqfeJhRh+IlcfUnsMt
         G22zu+8KPULWQQGuuizBHUggOF4SHB4nNORRFyyucCaYscDlKso0U6lko9ND1nI1or0Y
         DmEIGxvIxwdDBxwFFGkExZo9wP/f8M2dpgUV+tGOfSQmmPuM9LaHr5WkHBB10Z33+xnE
         7XYA==
X-Gm-Message-State: APjAAAUGLpf7uBYRa6WErynhsSxemtyTdLvHtpQkCFGu/v6xi2HQntc3
        QcVuf9/AFQcoETg4yY0y14k=
X-Google-Smtp-Source: APXvYqycmG51rH4H8WukgCe/+Ydnf5+Ho3G1TOzeMwOJobpPcGFydAyhRVVhaXg3vdGnCHOvwlh4dQ==
X-Received: by 2002:a50:97d6:: with SMTP id f22mr3399014edb.115.1557402549836;
        Thu, 09 May 2019 04:49:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id d28sm284538ejl.83.2019.05.09.04.49.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 04:49:09 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
Date:   Thu,  9 May 2019 04:48:25 -0700
Message-Id: <20190509114824.25866-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is no longer a valid option in clang, it was removed in 3.5, which
we don't support.

https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Let me know if you want this incremental to your patch. I figured it
made more sense to remove this then do the cc-option/cc-disable-warning
removal because it will simplify the commit message.

 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index d24f5a8009ee..e4788eb2c9b9 100644
--- a/Makefile
+++ b/Makefile
@@ -740,7 +740,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
-KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.21.0

