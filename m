Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0340B22FCBE
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 01:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgG0XLT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 19:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0XLS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 19:11:18 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DC9C061794;
        Mon, 27 Jul 2020 16:11:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g67so10817828pgc.8;
        Mon, 27 Jul 2020 16:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=o/42ecP1wt3/lKVqAeCt9rLgTgayqkb0BJt9p0HtivzihkYbK87byrWtQwVTE9mDUP
         Ufwiv/ASJ+m/fdP25UfiWmnAci8j3RRKS2PRwBPg6kONV1lrADwEEAAcx/fzdPC0xaFG
         zdcfd4dSyUlg0jZZnU2AuBZUgpXEKIa9C/wwey99cZbipYbLx5Hx1fpXAGg+H7TTpB+d
         RT+0apZG6tkWqqJeu4PY4nDZC2nicZ5uP9ryISe7l75jz1LqQ8NiyxJY3Md7SD7t8/Q/
         j2c36w9cbq/jdf/6YVw1yAol3CeiC538VEShZGyaI1EBo7OXxC5cfNx7d9s2R7rP3D2Y
         O/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=pDA9nCbV56K4kwJRT26neCaZJ+ht2yQZN/5iCL5bWRXePCV58G5RV6PVLO81SKu8TL
         TtRe3t85OZjduiU6xRx8zN+C3fdzwk85BjGmQdS/UykUDoltQkIOmZz6AfrGYycwqkg7
         e+xOnoLe6vHNUlOyEWgRrdWbD1AG02vM2IGkncN44wACf4HFAFcI7YBMGjg2KRApcYlI
         x4WSpzfk6be6J0po/WpG3Sva3+mIhndiCNVTo5xG0Js2EgkGVrrcnxbK42ETQQU6eJHS
         TK61yqxaRbttz+YAoTV6drv2gD7k1VvTTB41YD/tclPcFxe10GMvpGQXgnbm/k+IhV0V
         53GA==
X-Gm-Message-State: AOAM531qFgfzV5o827z20YheCXavk+yp+UhpCmysCC0plIeC3Uk4cXBt
        Vk9QHJW/KU/pTSY8kPf7PGw=
X-Google-Smtp-Source: ABdhPJwSIGJiY6qF1htNdKw7Qsxj+lvPw3N//2uWMk0INz4lIp1B2byz5NdDiMEWTyEWS7Vs2tN0lA==
X-Received: by 2002:a63:2104:: with SMTP id h4mr22557614pgh.427.1595891477606;
        Mon, 27 Jul 2020 16:11:17 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id y68sm3515931pfy.185.2020.07.27.16.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 16:11:17 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v9 7/7] .gitignore: add ZSTD-compressed files
Date:   Mon, 27 Jul 2020 16:06:06 -0700
Message-Id: <20200727230606.906598-8-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727230606.906598-1-nickrterrell@gmail.com>
References: <20200727230606.906598-1-nickrterrell@gmail.com>
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

