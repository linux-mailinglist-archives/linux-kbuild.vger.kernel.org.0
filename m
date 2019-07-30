Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBBA7AE5C
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 18:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfG3QsF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 12:48:05 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35713 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfG3QsF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 12:48:05 -0400
Received: by mail-pg1-f194.google.com with SMTP id s1so24055022pgr.2
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jul 2019 09:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJPOL/2PE+PC/AElqmQU6HOXbiWhS4dMp+5yI3ZLajU=;
        b=EZBWItEEoXKEQxGBP+RK0+UeSWzIGSTx0p7rXjGNYM2C+AB43wp4Uz+pN3NJceXO4k
         rJjgv15UfzY9YF95KcwqA79IfrpPAeIXCs7PyoBlmFS0zYTP4tqElECZdMbt2ebEtiN1
         qPgE3B6ToDx+Ltr6v6XHl8ZFwFCzdKhASHdTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LJPOL/2PE+PC/AElqmQU6HOXbiWhS4dMp+5yI3ZLajU=;
        b=ps4HQl4J0We5otwDRwJb7x6IOQO+fw+Y5KUU2BRjHjGRCN0sDivYAG5QPVpXh1ss9h
         Pgo8TJt1Obl2B9ipA7YEWw/J+l3+AvM6IRt6yqTH/XQUl6C5LliWBH/fDmEBNflXG1mE
         Y0+f6bcSqNEXs3zAfStexemS3MNhrf3PcNZXkkDEE2PsE2W0SPfAfj13Tzql9e+nypkL
         oVAYT2Cwcj2XKB+S4zp7xwT9xkJYr2U8PXRno80yXu+CEqEIkHupCei7U/t0iVrVmfQE
         cvoG5XaDQ4nSUYG45aQhLLalxWPE8Kq0t+67q1KUq/S43DlPh4Ihxh04TfQaq8tHxMCM
         KKzA==
X-Gm-Message-State: APjAAAW6XfPsFeH/742kJ63GSb2imp12AhrR9z7fo/PoXOaBfhDjSh3t
        wJm3Ih91OJpwA4HfiWjswUL+BQ==
X-Google-Smtp-Source: APXvYqyVxZMwwRiLaOrPjYPFNQxQPXb3c3T4255whvDiLkraPUj7mSUKSmEkTde8p4zmXMglsdT6BA==
X-Received: by 2002:a17:90a:ca11:: with SMTP id x17mr118881270pjt.107.1564505284405;
        Tue, 30 Jul 2019 09:48:04 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 30sm154516103pjk.17.2019.07.30.09.48.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Jul 2019 09:48:03 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Peter Smith <peter.smith@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3] kbuild: Check for unknown options with cc-option usage in Kconfig and clang
Date:   Tue, 30 Jul 2019 09:48:03 -0700
Message-Id: <20190730164803.45080-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If the particular version of clang a user has doesn't enable
-Werror=unknown-warning-option by default, even though it is the
default[1], then make sure to pass the option to the Kconfig cc-option
command so that testing options from Kconfig files works properly.
Otherwise, depending on the default values setup in the clang toolchain
we will silently assume options such as -Wmaybe-uninitialized are
supported by clang, when they really aren't.

A compilation issue only started happening for me once commit
589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
leads kbuild to try and test for the existence of the
-Wmaybe-uninitialized flag with the cc-option command in
scripts/Kconfig.include, and it doesn't see an error returned from the
option test so it sets the config value to Y. Then the Makefile tries to
pass the unknown option on the command line and
-Werror=unknown-warning-option catches the invalid option and breaks the
build. Before commit 589834b3a009 ("kbuild: Add
-Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
but any cc-option test of a warning option in Kconfig files silently
evaluates to true, even if the warning option flag isn't supported on
clang.

Note: This doesn't change cc-option usages in Makefiles because those
use a different rule that includes KBUILD_CFLAGS by default (see the
__cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
variable already has the -Werror=unknown-warning-option flag set. Thanks
to Doug for pointing out the different rule.

[1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
Cc: Peter Smith <peter.smith@linaro.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 Makefile                | 1 +
 scripts/Kconfig.include | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9be5834073f8..517d0a3f6539 100644
--- a/Makefile
+++ b/Makefile
@@ -536,6 +536,7 @@ KBUILD_AFLAGS	+= $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
+
 # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 8a5c4d645eb1..4bbf4fc163a2 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)
 
 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
-cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
+cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /dev/null)
 
 # $(ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise
-- 
Sent by a computer through tubes

