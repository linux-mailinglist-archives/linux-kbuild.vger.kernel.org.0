Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF1A6172D25
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 01:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbgB1AWw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 19:22:52 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:40169 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730140AbgB1AWv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 19:22:51 -0500
Received: by mail-pj1-f67.google.com with SMTP id 12so498431pjb.5
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2020 16:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ez79u0H95d7ehsU8Q6LXSGZw/ZiYxtURwwXuqb7McBM=;
        b=JT0Br7NKTOUA+nKOUR3kxByruQX68VKIehHVXqVVhKCbfrDUGawo16Sa3Z6WcHnQZE
         y1biceMyRdxWDQk+6EXypwYNBPqlrWDKMmnCqpMw9cnF2nSNIF6WOmlDvRjSHvtm0AYe
         cUNtMHvTvp1pA6un7KPrhVESojEL+IC+Da808=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ez79u0H95d7ehsU8Q6LXSGZw/ZiYxtURwwXuqb7McBM=;
        b=o4JfvV0E4TZ4/pa+7T9F18Bft+wSB0zfCAZlnleA2cZLLaqPbynv2thHUvzXB5jX5z
         QM24tBJsHDorTMzG5nO8W7AoqwbXOVZYxSfIEUcTYUhKr6L2sRWafyiuKfV3wjZnjxz6
         4v+wSxO4acwwJt+UCdTd1ikn0oXqAVcJ5hqDPMiQssRWJU+48yVKYupBEJJv40EmXNGa
         vgQGS30BkNb9IeDvIG1BB0dPdeyjUKHfkyAbo3aZQCZ7jlUCrUOFvRFHAT0aggig7TZ8
         dhA/ILkksTED4S/5qz6fOz1C9xvePSDN3XTd5ASp30Fkz6bjjasjxWlLahr7Xb6W8nvf
         ttpw==
X-Gm-Message-State: APjAAAWRFiJUK4Oc7tfkl/AsG9XDvo8rKwtu8LL4sBa6sVrdIGcf/2E4
        GSqsLXcFlu6o2nN2XAtm+aqVWw==
X-Google-Smtp-Source: APXvYqzYAj+CjU1Xxuv+xsBd/M7yvFwmBBzsC7seqTL50y8NxU4tBl30dNubdcD9vIp3lpLiWut6dg==
X-Received: by 2002:a17:90a:be03:: with SMTP id a3mr1544230pjs.99.1582849369865;
        Thu, 27 Feb 2020 16:22:49 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 196sm8572448pfy.86.2020.02.27.16.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2020 16:22:48 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Borislav Petkov <bp@suse.de>
Cc:     Kees Cook <keescook@chromium.org>, "H.J. Lu" <hjl.tools@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Collingbourne <pcc@google.com>,
        James Morse <james.morse@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] scripts/link-vmlinux.sh: Delay orphan handling warnings until final link
Date:   Thu, 27 Feb 2020 16:22:36 -0800
Message-Id: <20200228002244.15240-2-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228002244.15240-1-keescook@chromium.org>
References: <20200228002244.15240-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Right now, powerpc adds "--orphan-handling=warn" to LD_FLAGS_vmlinux
to detect when there are unexpected sections getting added to the kernel
image. There is no need to report these warnings more than once, so it
can be removed until the final link stage.

This helps pave the way for other architectures to enable this, with the
end goal of enabling this warning by default for vmlinux for all
architectures.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 scripts/link-vmlinux.sh | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 1919c311c149..416968fea685 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -255,6 +255,11 @@ info GEN modules.builtin
 tr '\0' '\n' < modules.builtin.modinfo | sed -n 's/^[[:alnum:]:_]*\.file=//p' |
 	tr ' ' '\n' | uniq | sed -e 's:^:kernel/:' -e 's/$/.ko/' > modules.builtin
 
+
+# Do not warn about orphan sections until the final link stage.
+saved_LDFLAGS_vmlinux="${LDFLAGS_vmlinux}"
+LDFLAGS_vmlinux="$(echo "${LDFLAGS_vmlinux}" | sed -E 's/ --orphan-handling=warn( |$)/ /g')"
+
 btf_vmlinux_bin_o=""
 if [ -n "${CONFIG_DEBUG_INFO_BTF}" ]; then
 	if gen_btf .tmp_vmlinux.btf .btf.vmlinux.bin.o ; then
@@ -306,6 +311,7 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
 	fi
 fi
 
+LDFLAGS_vmlinux="${saved_LDFLAGS_vmlinux}"
 vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
 
 if [ -n "${CONFIG_BUILDTIME_TABLE_SORT}" ]; then
-- 
2.20.1

