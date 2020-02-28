Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DADB172D24
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 01:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730431AbgB1AXU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 19:23:20 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40441 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730028AbgB1AWx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 19:22:53 -0500
Received: by mail-pf1-f193.google.com with SMTP id b185so726850pfb.7
        for <linux-kbuild@vger.kernel.org>; Thu, 27 Feb 2020 16:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6fHzEreEHEKZLIitB5E8ew7g5jiGLQoDWIhz+OknFf0=;
        b=GkeoYAU8e8z3RjiVy/lNoEzHu3xfZdCSskh8kGhFyVvHqzRnbnRbxbrn4TM4McSa26
         b5dJvQCjoNTHztfI/3Yk8649TLr/Dejr2bVo8DdGFJbM/WkYGZ0CJ7NMkfa4SauXTXqM
         Nv+INQ8nhKoWxsj1wa0sdOVKRnF3rnDP62/0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6fHzEreEHEKZLIitB5E8ew7g5jiGLQoDWIhz+OknFf0=;
        b=POTbMtsCLCc1Pzflu5BK4jlvhJe9VYOu7cAbJfBRqWsPFWtpp3jNdjaa4J0asMmU/g
         pmpOEY4WJEpwQe8f42OhFZrEW/9yo0EpRtXFmguxtVe5Ux5YvGvDA9y35vR+94Un+ilQ
         6VMgKCWXx32ZtN3t+UgNwjRnVK6MSGVHUdhr28ky+w/6Cx+0JAtCrBkXYBSjtdt90GXd
         1OwhUihWzV/kAMgrV5saMZ9+uciEyObDTUZ2bzdsNxxc7rDKQU8+787ZeI44fIW3brF+
         UK17UNfrC2azPBxY+LlJiSs+KAgImVmc4mrxIGpA2ffzkzvtQ02wRGceAKb7lIGtWqxo
         Ma0A==
X-Gm-Message-State: APjAAAVmIpxlQW5jZkfzDClenrGRCdOtshN5fEpd53bAkZkAP9DmqG64
        1auw9vmL6B8K8ihcmHP0cMf/Rg==
X-Google-Smtp-Source: APXvYqznb6YTTAlhNn7JqjD0ERUnnj6NxCnvI3DxIeFfKY/2l5deXUBraE5hW9O+0SqGg2RsiPTeNw==
X-Received: by 2002:aa7:9891:: with SMTP id r17mr1670426pfl.205.1582849372029;
        Thu, 27 Feb 2020 16:22:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z30sm8485301pff.131.2020.02.27.16.22.48
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
Subject: [PATCH 2/9] vmlinux.lds.h: Add .gnu.version* to DISCARDS
Date:   Thu, 27 Feb 2020 16:22:37 -0800
Message-Id: <20200228002244.15240-3-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228002244.15240-1-keescook@chromium.org>
References: <20200228002244.15240-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For vmlinux linking, no architecture uses the .gnu.version* section,
so remove it via the common DISCARDS macro in preparation for adding
--orphan-handling=warn more widely.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/asm-generic/vmlinux.lds.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index e00f41aa8ec4..303597e51396 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -902,6 +902,7 @@
 	*(.discard)							\
 	*(.discard.*)							\
 	*(.modinfo)							\
+	*(.gnu.version*)						\
 	}
 
 /**
-- 
2.20.1

