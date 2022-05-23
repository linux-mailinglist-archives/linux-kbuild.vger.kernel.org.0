Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8E3531A5F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 May 2022 22:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbiEWTyM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 May 2022 15:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbiEWTyM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 May 2022 15:54:12 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13C6562BFD
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2022 12:54:10 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso282466pjg.0
        for <linux-kbuild@vger.kernel.org>; Mon, 23 May 2022 12:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O4+xOyqn0DlQXpBjw3fsuM8J9adeD3sXmNoLX1130DM=;
        b=VDNuzx6fJMXmw8XNqCUtAVCF02j4OmsqvvTf5vsnBCotQDMHYtj33uCT5ocfpE3D8B
         cnNLiyFE6mRLGz2/sdfOx1lpRXuJuSayIu45co+2FJj1Fw3D9/ri37qdcaEXMk1SEOuz
         7Ihg2BhmblaAFoDBviQBO+f2O9yMZrE5akEzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O4+xOyqn0DlQXpBjw3fsuM8J9adeD3sXmNoLX1130DM=;
        b=LHnkc/HK/D22aEcBEvzwq4gqvF521FC0D1BDZwaE6JuC6RxMISu5Kde8jjeQ71DkoX
         goMGiohek+iVGy+roRLXVHTJs5FCNDRGKJm20nQWK9f5D0iiMqytIEKl3S5exi7/1auT
         +P8zeUzhfzPLOorXvLGeH4oZhVOpXCI75fulEsv2UTnh5Y9U4qIlazN5s+EfsU1taGVP
         iKKrzeLPcSRymz3RalotQlIUTU1RugWgGgfpTem/IkRifRvTvTJIFCVbUkncO70m9SZK
         d6XIB/FHoLl4HB0N43tQJ6df4F/fMN9d7m6X0ho/rXOoYL56Dub3ej4xnl2y0GyiJQVg
         uA/g==
X-Gm-Message-State: AOAM5323zUG+xLj2AHkXHEeqDJ520nyowrlxcfyN2mtB0BjjOFMPIAh4
        pICMxpCmsBxpj5RF2PRDJ+uhUg==
X-Google-Smtp-Source: ABdhPJxjo5+Q7vy0iVeBvm613vAmply7oSL/QolxFDJ1Xc864vcJBNlii5BlTvQdRkEHxhDc99JGkA==
X-Received: by 2002:a17:90a:aa8a:b0:1c9:bfd8:9a90 with SMTP id l10-20020a17090aaa8a00b001c9bfd89a90mr650355pjq.118.1653335649635;
        Mon, 23 May 2022 12:54:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902f78900b0015e8d4eb292sm3534189pln.220.2022.05.23.12.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 12:54:09 -0700 (PDT)
Date:   Mon, 23 May 2022 12:54:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Alexander Popov <alex.popov@linux.com>,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gcc-plugins: Change all version strings match kernel
Message-ID: <202205231251.39D012E@keescook>
References: <20220510235412.3627034-1-keescook@chromium.org>
 <20220523143054.GA3164771@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220523143054.GA3164771@roeck-us.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 23, 2022 at 07:30:54AM -0700, Guenter Roeck wrote:
> On Tue, May 10, 2022 at 04:54:12PM -0700, Kees Cook wrote:
> > It's not meaningful for the GCC plugins to track their versions separately
> > from the rest of the kernel. Switch all versions to the kernel version.
> > 
> > Fix mismatched indenting while we're at it.
> > 
> > Cc: linux-hardening@vger.kernel.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> I see random build failures with this patch in linux-next.
> 
> Error log:
> cc1plus: fatal error: ./include/generated/utsrelease.h: No such file or directory
> 
> The problem doesn't happen all the time. Is there some missing dependency ?

Here's a prior report I hadn't been able to repro:
https://lore.kernel.org/linux-mm/202205230239.EZxeZ3Fv-lkp@intel.com

But now I can: I see it with a -j1 build. This fixes it for me:

diff --git a/Makefile b/Makefile
index 91c91fcf3c24..c04420d5aa3d 100644
--- a/Makefile
+++ b/Makefile
@@ -1175,7 +1175,7 @@ include/config/kernel.release: FORCE
 # Carefully list dependencies so we do not try to build scripts twice
 # in parallel
 PHONY += scripts
-scripts: scripts_basic scripts_dtc
+scripts: include/generated/utsrelease.h scripts_basic scripts_dtc
 	$(Q)$(MAKE) $(build)=$(@)
 
 # Things we need to do before we recursively start building the kernel
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 6f0aecad5d67..c29334669a16 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -64,5 +64,5 @@ $(foreach m, $(notdir $(plugin-multi)), $(eval $(obj)/$m: $(addprefix $(obj)/, $
 quiet_cmd_plugin_cxx_o_c = HOSTCXX $@
       cmd_plugin_cxx_o_c = $(HOSTCXX) $(plugin_cxxflags) -c -o $@ $<
 
-$(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
+$(plugin-objs): $(obj)/%.o: $(src)/%.c $(objdir)/include/generated/utsrelease.h FORCE
 	$(call if_changed_dep,plugin_cxx_o_c)

Both "include/generated/utsrelease.h" and "scripts" were same-level
deps, so they were racing. 

-- 
Kees Cook
