Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878F12164E6
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 05:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgGGDvV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 23:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbgGGDvU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 23:51:20 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA925C061755;
        Mon,  6 Jul 2020 20:51:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ch3so2726399pjb.5;
        Mon, 06 Jul 2020 20:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=O3L5Bzw8rTtucvD4lnK6MughGQc70fhn+QffJvqXfAfG9BTX4s8iXDKHeCTwz5qvwi
         2aLSldd7LtY9jjaaQLC7mSDVoiF47AGqsBit4KFDNilM56dI4yySSfkwFjAaGvcjLaKi
         UTWKCHd1RY9VX/G9gRuJ74ahlbawORv1SAJZ+x4/f1+GEXZ6Mas261mCMEKYfx+yknXm
         /DDjkxs+AyYwMHsZA/72e9oCfYpJpvSE5f1UldkbmhdH+Zjfw0xnMmrzgSA7Xh36xylU
         3ICpX2GbHQGqnLzN6rcWaARxpgrUQNuYuv4FoJTrsH+wswJJgQyuti+bu/ey20z/IvBy
         uMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=pn/MwX8Y5Ezohohk4tkCsDONHl02mD0cgWV9Qlh2Z3khZRtx5XpV9qGqEYs8rlgIiA
         20cSPci6qOH8XkBGYm4YzkWn2Fii80CuERQ8e4VLSy9eP7I6izeyEm2bln5q2Wkgtjba
         18xT3hLgwTdDukmYJqEIPlswVv1Bkf1YduMqdi3PBXvguDSozFle7Nbj3UaO34bbYq7L
         e6fdVMSqNaTpsWDlT3rGG4kouM/fHn/eitdIOP3+zVrKdfe4W7wha4ghQr+IGDSQoaZr
         j3LX0gmOXgGhtKTu8PAeNMov3Pr3YgkpLIxRLfj4C8WJeKo1h87EzQnQY/bZr74ETszS
         mfuA==
X-Gm-Message-State: AOAM533NqKoWRK0a19n3Dxoghx1r4oP6B5F36qMhW6Neg9blDCIZxaJc
        T1J/dK3kZjf848Nvnj+Oo7w=
X-Google-Smtp-Source: ABdhPJyU5pnmkinPhabPfM9/XOUiCk9YjfUoGgAzqlDY+UsGCKo9/LuFKk4rpFu8tt55F619kOwU4g==
X-Received: by 2002:a17:90a:a383:: with SMTP id x3mr2327888pjp.199.1594093880309;
        Mon, 06 Jul 2020 20:51:20 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id d22sm20466320pfd.105.2020.07.06.20.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 20:51:19 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v6 8/8] .gitignore: add ZSTD-compressed files
Date:   Mon,  6 Jul 2020 20:46:04 -0700
Message-Id: <20200707034604.1539157-9-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707034604.1539157-1-nickrterrell@gmail.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Adam Borowski <kilobyte@angband.pl>

For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
will come, thus let's be consistent with all other compressors.

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nick Terrell <terrelln@fb.com>
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index d5f4804ed07c..162bd2b67bdf 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,6 +44,7 @@
 *.tab.[ch]
 *.tar
 *.xz
+*.zst
 Module.symvers
 modules.builtin
 modules.order
-- 
2.27.0

