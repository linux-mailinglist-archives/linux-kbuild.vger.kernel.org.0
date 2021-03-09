Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6490F332F78
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 21:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhCIT77 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 14:59:59 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52708 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbhCIT7g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 14:59:36 -0500
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 129JxHaT012316;
        Wed, 10 Mar 2021 04:59:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 129JxHaT012316
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615319958;
        bh=wou3lyafM4ONQKR6kN74QI87FmicL9SFVho3ygkDglM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sjmwAI9xvm2Zy6LtpLeE852Wy9RroQWF2TUSaLlRLLO+bm8mDSWKQ4HxUGdMjf8qD
         1l+ZGyu2sK8hSRmTKQC0M5WK2r3fOMkXFEZZWDAG6g1ZH25o5+BiYkqxBqXfmWMRmY
         jOMGu3WYFA2FfnAmyTndTg5ZQOmjogeH08282/xGbtCQjK8n7YQms/oHN2u7pq0cCb
         ITT1bAgOAbXloH4PvaLrJj6lxITcUnkwtIwZDPYuwWyIILup4mXgmW/aWINtrfxkPT
         //QHVknwFKoKVDm1c5RwKsfWe8xCrhuYI89vEq/tuGxY8vxU7IUSb97NZxSVhOxwQm
         rOvy1lHgmVN4w==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id u18so7139907plc.12;
        Tue, 09 Mar 2021 11:59:17 -0800 (PST)
X-Gm-Message-State: AOAM530YjikXgjSeoPt2ddpc9QerNhhYU2AxJTdSriNHzQFNXyEvPHjl
        kaIAbKwsHDECKlqI6hwTL8fxFBCN55PHcpsZTs8=
X-Google-Smtp-Source: ABdhPJyu7CPo4ikfEtebKPQYUBDnx6k1ucJhvEHaGxy8qyVnzrQco83OIsQDbKZALU41Il9x7uyqrLaQR9YDlllaMhI=
X-Received: by 2002:a17:90a:dc08:: with SMTP id i8mr6060446pjv.153.1615319956989;
 Tue, 09 Mar 2021 11:59:16 -0800 (PST)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <20210302210646.3044738-2-nathan@kernel.org>
 <CAK7LNARd7pM7SCKJOS=_ZDE+-Q_buDOfw_u0vsfof6G1FWXvOQ@mail.gmail.com>
In-Reply-To: <CAK7LNARd7pM7SCKJOS=_ZDE+-Q_buDOfw_u0vsfof6G1FWXvOQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 04:58:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0tdK+BEzs=39A4XbCXjAsbyyFp6fgXfhjP+5v_Nsddw@mail.gmail.com>
Message-ID: <CAK7LNAQ0tdK+BEzs=39A4XbCXjAsbyyFp6fgXfhjP+5v_Nsddw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: Only specify '--prefix=' when building with
 clang + GNU as
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 4:55 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Mar 3, 2021 at 6:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > When building with LLVM_IAS=1, there is no point to specifying
> > '--prefix=' because that flag is only used to find the cross assembler,
> > which is clang itself when building with LLVM_IAS=1. All of the other
> > tools are invoked directly from PATH or a full path specified via the
> > command line, which does not depend on the value of '--prefix='.
> >
> > Sharing commands to reproduce issues becomes a little bit easier without
> > a '--prefix=' value because that '--prefix=' value is specific to a
> > user's machine due to it being an absolute path.
> >
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
>
> I was tricked by a couple of Reviewed-by/Tested-by tags.
>
> With this patch applied, the code looks as follows:
>
>
> ifneq ($(CROSS_COMPILE),)
> CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
> ifneq ($(LLVM_IAS),1)
> GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> CLANG_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> CLANG_FLAGS += -no-integrated-as
> endif
> endif
>
>
> For the native build (empty CROSS_COMPILE),
> you cannot add -no-integrated-as.
>
>
> I dropped this from my tree.
>
>
>
> Is the correct code as follows?
>
>
> ifneq ($(LLVM_IAS),1)
> CLANG_FLAGS += -no-integrated-as
> ifneq ($(CROSS_COMPILE),)
> CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
> GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> CLANG_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> endif
> endif
>
>
>
>


If you send v2, can you include comments from Fangrui Song?



    Fangrui Song:
      clang can spawn GNU as (if -f?no-integrated-as is specified) and GNU
      objcopy (-f?no-integrated-as and -gsplit-dwarf and -g[123]).
      objcopy is only used for GNU as assembled object files.
      With integrated assembler, the object file streamer creates .o and
      .dwo simultaneously.
      With GNU as, two objcopy commands are needed to extract .debug*.dwo to
      .dwo files && another command to remove .debug*.dwo sections.



I did not know the objtool part, and I think it is worth recording.


-- 
Best Regards
Masahiro Yamada
