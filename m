Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9A42F2B85
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 10:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728757AbhALJlt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 04:41:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbhALJls (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 04:41:48 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468D1C061795
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 01:41:08 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id q20so1053231pfu.8
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 01:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N5gPe6VICAF23DO3VFw8snxPpNxb7Xk5ic4+s7znuoc=;
        b=lvmNCoLr1rN0OCsKFG6UZCCbtUCiKHx12DRxXuWRO/i35blG1TsBWoPQeptEFgEpIN
         8/D8nvAwNL0mw8ajCKfQTTO5Y3OlsNuJY4foZHrWpJH1M3Gb7MWr1BKBYkIW0S9PRwGn
         ulhnslLxEz4mqjARlDMI3HOuqXT+lZoIiMx3uFOz6xhTPzpc64uLSp49x2rOo/a8Ujlr
         +HsdDlcs1nTK8SgWS4MfWcg/UywAlrvTXFze8BAg1p0GaHacEFnZUDai/o/uQ2Hh5LVH
         8jp+1pBAUAPraNXN6fJSgdCcZtO9R3vWGyZrCuaIvJCugE8+kfQ1cYfOrqAx768+RFIX
         ie/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N5gPe6VICAF23DO3VFw8snxPpNxb7Xk5ic4+s7znuoc=;
        b=jLrCY8YEyXPXRTDGxpmxUm/U9/eHyln2Te4U5ZwcbkxCa/KGAJJxLg26uBLhBNIS5g
         UIjHU+byMu+yZKJRcRQeXcjFrdK29JolNgWg27Ctbty53ikqGtLv2UpXGoqmeux2w+1K
         vs1WDvHYsb9QxvBbyXPyYDUaModlOLGhMYZtHFGXQqoiQxn30YxsrQ4D32kdE6+WqYrl
         NAvrQFbfbWtnl7MhRA05/WzxkZ8fFj69sAojEM82hiGKlKDm3FPWf1gQ3xoOKibyAZV9
         qlTdqa47/KD5KDtVquZgSX1L8Dyn6Ks8DLTGnhVBpiYQ1k0U9g8iYYUy5oPlPr65Ob1G
         LtkQ==
X-Gm-Message-State: AOAM531rDZ/b3zp/uUhSbUQHwIcchoUCMveSjQSv0+gvdBsHB6UiN/on
        IAJU7g3FTh7SqzeuVkNCjnXFXRWBcslwPQ==
X-Google-Smtp-Source: ABdhPJyQeQsHFfo9WD/97PYe0+LVzJEsfG9mBwqV5UrXNRUxqX3VYywjolxEoJ7o/WuYX7uGTwpoFw==
X-Received: by 2002:aa7:8517:0:b029:19d:d70f:86ec with SMTP id v23-20020aa785170000b029019dd70f86ecmr3823661pfn.19.1610444467625;
        Tue, 12 Jan 2021 01:41:07 -0800 (PST)
Received: from localhost ([122.172.85.111])
        by smtp.gmail.com with ESMTPSA id 68sm2362475pfe.33.2021.01.12.01.41.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2021 01:41:06 -0800 (PST)
Date:   Tue, 12 Jan 2021 15:11:04 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        DTML <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, tero.kristo@gmail.com
Subject: Re: [RFC 0/2] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210112094104.k3425nr5t4dbogns@vireshk-i7>
References: <cover.1609844956.git.viresh.kumar@linaro.org>
 <CAL_JsqJMr3vfz2B29vzvFALCt_5-J__eJv2TZHJ0sR9nM=xXaw@mail.gmail.com>
 <CAK7LNAR9fdjZ7iWKSWvJ9etGZkd+n87cmXKN-Hah8DBDYbuAwA@mail.gmail.com>
 <20210111111711.r2xesydzhq5js2nf@vireshk-i7>
 <CAK7LNASViCOTGR7yDTfh0O+PAu+X-P2NwdY4oPMuXrr51awafA@mail.gmail.com>
 <CAL_Jsq+HiPv1x8B8ZdM2yjFLyiCwzcRR79SVsHCk80asySWp4w@mail.gmail.com>
 <CAK7LNAS4V0ohZM+V5xJypejb6Powx2bj_6_kvAGU9L5EnRF=Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAS4V0ohZM+V5xJypejb6Powx2bj_6_kvAGU9L5EnRF=Bw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12-01-21, 02:02, Masahiro Yamada wrote:
> On Tue, Jan 12, 2021 at 1:13 AM Rob Herring <robh+dt@kernel.org> wrote:
> > On Mon, Jan 11, 2021 at 9:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> We do not need the dtbo-y syntax.

+1

And we are left with much simpler diff with what we agreed on. Does
this look okay now ?

---
 .gitignore               | 3 +--
 Makefile                 | 4 ++--
 scripts/Makefile.dtbinst | 3 +++
 scripts/Makefile.lib     | 4 +++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/.gitignore b/.gitignore
index d01cda8e1177..0458c36f3cb2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,8 +17,7 @@
 *.bz2
 *.c.[012]*.*
 *.dt.yaml
-*.dtb
-*.dtb.S
+*.dtb*
 *.dwo
 *.elf
 *.gcno
diff --git a/Makefile b/Makefile
index 9e73f82e0d86..b84f5e0b46ab 100644
--- a/Makefile
+++ b/Makefile
@@ -1334,7 +1334,7 @@ endif
 
 ifneq ($(dtstree),)
 
-%.dtb: include/config/kernel.release scripts_dtc
+%.dtb %.dtbo: include/config/kernel.release scripts_dtc
 	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
 
 PHONY += dtbs dtbs_install dtbs_check
@@ -1816,7 +1816,7 @@ clean: $(clean-dirs)
 	@find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '*.ko.*' \
-		-o -name '*.dtb' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
+		-o -name '*.dtb' -o -name '*.dtbo' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
 		-o -name '*.dwo' -o -name '*.lst' \
 		-o -name '*.su' -o -name '*.mod' \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 50d580d77ae9..ba01f5ba2517 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -29,6 +29,9 @@ quiet_cmd_dtb_install = INSTALL $@
 $(dst)/%.dtb: $(obj)/%.dtb
 	$(call cmd,dtb_install)
 
+$(dst)/%.dtbo: $(obj)/%.dtbo
+	$(call cmd,dtb_install)
+
 PHONY += $(subdirs)
 $(subdirs):
 	$(Q)$(MAKE) $(dtbinst)=$@ dst=$(patsubst $(obj)/%,$(dst)/%,$@)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 213677a5ed33..30bc0a8e0087 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -86,7 +86,9 @@ extra-$(CONFIG_OF_ALL_DTBS)	+= $(dtb-)
 
 ifneq ($(CHECK_DTBS),)
 extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
+extra-y += $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
 extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
+extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
 endif
 
 # Add subdir path
@@ -324,7 +326,7 @@ cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ;
 		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
 	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
 
-$(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
+$(obj)/%.dtb $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
 DT_CHECKER ?= dt-validate
