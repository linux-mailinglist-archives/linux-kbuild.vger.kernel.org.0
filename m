Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92D7D4ECB43
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Mar 2022 20:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349678AbiC3SG4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Mar 2022 14:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349668AbiC3SGz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Mar 2022 14:06:55 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE1A3A717
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Mar 2022 11:05:08 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q14so28752928ljc.12
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Mar 2022 11:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h1gCGwBlFlPL7xlbgg8fVcArt1vxjlSJemINBQ6Dyvg=;
        b=pMOXFcNHgVw7MlgZ7yYEI8OIqBpCv7hHzDMln+BSnSNY+w1UBH0/mnhDTZYa2wz++N
         IVZAMs/0+Z7g4aFR7yNZrUVVucG6aeelreqX9D7ZHzcKwl0F7oYarSvbe0tnlzrgvk+6
         W0K/ANA7r6PjVTNIuVEDV7Cys+j8mpQwF7lLgTlgIL0FYGJD7tQGEPqGPYk9j0eVvPiW
         eWgbjzjR2B/gVYNdkAUT5ViAdlRMOBHxjDroMB7/wYDFp+qjh11p4MipYiygqNY/hK1W
         fQ4RILJY0OH1PCnJ/3CWJ4F5ZjF8Q3G96ruwjh2RHp5Ni34Y+kG+Znu09MLeRmtxEh8R
         rgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h1gCGwBlFlPL7xlbgg8fVcArt1vxjlSJemINBQ6Dyvg=;
        b=T2+ejX7WcKCz2jRXUoOB5HAhYKEVD9EqdvrBDoEXf/TejjGT0wWDV+vJ6s0Bb963WO
         5nL2wtjpoT3DHmGRCztP5yFOiMSUHp3Vmh0EQqgBwU+gdN6Po3XdH516T0DF4MdOl6Ia
         ouYQZUWNLMeraHgvDhJznDmivHErvNmzsRs4WDmzwlMfyP4pgs2d//T2G3JRKjW+mBsL
         E+hSofdl/qKCLGQX2/WHwzkyD0jvOpKgDAxLzQhH7XKv4F9hY4PKEcT70tNM9O7vWdQL
         XUlZtBDgdoUA/cUyYv7hGhEWr/JOWVyhJwGtivzbeuwQmrUfAOYmIszqZP4tRW3c1/8i
         8fag==
X-Gm-Message-State: AOAM531i/Lb6IABIQyQvPb1mXTSf+rboN7v4ql9bulc9ZHab92441xLx
        DsCQVOmGGy62CRhrnX2lwsPCo40Fe8/v4ERROifRKw==
X-Google-Smtp-Source: ABdhPJzOPCdLzAuEzhP8+XwDRinp5ZhGqb9riWqDAp9YgXyUtPNaoWWz9lFTRmIqu6uYrLte8Tx/X6kn1S35WUT6kUU=
X-Received: by 2002:a2e:7808:0:b0:24a:eacb:ab9f with SMTP id
 t8-20020a2e7808000000b0024aeacbab9fmr3138533ljc.468.1648663501997; Wed, 30
 Mar 2022 11:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <164847778869.3060675.8115416881394543419.stgit@devnote2>
In-Reply-To: <164847778869.3060675.8115416881394543419.stgit@devnote2>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 30 Mar 2022 11:04:50 -0700
Message-ID: <CAKwvOdmAYQZtzGudBjmiRZNjT+VixTdNbJmYmxc7-gQNCsHfrA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] bootconfig: Support embedding a bootconfig in
 kernel for non initrd boot
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Padmanabha Srinivasaiah <treasure4paddy@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 28, 2022 at 7:29 AM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> KNOWN ISSUE:
>
> According to the report from Padmanabha[3] and my analysis [4], the embedded
> bootconfig data may not be updated if you do incremental build the kernel
> with CONFIG_LTO_CLANG_THIN.
>
> [3] https://lore.kernel.org/all/20220321183500.GA4065@pswork/T/#u
> [4] https://lore.kernel.org/all/20220327115526.cc4b0ff55fc53c97683c3e4d@kernel.org/
>
> This seems like clang's LTO Thin mode issue. It may not detect the inline
> asm depends on external files.
>
> I think the possible workaround is to split the inline asm which includes
> '.incbin' directive into an asm file. But this should be done in another
> seires because there are other features which uses '.incbin'. (e.g.
> /proc/config.gz)

Hi Masami,
I saw Padmanabha's report (thanks for the report); sorry for not
responding sooner, I've been traveling recently for a funeral.

Any chance we can use

CFLAGS_REMOVE_<file>.o := $(CC_FLAGS_LTO)

a la
commit d2dcd3e37475 ("x86, cpu: disable LTO for cpu.c")

with a comment linking to
https://github.com/ClangBuiltLinux/linux/issues/1618

for the Translation Units using .incbin, until we have had more time
to triage+fix?

-- 
Thanks,
~Nick Desaulniers
