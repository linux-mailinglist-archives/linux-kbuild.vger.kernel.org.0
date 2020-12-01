Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1011F2C95EB
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 04:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgLADkA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 22:40:00 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:64634 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgLADkA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 22:40:00 -0500
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0B13csUM026029;
        Tue, 1 Dec 2020 12:38:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0B13csUM026029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606793935;
        bh=klnIxU/X1XewPCmJJ5YCEqINrZ5cJIhv7zjgLd01Ez0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HKzTzrV5a/XTqJDzhOj3TIUC+5Lk0koanda6mtUxMn2p06CLJ4IMbfcK0EKyFrTw3
         jFx893o72qwbhqKy+9xECnlOk2yL6ReMOuNmMXgnLWGZbop+t/wnlBFPuixvxBV4Tz
         FcXaytLnQ9QyPWtgW0FNCEXLULfLmzvPBmZhYiOJY+wo0oHkB+R+CJ2kOZbWyzr2vI
         2zrv1xbXtnfva3fWpOBLO08K7gONfo3k/P6YA06KDBP2aL5YTbYrnG2X+yu5Blf2uf
         zszjIwGwLWcHTP5OE0H+bo1oZg7O7jhq9ZsX8z2IibN04mzaTu8sY3m2oI16ccBYVq
         JL4TVBuau9k7w==
X-Nifty-SrcIP: [209.85.214.174]
Received: by mail-pl1-f174.google.com with SMTP id v21so324185plo.12;
        Mon, 30 Nov 2020 19:38:54 -0800 (PST)
X-Gm-Message-State: AOAM533xa21XJ2j/QxsU9QJKr7iHjDQLIpEfUeu3cVFt3Y/epCMjhzsu
        D3cliMcLsma0j4CYYRH7m7rtr43+JeTDPioZmP0=
X-Google-Smtp-Source: ABdhPJy7FhhJ9yNK8Z5qJ3jcI1HUIh2OA3OIVnaSDzfapbtVbcYzBwKIDeRJROOFBmz9MsBA1+hwufB5Y8yt4cxT5do=
X-Received: by 2002:a17:90a:5905:: with SMTP id k5mr651001pji.198.1606793934218;
 Mon, 30 Nov 2020 19:38:54 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com> <20201104005343.4192504-4-ndesaulniers@google.com>
 <CAK7LNAT5MQqUddv+QbFu5ToLBK3eUPArHSBR=5AOS3ONtMqKaw@mail.gmail.com> <CAFP8O3Ki9HoqcV450fn29fBOWAbmuGAdB6USLz8pGsW4Vzf7sg@mail.gmail.com>
In-Reply-To: <CAFP8O3Ki9HoqcV450fn29fBOWAbmuGAdB6USLz8pGsW4Vzf7sg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 12:38:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_hxevOS7hKxepyCBVU-4j87Yf5Y8DB6mFq+4xuaz3AA@mail.gmail.com>
Message-ID: <CAK7LNAS_hxevOS7hKxepyCBVU-4j87Yf5Y8DB6mFq+4xuaz3AA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
To:     =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 1, 2020 at 5:27 AM 'F=C4=81ng-ru=C3=AC S=C3=B2ng' via Clang Bui=
lt Linux
<clang-built-linux@googlegroups.com> wrote:
>
> On Mon, Nov 30, 2020 at 10:05 AM Masahiro Yamada <masahiroy@kernel.org> w=
rote:
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
> > >  DEBUG_CFLAGS   +=3D -g
> > >  endif
> > >
> > > -ifndef LLVM_IAS
> > > -KBUILD_AFLAGS  +=3D -Wa,-gdwarf-2
> > > -endif
> > > -
> > > -ifdef CONFIG_DEBUG_INFO_DWARF4
> > > -DEBUG_CFLAGS   +=3D -gdwarf-4
> > > +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) :=3D 2
> > > +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) :=3D 4
> > > +DEBUG_CFLAGS   +=3D -gdwarf-$(dwarf-version-y)
> > > +ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
> > > +# Binutils 2.35+ required for -gdwarf-4+ support.
> > > +dwarf-aflag    :=3D $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-vers=
ion-y))
> > > +DEBUG_CFLAGS   +=3D $(dwarf-aflag)
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
> >
> >
> >
> > > +KBUILD_AFLAGS  +=3D $(dwarf-aflag)
> > >  endif
> > >
> > >  ifdef CONFIG_DEBUG_INFO_REDUCED
> > > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > > index 83a860126897..03c494eefabd 100644
> > > --- a/lib/Kconfig.debug
> > > +++ b/lib/Kconfig.debug
> > > @@ -256,14 +256,25 @@ config DEBUG_INFO_SPLIT
> > >           to know about the .dwo files and include them.
> > >           Incompatible with older versions of ccache.
> > >
> > > +choice
> > > +       prompt "DWARF version"
> > > +       help
> > > +         Which version of DWARF debug info to emit.
> > > +
> > > +config DEBUG_INFO_DWARF2
> > > +       bool "Generate DWARF v2 debuginfo"
> > > +       help
> > > +         Generate DWARF v2 debug info.
> > > +
> > >  config DEBUG_INFO_DWARF4
> > >         bool "Generate dwarf4 debuginfo"
> > >         depends on $(cc-option,-gdwarf-4)
> > >         help
> > > -         Generate dwarf4 debug info. This requires recent versions
> > > -         of gcc and gdb. It makes the debug information larger.
> > > -         But it significantly improves the success of resolving
> > > -         variables in gdb on optimized code.
> > > +         Generate DWARF v4 debug info. This requires gcc 4.5+ and gd=
b 7.0+.
> > > +         It makes the debug information larger, but it significantly
> > > +         improves the success of resolving variables in gdb on optim=
ized code.
> > > +
> > > +endchoice # "DWARF version"
> > >
> > >  config DEBUG_INFO_BTF
> > >         bool "Generate BTF typeinfo"
> > > --
> > > 2.29.1.341.ge80a0c044ae-goog
>
>
> We can bump -Wa,-gdwarf-2 to -Wa,-gdwarf-3 since GNU actually emits
> DWARF v3 DW_AT_ranges (see
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D26850 )
> This can avoid the `warning: DWARF2 only supports one section per
> compilation unit` warning for Clang.


I am not a DWARF spec expert.

Please teach me.

In my understanding, "DWARF2 only supports one section ..."
is warned only when building .S files with LLVM_IAS=3D1

If this is due to the limitation of DWARF v2, why is it OK to
build .c files with LLVM_IAS?



>
> Deleting -Wa,-gdwarf-2 also sounds good to me if people can verify
> their debugging experience is not regressed (I believe it is useless).
>
>
> --
> =E5=AE=8B=E6=96=B9=E7=9D=BF
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/CAFP8O3Ki9HoqcV450fn29fBOWAbmuGAdB6USLz8pGsW4Vzf7sg%40m=
ail.gmail.com.



--=20
Best Regards
Masahiro Yamada
