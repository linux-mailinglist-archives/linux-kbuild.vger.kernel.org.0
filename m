Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871DA758E23
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jul 2023 08:53:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjGSGx2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Jul 2023 02:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjGSGx1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Jul 2023 02:53:27 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124601BFC
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jul 2023 23:53:27 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1b8b64850b0so278065ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Jul 2023 23:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689749606; x=1692341606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk80EAfGKzf/xri9kwXUcU9jVWCA389cS7mits424YA=;
        b=hZfYk8s83fiu9qJMl/X9eeiEHso/RSs7yW6z9Wd4QOJXrPTUwZWw+sEI2EigaKWYov
         bUlMTLDEhPpkWo5I1rNYWAltJx39Z1onOV154V4oafYxncnyU3vuUT8frNuFFZPZWpP4
         sNJEk1qXJa3TSwSTyzhhT0sdKlQTVXtnL1w54C40nOVMua+293bWzabVrHnnSwtuKSD0
         Y3zKmkNSyfX/+caa7YiolCq4GB500X+UT5Em6nBadbfPd1RFOkzFde1nUrkBWigDcpnR
         ljB59Er4UVznbrE7ZtDBA9awF5bkzok0gjqMdTOvwuT+mdcuoaGfCg450yrElzD1r2tr
         QJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689749606; x=1692341606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk80EAfGKzf/xri9kwXUcU9jVWCA389cS7mits424YA=;
        b=U7A+yvNSrdgTOTraGiBpfR+Upay/LQRX4iLHPk36K7ntcR9us/RfleTYuXVJBbHLcT
         VXWkdX1G3hyJb902w7/KwH1LS8zC7iGUjerlu624pXfzyC7lChw8k9j+v8/NrzsoRGs/
         DQeUjRBxxz6ghyARt6bgC7ejmTriJ4Ob33qSSvYfiFrVKEelUNYX009QqONXnTEiKI1Z
         7Qh7SUmXwuG/r5vWWX50gRjNWi057qcrrfIDXa0w/Ezhf1Mx6weBGvQjkcH3O3niXR8o
         wE81usBZ6/XOTBgH1hhkj/uJ2WBtql4d+TJXkcs7rG9ucVYdmo1fzcbIcwlWrW2wVqyf
         qi5A==
X-Gm-Message-State: ABy/qLbYarADcnCElSdCa+mIy//woZZ3yzm8hpeboABbRn4sDxvvewrr
        aVXpxqAt01JqK4hj2Iq4BmPsPw0mqNOFZmKIKzpuNg==
X-Google-Smtp-Source: APBJJlFM8GZq0vS9Wbtv7TglnMtHa09kaCapBO/DjhYtHqM+DjglEe9oSksGON+qIWme28eRBk5fjw==
X-Received: by 2002:a17:902:d4ce:b0:1b0:36ad:fdf5 with SMTP id o14-20020a170902d4ce00b001b036adfdf5mr394147plg.17.1689749606403;
        Tue, 18 Jul 2023 23:53:26 -0700 (PDT)
Received: from google.com (25.11.145.34.bc.googleusercontent.com. [34.145.11.25])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0067b643b814csm2550051pfb.6.2023.07.18.23.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 23:53:25 -0700 (PDT)
Date:   Wed, 19 Jul 2023 06:53:23 +0000
From:   Fangrui Song <maskray@google.com>
To:     Benjamin Gray <bgray@linux.ibm.com>
Cc:     llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands: add assembly files to compilation
 database
Message-ID: <20230719065323.uxuax6pzlpqcwgsl@google.com>
References: <20230719031912.224843-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230719031912.224843-1-bgray@linux.ibm.com>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2023-07-19, Benjamin Gray wrote:
>Like C source files, tooling can find it useful to have the assembly
>source file compilation recorded.
>
>The .S extension appears to used across all architectures.
>
>Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
>
>---
>
>For example, I'm prototyping adding ASM support to clangd. It can use
>this information to determine the architecture, macros definitions,
>include paths, etc. on a per-file basis. I can capture this during
>compilation with tools like bear, but given this script exists and the
>change is trivial it seems like a good idea to adjust this script too.
>---
> scripts/clang-tools/gen_compile_commands.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
>index 15ba56527acd..a84cc5737c2c 100755
>--- a/scripts/clang-tools/gen_compile_commands.py
>+++ b/scripts/clang-tools/gen_compile_commands.py
>@@ -19,7 +19,7 @@ _DEFAULT_OUTPUT = 'compile_commands.json'
> _DEFAULT_LOG_LEVEL = 'WARNING'
>
> _FILENAME_PATTERN = r'^\..*\.cmd$'
>-_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.c) *(;|$)'
>+_LINE_PATTERN = r'^savedcmd_[^ ]*\.o := (.* )([^ ]*\.[cS]) *(;|$)'
> _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
> # The tools/ directory adopts a different build system, and produces .cmd
> # files in a different format. Do not support it.
>-- 
>2.41.0
>

Yes, this is also useful for my tool ccls:)
I agree that for assembly files, the compile_commands.json entries are
only useful for C preprocessing directives like #include and macros, so
.S files are needed but .s files are not. In addition, the kernel doesn't seem to have .s
files.

Reviewed-by: Fangrui Song <maskray@google.com>
