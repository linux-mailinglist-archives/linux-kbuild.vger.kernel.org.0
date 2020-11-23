Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9BF62C1962
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 00:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgKWXWP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 18:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgKWXWO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 18:22:14 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE51C0613CF;
        Mon, 23 Nov 2020 15:22:14 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id d9so18782965qke.8;
        Mon, 23 Nov 2020 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LQnTTbrjFIzQtonW7hPRPMWJaMT5ZjIxqKt5qVmkYec=;
        b=hG2kRKHlhPCbPwUiY3Bk8iYk0KvL8bcPEFwF10PM3zLxm1J4QjTay3rc53ZxhMMoMM
         hL07bEpzKfo/u56GAMJZFXD/6MDsKy0fWELnD2aFR8oVvLHmvmXNMcQsPqJunY8kxPxS
         TGyjuXLLcvry8QHj5am759ylzh/96s7r0Xud7vf9pj8nurL4hm0VDzSX2/DZth9lHlyT
         HwwTuxVy057oyBcvhx3gSfc2uQ3ZuZ4kmybn3DBccDXQ8dDDAw2XEqRs688eEqphNIH6
         C4W4RSMROCCluK8wzlsdT/iE8ywRaL6k4CaBByYWxzvNsTRxnYKlkBzDYuvPK6xgF0M4
         go1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=LQnTTbrjFIzQtonW7hPRPMWJaMT5ZjIxqKt5qVmkYec=;
        b=tjd5Gj5uyTfDD6ay1tW338X7lVF1UHs++jMh3PMbixlx+tPzohY16Avu9heRg/KOlE
         2kGnR9JmWfzmJiesLTAev6cpzkJxsIAIzJVNT6FPSJjat+aS3yBpZI9iZYQm0hKZQ21E
         k7Y8rcGcgUfYTLRyHOmhGXstqnASVsLBw36TkdeMFlj+dwg5JPgoiFuv8mRcdGwnyTpf
         YtnUS/DDProywPTKQC8iDpMLPNjADM53kDh+ZXOnIs4iiSzAOj/HE+stKJgL1HhairCv
         gvDcOsmY657FFF8Ak8PLI9sSyBG/WVdT4/2ROP7+KiPo9TeqGa8NCX3fgJDAIW4LMj7S
         y+og==
X-Gm-Message-State: AOAM533QzOOdm3S163wmZHPe6NJmpk2mfKRf6AQY4kPy1XhFSd2bl5NR
        ud4DPuSFwUgQqclfpLZqWf4=
X-Google-Smtp-Source: ABdhPJxKRe0WUN8BkhUZ39TUrDpXpcsN9G+/in5Ra7Wv4QHpBOniAr2ZNMtMVeCDZoAQemmMYHvGDw==
X-Received: by 2002:a05:620a:88e:: with SMTP id b14mr1992029qka.195.1606173733142;
        Mon, 23 Nov 2020 15:22:13 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id z73sm7208464qkb.112.2020.11.23.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 15:22:12 -0800 (PST)
Sender: Arvind Sankar <niveditas98@gmail.com>
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Mon, 23 Nov 2020 18:22:10 -0500
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
Message-ID: <20201123232210.GA208735@rani.riverdale.lan>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
 <20201104005343.4192504-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201104005343.4192504-4-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 03, 2020 at 04:53:42PM -0800, Nick Desaulniers wrote:
> Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice. Adds an
> explicit CONFIG_DEBUG_INFO_DWARF2, which is the default. Does so in a
> way that's forward compatible with existing configs, and makes adding
> future versions more straightforward.
> 
> Suggested-by: Fangrui Song <maskray@google.com>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile          | 14 ++++++++------
>  lib/Kconfig.debug | 19 +++++++++++++++----
>  2 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 75b1a3dcbf30..e23786a4c1c7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -826,12 +826,14 @@ else
>  DEBUG_CFLAGS	+= -g
>  endif
>  
> -ifndef LLVM_IAS
> -KBUILD_AFLAGS	+= -Wa,-gdwarf-2
> -endif
> -
> -ifdef CONFIG_DEBUG_INFO_DWARF4
> -DEBUG_CFLAGS	+= -gdwarf-4
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> +DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
> +ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
> +# Binutils 2.35+ required for -gdwarf-4+ support.
> +dwarf-aflag	:= $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y))
> +DEBUG_CFLAGS	+= $(dwarf-aflag)
> +KBUILD_AFLAGS	+= $(dwarf-aflag)
>  endif
>  

For LLVM_IAS=1, adding dwarf-aflag to DEBUG_CFLAGS should not be
necessary, no? This seems to add it for dwarf-4.

The as-option check will only work on binutils 2.35.1 onwards: earlier
versions will silently accept any -gdwarf-N option. Do we care? I think
it'll just get dwarf-2 for assembly files even though dwarf-4 might have
been configured. The earlier versions only error if the double-hyphen
form --gdwarf-N is used.

More generally, do we want to force this option via -Wa or should we
leave it up to the compiler driver when we can? For both Clang/IAS and
gcc/binutils, passing -gdwarf-N in KBUILD_AFLAGS will allow the compiler
to pass on the appropriate option to the assembler (with gcc you only
get --gdwarf-2 for the assembler except on trunk though). The only case
that would absolutely require -Wa is Clang without IAS, might be worth
adding the ability to pass on the flag to the external assembler?

Btw, is -gsplit-dwarf at all useful for assembler files?
