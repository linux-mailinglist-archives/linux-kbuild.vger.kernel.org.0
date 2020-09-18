Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8ADDC270659
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgIRUPc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgIRUPb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:31 -0400
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B51C0613E6
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:30 -0700 (PDT)
Received: by mail-qv1-xf49.google.com with SMTP id t7so4613791qvz.5
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=6wkvNORTwM39S5uL0TTc53qeLnDmqjDSKMDvKwEqUnA=;
        b=m59NkH3jdBVGi3dXc89rIxXW0NE7GMfjZfL5ODM7hicbW9tRbSExno6sIVoWVPk/b2
         6ew8lrdf0hw7stNFVAv/okktVg/LjpO4I7jNzt6a8VoaOl/pRpNH1xks4v9BW7bxD/Sr
         i6vq8H7yjf2sd8Aini4O9MK38tgJzNMOIkbJl3sG/G/kVyi9tS3kdWyXupCYVuHY/tg6
         KLw2X/vONosgXWGz3RGoeu4MpReDPfkBwBqpqDUmYFeEC91faan+J54tUJcmpgPMtnOY
         BvbaH2KVwWvnm9Y2AQvGn+V2h5meg1oOgj2ERRg9cb5ebYhX4XX5VX8BZKgVsjjWQeQu
         IcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6wkvNORTwM39S5uL0TTc53qeLnDmqjDSKMDvKwEqUnA=;
        b=nw+fLlZIelSxj9XtULGoC7p/oENVg9LvAOWNZadFHCHmbjes5rPln1yDpkwIIGb/rD
         mPnNw2OgpE7GkRAAvAia6N4mVlc5B14WtRdg3xJpxiCLSFqE1IJAOEcjczu9Z84yfJOn
         ha83akV3p8EdF/vPtRSTTwJ3df4t53MIfM4PE5/b8v7/S6Bo7zQIHHC5v5t3gmZCcIU5
         0cvPEDBe9k0RnmVQCRciT3et8SLg53Nmt8lMiBSPW7geiMqdNZVR4gjJ51VPNv2CRkpj
         f8fA87T2+FWI0sgrFhK1eEQhm0SdBvOd7di304Z92T4Q0SZs7vPjTqqcWZc9nLCWC6Gl
         yxvg==
X-Gm-Message-State: AOAM530Dx1WlmxOWzMF0r+M5tJb/OfdXm9MpGkWAEc0//HhkTiQ+IpIU
        45/qVZDdIvOxm7NzkawMYMBcihe86NHyCqBPP8s=
X-Google-Smtp-Source: ABdhPJyhl0O3HrtpwK2+/eq92loT21+CwrJm1w5RAc9ZKC6o0au3sfzPs9arIL72JQf6OFaC7oO4rGV/iT2i5XrFZMM=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:57cc:: with SMTP id
 y12mr19090228qvx.48.1600460129171; Fri, 18 Sep 2020 13:15:29 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:27 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-22-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 21/30] scripts/mod: disable LTO for empty.c
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_LTO_CLANG, clang generates LLVM IR instead of ELF object
files. As empty.o is used for probing target properties, disable LTO
for it to produce an object file instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 scripts/mod/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 78071681d924..c9e38ad937fd 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD := y
+CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
 
 hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
-- 
2.28.0.681.g6f77f65b4e-goog

