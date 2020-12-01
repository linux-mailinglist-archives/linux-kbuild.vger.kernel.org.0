Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606732C9668
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 05:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgLAETV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 23:19:21 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:35489 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgLAETU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 23:19:20 -0500
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0B14IKKj021660;
        Tue, 1 Dec 2020 13:18:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0B14IKKj021660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606796300;
        bh=GMCnYM+voihvO7OPv2mqIVM7rj+QDDQzTVQXG07MvGI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TG81yAjY1idEUthd84zQkpIZ3TMytSylasR1ZjbVj2sGLPJizj9QFfC0lncrt1wb2
         nyg9FFzi+e7uczvGqm7v2QyC0xbjsdMS/U5/1Q8XwP9a4X8eQi7JjGsqzCFo0whp58
         AVz4FtYoFrN6yRT1zgefB9POp6ZHRrRxfGEkhFkl4HMpk7nUGy41PbiEEgQx0L3dt+
         nLGBFH5KL2CJePXg2p47vtHqkJISEp9ErmJSUxddSMlPZC7ZPeqscNz1IsgVzL1zhx
         OAJdU/rFvcb6mWOBmFfoI5b+RwXhC1NKZPCFFUk9RXHwpJ46yoXBEiaIvlrvEU9VIB
         CUNVpm7gc/+lg==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id j13so434939pjz.3;
        Mon, 30 Nov 2020 20:18:20 -0800 (PST)
X-Gm-Message-State: AOAM530EcbnmI+ypUVn5nk5fdBFXOrBmlnerc/8D92LDnmSu6Zsn4+XG
        0yZrpk4d0YDbnuEZBwVfZ4E8imFF0mksPb6DUNQ=
X-Google-Smtp-Source: ABdhPJzJYk+YCcfYVbfJ2uBjcUqgstH4E28KmqXmlb16hsg5sT1z+ueAiUcjeCgR3pq73cDye9tk1+GC0wtFJxzBHdg=
X-Received: by 2002:a17:90a:5905:: with SMTP id k5mr792484pji.198.1606796299598;
 Mon, 30 Nov 2020 20:18:19 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-4-ndesaulniers@google.com>
 <CAK7LNAT5MQqUddv+QbFu5ToLBK3eUPArHSBR=5AOS3ONtMqKaw@mail.gmail.com> <CAKwvOdmPeOEA4dfODCKLE4A_M-SF5RBVFEf-NuiTkUTXAbh-5w@mail.gmail.com>
In-Reply-To: <CAKwvOdmPeOEA4dfODCKLE4A_M-SF5RBVFEf-NuiTkUTXAbh-5w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 13:17:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNATMjv84JCNX7ZDNkhA13he8SZYHES1i5k5EZzbD1iKqfA@mail.gmail.com>
Message-ID: <CAK7LNATMjv84JCNX7ZDNkhA13he8SZYHES1i5k5EZzbD1iKqfA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 1, 2020 at 5:45 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Mon, Nov 30, 2020 at 10:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, Nov 4, 2020 at 9:53 AM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > > Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice. Adds an
> > > explicit CONFIG_DEBUG_INFO_DWARF2, which is the default. Does so in a
> > > way that's forward compatible with existing configs, and makes adding
> > > future versions more straightforward.
> > >
> > > Suggested-by: Fangrui Song <maskray@google.com>
> > > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> > >  Makefile          | 14 ++++++++------
> > >  lib/Kconfig.debug | 19 +++++++++++++++----
> > >  2 files changed, 23 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 75b1a3dcbf30..e23786a4c1c7 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -826,12 +826,14 @@ else
> > >  DEBUG_CFLAGS   += -g
> > >  endif
> > >
> > > -ifndef LLVM_IAS
> > > -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > > -endif
> > > -
> > > -ifdef CONFIG_DEBUG_INFO_DWARF4
> > > -DEBUG_CFLAGS   += -gdwarf-4
> > > +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
> > > +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> > > +DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> > > +ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
> > > +# Binutils 2.35+ required for -gdwarf-4+ support.
> > > +dwarf-aflag    := $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y))
> > > +DEBUG_CFLAGS   += $(dwarf-aflag)
> >
> > This changes the behavior.
> >
> > For the Dwarf-2 case,
> >
> > Previously, -gdwarf-2 was passed to $(CC),
> > so the debug info was generated by gcc.
> >
> > Now, -Wa,-gdwarf-2 is passed to $(CC).
> > -gdwarf-2 is handled by GNU as.
> > So, the source info points to /tmp/<hash>.s
> > instead of the original .c file.
> >
> >
> >
> > Handling the Dwarf capability is very complicated.
> >
> > Are you still working for v3?
>
> Yes, I plan to revisit the series based on all of the feedback thus
> far.  Lately I'm focused on enabling LLVM_IAS=1 for Android; but I
> would like to see this land so that the Linux kernel may provide
> coverage and feedback to the toolchain developers for DWARF v5 (as
> well as reduced binary image sizes).  Maybe later this week I'll have
> time to revisit.
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdmPeOEA4dfODCKLE4A_M-SF5RBVFEf-NuiTkUTXAbh-5w%40mail.gmail.com.


In my understanding, the complexity comes from the fact
we are mixing up the $(CC) capability and $(AS) capability.

They are orthogonal if I understand correctly.


When building *.c files, the .debug* sections are generated by
gcc (or clang), and embedded into the intermediate *.s files.
The assembler (GAS or clang's IAS) simply transforms it
into byte stream in *.o. So we do not care about the assembler capability.


When building *.S files, the .debug* sections are generated by
the assembler. Here, the assembler capability is important.
Unless we use binutils 2.35+ or clang IAS,
DWARF v2 is the only possible choice.



So, we need two separate choices to handle this properly, I think.

The following is the rough sketch.





# The value is 2, 3, 4, or 5 depending on the assembler in use.
# Unfortunately, we cannot check this by $(cc-option, -Wa,-gdwarf-4)
# because GAS <= 2.34 accepts any -gdwarf-<N>.
# readelf --debug-dump=info and grep or something?
config AS_SUPPORTS_DWARF_VERSION
        int $(shell scripts/as_dwarf_support.sh)



choice
            "DWARF version for C code debugging"

config CC_DEBUG_INFO_DWARF2
            bool "..."

config CC_DEBUG_INFO_DWARF4
            bool "..."

config CC_DEBUG_INFO_DWARF5
            bool "..."
            depends on GCC_VERSION >= 700000 || CC_IS_CLANG
            depends on AS_SUPPORTS_DWARF_VERSION >= 5
            help
              gcc7+ or clang supports this.
              Unfortunately, we also need to check assembler capability
              because GAS <= 2.34 do not understand ".file 0"

endchoice



choice
            "DWARF version for assembly code debugging"

config AS_DEBUG_INFO_DWARF2
            bool "..."

config AS_DEBUG_INFO_DWARF4
            bool "..."
            depends on AS_SUPPORTS_DWARF_VERSION >= 4

config AS_DEBUG_INFO_DWARF5
            bool "..."
            depends on AS_SUPPORTS_DWARF_VERSION >= 5

endchoice






-- 
Best Regards
Masahiro Yamada
