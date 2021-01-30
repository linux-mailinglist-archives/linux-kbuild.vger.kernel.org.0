Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E41A309438
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Jan 2021 11:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhA3KQa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Jan 2021 05:16:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233018AbhA3A4i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 19:56:38 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AC6C06178A
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 16:44:08 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id u14so12060162ybu.9
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 16:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=e8ediMGbRKukecpLwO0eR0sbXZYBrlkFjlLmuC8GnoE=;
        b=fEyFzt3KHtoL6uGy0iZx8DvfLSlWMOs9K+nvo6MTXB4KKESIT3QfMhTqnnlNqCo2wx
         Vv8lttyIGu0PEa848lroNrZSNvRoXp+fHVC2A3nKhCZMllY+PKdRoMn1Vea3HRFGBgoT
         ANNgdC8oU7mEwR2Q1iyP97cMyy7NZqyjQZm9VmcjzvE7a1yLXDl+xBlolhJa02hdLFo/
         EcDmrfTncaAX7EmA9Oo78pfzv7J8725gpteecb9oVgY3D1nBcMxPdlo0CaNzSvH6I4UF
         gXimS8DkkshvToLySWby18nrU/+94IUBHynNqo2209XIHHe7jjbtq+NV4CYx57+CF49i
         dK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=e8ediMGbRKukecpLwO0eR0sbXZYBrlkFjlLmuC8GnoE=;
        b=jg7hsnmTV+HXxHhPqwdBt867oFP3EEkqNnE2oqVyD7qM5s005CqbuI5zNoO2uyctc0
         XcjC20OjMowHQoyEM2AnBzXU+7wznp9+wYd9SuyzpJk3hGa/I8wxRk3d+eAFs4KCk6LC
         nEWSCa1Zoa6p7of+FOodeRTxhNwzn5R5ZSxEvh6R/yYIo884TwBXHDwobHDJP+DQebdS
         2H4/OIPjbfU7duEQTdi/MMpneGr8g5EEkFVgrZEmwd/lRe2E6xACKo9pMBzADaBMs+Lf
         kc1HZPqbU9XutFFo508KYSeTw8iQXZd66ww4wE2uyu2b4yOrw1nMS1XVTHe/F84+CavQ
         POkQ==
X-Gm-Message-State: AOAM533ErKk581LIc4NIK9Hd7S2+TO9E56i3VpEDVX1txcaK76vujsiw
        lXwNKU9jjnuU4AdXMUtc6T2k9ZuROeOqcRYBFUE=
X-Google-Smtp-Source: ABdhPJxM+p5XwbuYGK6EpDfDaxgYt7Be1GcIn8X1grBEIql7ANp7rNTvPHoFhNKDxI107oNYdXu7/tcPEgPlRKI/Yns=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a25:d293:: with SMTP id
 j141mr9709920ybg.56.1611967447754; Fri, 29 Jan 2021 16:44:07 -0800 (PST)
Date:   Fri, 29 Jan 2021 16:44:00 -0800
In-Reply-To: <20210130004401.2528717-1-ndesaulniers@google.com>
Message-Id: <20210130004401.2528717-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210130004401.2528717-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v7 1/2] Kbuild: make DWARF version a choice
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        Nick Clifton <nickc@redhat.com>, Yonghong Song <yhs@fb.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice which is
the default. Does so in a way that's forward compatible with existing
configs, and makes adding future versions more straightforward.

GCC since ~4.8 has defaulted to this DWARF version implicitly.

Suggested-by: Arvind Sankar <nivedita@alum.mit.edu>
Suggested-by: Fangrui Song <maskray@google.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile          |  5 ++---
 lib/Kconfig.debug | 16 +++++++++++-----
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/Makefile b/Makefile
index 95ab9856f357..d2b4980807e0 100644
--- a/Makefile
+++ b/Makefile
@@ -830,9 +830,8 @@ ifneq ($(LLVM_IAS),1)
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
 endif
 
-ifdef CONFIG_DEBUG_INFO_DWARF4
-DEBUG_CFLAGS	+= -gdwarf-4
-endif
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
+DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
 DEBUG_CFLAGS	+= $(call cc-option, -femit-struct-debug-baseonly) \
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index e906ea906cb7..94c1a7ed6306 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -256,13 +256,19 @@ config DEBUG_INFO_SPLIT
 	  to know about the .dwo files and include them.
 	  Incompatible with older versions of ccache.
 
+choice
+	prompt "DWARF version"
+	help
+	  Which version of DWARF debug info to emit.
+
 config DEBUG_INFO_DWARF4
-	bool "Generate dwarf4 debuginfo"
+	bool "Generate DWARF Version 4 debuginfo"
 	help
-	  Generate dwarf4 debug info. This requires recent versions
-	  of gcc and gdb. It makes the debug information larger.
-	  But it significantly improves the success of resolving
-	  variables in gdb on optimized code.
+	  Generate DWARF v4 debug info. This requires gcc 4.5+ and gdb 7.0+.
+	  It makes the debug information larger, but it significantly
+	  improves the success of resolving variables in gdb on optimized code.
+
+endchoice # "DWARF version"
 
 config DEBUG_INFO_BTF
 	bool "Generate BTF typeinfo"
-- 
2.30.0.365.g02bc693789-goog

