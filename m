Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 182C01A2B9B
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 23:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgDHV4Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 17:56:25 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38207 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgDHV4Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:56:24 -0400
Received: by mail-pg1-f193.google.com with SMTP id p8so523152pgi.5;
        Wed, 08 Apr 2020 14:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PnIiwmTSVZMRtxsSOYRF7NKqNHugp52gwHRr9w8GaRc=;
        b=aaADSuI6TXoHE+iOPGDU4mEv7HZKcuE817g0U7W2c4POu04XkY+UF8Q62HT4X8V4Pc
         +u8ySTeSl4ldzMiS/XsLmRWdB3iiFi1gS/seN33nWT2MeAcR/D8Io0SviquIr9tQ6Lwr
         7nMNj0/J8h3LtQgveeZPzTUEG/Qn1Hc4xnsBesCr+QOHRuhjWEoH2GPFBRLP7Zcgeu7Z
         65QsiNotPKD2cTmF+V2xdr4RYXq5szsOxZaAfy5HJfGcENYm4kolCK4EEgptnaur5vrs
         MPoPulZyS/AcHaItFyiDWBEebwl04Ye77x5hUbwws9BKA2u+DETXifDIaeSu596WEDZU
         0Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PnIiwmTSVZMRtxsSOYRF7NKqNHugp52gwHRr9w8GaRc=;
        b=Le7WI88sHO1JfP6WTbsJQxssOic7qVAr62L5NnZPd08o/SdRvkJHRp8zPfnmDnHSrz
         0fIoAjzI3DzwGuPzTnbH6FcSv4gspIwEA5YCAeberfoRHbuk7Jr/17RxGjMuKI+hsSIK
         DV5SWe7iYP02ApPU83EHKYs83OTNQU45AHiEQMD1u2nam63UK25xzXuBEcHKMZeOb/5y
         4Fr53/VRgXycdK/hoQ+kIew+/atyBpz820SrlOp4wuUEE04i3AWD5pCxxyCFNDq+3426
         iOOICXkfEW9Oku9V9QggUJGYpbHByXO7T88RHK3fqt960ri0HDMvDgwtd+dfJSKrBnGw
         AHNQ==
X-Gm-Message-State: AGi0PuZZl/YFC/jQ/pk3UO+Bi4ZWi9g2HPS3oFZA11xDBgFdJzCwS6L9
        XqXAjBW+g6Sk/HtIOWOF0vI=
X-Google-Smtp-Source: APiQypLnT/F6Iqwegdn2VK0Dk2tonnaHWUkfXWT47civ/UTMena7uQDibcwFTXt2033nbINQgU2QwA==
X-Received: by 2002:a62:64d5:: with SMTP id y204mr9587296pfb.227.1586382983398;
        Wed, 08 Apr 2020 14:56:23 -0700 (PDT)
Received: from nickserv.localdomain (c-73-222-55-223.hsd1.ca.comcast.net. [73.222.55.223])
        by smtp.gmail.com with ESMTPSA id ci13sm459604pjb.16.2020.04.08.14.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:56:22 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v5 8/8] .gitignore: add ZSTD-compressed files
Date:   Wed,  8 Apr 2020 14:57:11 -0700
Message-Id: <20200408215711.137639-9-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408215711.137639-1-nickrterrell@gmail.com>
References: <20200408215711.137639-1-nickrterrell@gmail.com>
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
index 2258e906f01c..23871de69072 100644
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
2.26.0

