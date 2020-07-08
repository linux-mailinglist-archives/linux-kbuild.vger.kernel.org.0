Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE88E21900C
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgGHSzd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726941AbgGHSzc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:55:32 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AC7C061A0B;
        Wed,  8 Jul 2020 11:55:32 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id m9so10099867pfh.0;
        Wed, 08 Jul 2020 11:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=X28otXhyXCEQdHw1t0dk6a0WP/I37kVuqOSmIy2Qtn4W9Sm6vt+skHWbL/UBvtqRDo
         DaPXnQnI+jTkmFYRKBm2Ubyn1JFO2ZtgfrN6JqgtR6uyVezOQDeVNVzxyU0RoJg+ZKfq
         fH+BTpvjIpL4KMsR9VmB5MlBTtwFan0w/qBmZqSmtmSmF4C+0n7msqEeAIKNbG48MTkz
         V8QqNkh8SFZWji6aeKlUGHYb2/xTIJbZ8oQ2h9w8GbSHOCRmNE50I/gTSvZuF1Oxzk0Q
         RCkNXyx1a5wCnvJapY9WFbJ8xGoAFjFSdcUnLOTFAkzRAbZjbFzRuHg4J9JJY17vvL/Q
         HuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=033/koxi8tBQP0JLIdsncSOzrcGFA+WfwhEA16y7708=;
        b=QvzpCQXSNxvM1Ad3AVI4GTjO+1Dx92bh0Tq0IlJ4zt/Wbf8XPP6V83IDy9JcQsDxkV
         6o5daSznQjo6hxWkVOt1mcj7+J+GQpg4FRTxhfeuUBJEHnXQ7QJawajWYTNotu1dBXZW
         wSm5KOyJqDBI3RyYZ6rbiDZccIqZeJ7XaczZXSzRjnf4oSUozux9hs69nOkS/QLcDDyg
         bi4ajPr/88p24TFjLg6Y1MrJPPbaIGIEQE0vS+KNplIkCg+l6PZaTBwLbjTRn0JoqQt0
         BWhb092RrSNh2yFTLrkJCOS/uxc511YST1I6Thpsc+54OPJ2DHEn1xCb6uAcf/zE+y57
         i06Q==
X-Gm-Message-State: AOAM533EeSFVI2R3ts7vAyvRIJCD/opioTedp3mUyGZIjqv0geJ/AUdn
        au4vcUQZTmwnqvnljhiXE8A=
X-Google-Smtp-Source: ABdhPJwQpczN74FxDqhJfF8rFMeq7H0e7dPmMAD0Xmzq0/rmGPfs+uDM0goo1kVyrBJLvtBtgpvdbQ==
X-Received: by 2002:a65:4786:: with SMTP id e6mr34874904pgs.258.1594234531799;
        Wed, 08 Jul 2020 11:55:31 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id c132sm485606pfb.112.2020.07.08.11.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:55:31 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Subject: [PATCH v7 7/7] .gitignore: add ZSTD-compressed files
Date:   Wed,  8 Jul 2020 11:50:24 -0700
Message-Id: <20200708185024.2767937-8-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708185024.2767937-1-nickrterrell@gmail.com>
References: <20200708185024.2767937-1-nickrterrell@gmail.com>
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

