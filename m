Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1636B30D6B9
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Feb 2021 10:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhBCJwR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Feb 2021 04:52:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233478AbhBCJwL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Feb 2021 04:52:11 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 453B8C061786
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Feb 2021 01:51:31 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id g15so16955600pgu.9
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Feb 2021 01:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wBX1VyZvqFargIbuzyCHxeXh2t3OMi+jyqk4NEoTLjM=;
        b=AiM1Z09V1NldCLbYRQDI5f11YZ3KIFhKCp4i9BbbQEYKRZyk5uJt6ITm3vN4JZuUi0
         lpLluAPvDU4g0FPWlvKTeLoBQXYd2f4xFgurRJCc6JDGjYbGbahgPThn6BWCMfWlpjlh
         4L34FmhLwHwnLFpoiYa9zfkPiq+r0G6ZZ4qjRg5ITarmRd7xB5qluz72JFRiUfrSrQIX
         Nec9nNzmue67ZhjGvvcmH7KKAwd5Y+t9XvRotSvK2B0F6M90TnSoLn4FUSLmUkjCH82D
         j8bPfpMfEYMCyUR/Vcbebgq8rXZzKnh2pzlToWx8ruoAaEcJJl0NM9sszpfZpvFR3E96
         HG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wBX1VyZvqFargIbuzyCHxeXh2t3OMi+jyqk4NEoTLjM=;
        b=eeQooyrEz3EFfADGH+LbxoFX0hgy/KEFEdxDIfIlmuTqDa2/JgfkKCNePklDQGd0GR
         0qgDN5T4p5oltf0/aP/TX5HgrlkBVpy/QMjHLjeZUZ7ZZ0eRJrVJ1NAwjsEw9+WSLbNF
         iBzhU0FThXwN9x9rSqDmcignFWwbAcxfSKTfBhcEr81QFry/lR7S4HSEwaJl04e94Uuu
         AZdtqSn5A0+Fm7Hic43pxJeqWlTcgHcqlHTLC3fVjmqn3kII6xf7l+RbcI9WltnghhyQ
         H5TZJ1dAgmiwXWu2eJuGoXTniWN/D2Sp8L5GSlAMghYCNsAaLn+XAkY8bVPJBa6XxNRc
         rvmw==
X-Gm-Message-State: AOAM533wWhd0fw43RIfzxjRjRJfeu8OaHkmLOSd+S8YxPZfkY5xCsM82
        kHfEeL7kl/NtQQfko3ZLkWEfew==
X-Google-Smtp-Source: ABdhPJz3UhCxsItVgjwGFq3F1oJLAlxuq8TjQGPtcjP1wtlQScn0kERt8vcsVCTTQKPRAIN7zRoCoQ==
X-Received: by 2002:a63:3747:: with SMTP id g7mr2700514pgn.376.1612345890802;
        Wed, 03 Feb 2021 01:51:30 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id h6sm1738999pfr.47.2021.02.03.01.51.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 01:51:29 -0800 (PST)
Date:   Wed, 3 Feb 2021 15:21:27 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     David Gibson <david@gibson.dropbear.id.au>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
Message-ID: <20210203095127.rphegopnavk7ijhu@vireshk-i7>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
 <20210120051740.yph4v7zldvs7szdz@vireshk-i7>
 <20210122063455.GE4400@yekko.fritz.box>
 <83242f56-19a5-6d32-c050-8d9f63ac1e47@gmail.com>
 <20210201040748.GB2251@yekko.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201040748.GB2251@yekko.fritz.box>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 01-02-21, 15:07, David Gibson wrote:
> On Mon, Jan 25, 2021 at 09:42:21PM -0600, Frank Rowand wrote:
> > Before having looked at libfdt only at a cursory level while debugging the proposed
> > use of fdtoverlay in Linux, my first thought was that maybe it would be possible
> > to add warning and error messages within "#ifdef" blocks, or other ways that
> > cause the error code to _not_ be compiled as part of library version of libfdt,
> > but only be compiled as part of fdtoverlay _when built in the Linux kernel_
> > (noting that the proposed Linux patch builds the libfdt files as part of
> > the fdtoverlay compile instead of as a discrete library).  After looking at
> > the libfdt source a tiny bit more carefully, I would probably shoot down this
> > suggestion, as it makes the source code uglier and harder to understand and
> > maintain for the primary purpose of being an embedded library.
> 
> Oof.  That sounds really ugly, but maybe it could be pulled off.

I started looking at this and I was able to get to a not so ugly
solution.

Do this in dtc:
-------------------------8<-------------------------
---
 dtc.h        | 6 ++++++
 fdtoverlay.c | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/dtc.h b/dtc.h
index d3e82fb8e3db..cc1e591b3f8c 100644
--- a/dtc.h
+++ b/dtc.h
@@ -29,6 +29,12 @@
 #define debug(...)
 #endif
 
+#ifdef VERBOSE
+#define pr_err(...)    fprintf(stderr, __VA_ARGS__)
+#else
+#define pr_err(...)
+#endif
+
 #define DEFAULT_FDT_VERSION    17
 
 /*
diff --git a/fdtoverlay.c b/fdtoverlay.c
index 5350af65679f..28ceac0d8079 100644
--- a/fdtoverlay.c
+++ b/fdtoverlay.c
@@ -16,6 +16,7 @@
 
 #include <libfdt.h>
 
+#include "dtc.h"
 #include "util.h"
 
 #define BUF_INCREMENT  65536
@@ -76,6 +77,7 @@ static void *apply_one(char *base, const char *overlay, size_t *buf_len,
        if (ret) {
                fprintf(stderr, "\nFailed to apply '%s': %s\n",
                        name, fdt_strerror(ret));
+               pr_err("New error\n");
                goto fail;
        }
 

-------------------------8<-------------------------
And do this in kernel:
-------------------------8<-------------------------

diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
index c8c21e0f2531..9dafb9773f06 100644
--- a/scripts/dtc/Makefile
+++ b/scripts/dtc/Makefile
@@ -13,6 +13,7 @@ dtc-objs      += dtc-lexer.lex.o dtc-parser.tab.o
 libfdt-objs    := fdt.o fdt_ro.o fdt_wip.o fdt_sw.o fdt_rw.o fdt_strerror.o fdt_empty_tree.o fdt_addresses.o fdt_overlay.o
 libfdt         = $(addprefix libfdt/,$(libfdt-objs))
 fdtoverlay-objs        := $(libfdt) fdtoverlay.o util.o
+HOSTCFLAGS_fdtoverlay.o := -DVERBOSE
 
 # Source files need to get at the userspace version of libfdt_env.h to compile
 HOST_EXTRACFLAGS += -I $(srctree)/$(src)/libfdt

-------------------------8<-------------------------

Will that be acceptable ? With this we can add as many error messages
to libfdt without affecting any other users of it other than Linux.

-- 
viresh
