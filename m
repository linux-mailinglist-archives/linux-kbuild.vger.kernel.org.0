Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507712F5691
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 02:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728556AbhANBtW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 20:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbhANAfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 19:35:43 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0205EC061786;
        Wed, 13 Jan 2021 16:35:03 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id x126so2310733pfc.7;
        Wed, 13 Jan 2021 16:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9a07HwA8hrHoGWjqCa9LIGmpHo9wPiO5hANO4XpbneU=;
        b=QuGjfVfi20kU6iytMLkRF5hq73PukNbSStaPBz9RkC2qsnTr9gGdZdrObgaetKGqpw
         F+N8E1B+u9sBA3LR6Awko7WzdqYuX+lKgIKtHAig8yURCMfxtVubQhEqLEMBRRmqx0SH
         LJVNgdY79TEktoczw1JFw6XGaif/5a5kMQ8WCUNwX+Bz3kuJ2JnAWDzru3vtSG4OXUnu
         W/86vFLS2L3f7AUVFJt6nQ793duG8cGaOWc4gxzJHZqirv/ue3LsD7D4IAbfk7rYS59v
         kJeLa3wxL/q9CIvXWbvUIZXLONJ3QRLM2YNthvfxDJdmKpIvnjPFpqWMwH+VEQUaDz0L
         tmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9a07HwA8hrHoGWjqCa9LIGmpHo9wPiO5hANO4XpbneU=;
        b=ae51WK0jfGEDMKjHIMJVHnLvSa6fD0dkAGp+kTdvqebkdS0hJJXhjY/njbBAF5Rl9w
         l2eiQG0vEKt1f7a0kzWyM5Wuk/pXr6MhwlRS3pdERhBcK9y6hZRHSgwPyD1EO6zEoPPw
         K7XUPQK5mKFOID07Nm8NoG0AqZ24WnBBptSIq2uIIkDC/BqlfIrqEqmaFRJBSRus8rRg
         BLwB8An768uPvdrcgGLFJcEKuVTeOPb7jTfCNX8iG5JHD6H2FEXg9wbvPqPwITtuvL/Y
         HtuS55T1igbbFh1S4t+fwZEaw8JFpigPGCl2ZFox9sM2Ai4+oqmYVlMyfC5nOLVnSfEr
         ZPnw==
X-Gm-Message-State: AOAM533cKE3uZa0/ATHO4VCvphOdrZA0Gmcjr2/5YST+GNwMlV/lzCx7
        8xygd4qojXv634k/ZSvxwi8=
X-Google-Smtp-Source: ABdhPJzu6D6O4GmQFu0dJCINRH3MLi6q/D9VJn7pPW7Inzy/Pnif67lrA7r7iD0g8jS96bSp0peRSQ==
X-Received: by 2002:a62:7651:0:b029:1a5:929b:1681 with SMTP id r78-20020a6276510000b02901a5929b1681mr4709294pfc.27.1610584502401;
        Wed, 13 Jan 2021 16:35:02 -0800 (PST)
Received: from Ryzen-9-3900X.localdomain (ip68-104-204-241.ph.ph.cox.net. [68.104.204.241])
        by smtp.gmail.com with ESMTPSA id 82sm3667890pfv.117.2021.01.13.16.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 16:35:01 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] Documentation/llvm: Add a section about supported architectures
Date:   Wed, 13 Jan 2021 17:34:47 -0700
Message-Id: <20210114003447.7363-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The most common question around building the Linux kernel with clang is
"does it work?" and the answer has always been "it depends on your
architecture, configuration, and LLVM version" with no hard answers for
users wanting to experiment. LLVM support has significantly improved
over the past couple of years, resulting in more architectures and
configurations supported, and continuous integration has made it easier
to see what works and what does not.

Add a section that goes over what architectures are supported in the
current kernel version, how they should be built (with just clang or the
LLVM utilities as well), and the level of support they receive. This
will make it easier for people to try out building their kernel with
LLVM and reporting issues that come about from it.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 Documentation/kbuild/llvm.rst | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 21c847890d03..b18401d2ba82 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -63,6 +63,50 @@ They can be enabled individually. The full list of the parameters: ::
 Currently, the integrated assembler is disabled by default. You can pass
 ``LLVM_IAS=1`` to enable it.
 
+Supported Architectures
+-----------------------
+
+LLVM does not target all of the architectures that Linux supports and
+just because a target is supported in LLVM does not mean that the kernel
+will build or work without any issues. Below is a general summary of
+architectures that currently work with ``CC=clang`` or ``LLVM=1``. Level
+of support corresponds to "S" values in the MAINTAINERS files. If an
+architecture is not present, it either means that LLVM does not target
+it or there are known issues. Using the latest stable version of LLVM or
+even the development tree will generally yield the best results.
+An architecture's ``defconfig`` is generally expected to work well,
+certain configurations may have problems that have not been uncovered
+yet. Bug reports are always welcome at the issue tracker below!
+
+.. list-table::
+   :widths: 10 10 10
+   :header-rows: 1
+
+   * - Architecture
+     - Level of support
+     - ``make`` command
+   * - arm
+     - Supported
+     - ``LLVM=1``
+   * - arm64
+     - Supported
+     - ``LLVM=1``
+   * - mips
+     - Maintained
+     - ``CC=clang``
+   * - powerpc
+     - Maintained
+     - ``CC=clang``
+   * - riscv
+     - Maintained
+     - ``CC=clang``
+   * - s390
+     - Maintained
+     - ``CC=clang``
+   * - x86
+     - Supported
+     - ``LLVM=1``
+
 Getting Help
 ------------
 

base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
-- 
2.30.0

