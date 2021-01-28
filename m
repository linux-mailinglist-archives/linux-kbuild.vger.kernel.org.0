Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C036D3080A5
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 22:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbhA1Vj4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 16:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbhA1Vjx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 16:39:53 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCF8BC061573;
        Thu, 28 Jan 2021 13:39:12 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id y19so7193030iov.2;
        Thu, 28 Jan 2021 13:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=/CjtAu+M0Wiwb7WvO8Hl9jt0o2jkZcEdDdnm/nslick=;
        b=cNJfHShSZNqv2p1/RS1cbidNNc1ZHk7+hWQ/pXoPuGzIFWn7//JcP9pjRelwaPuM8n
         8MtbrLmWlBBmlRTFa6II47YAzv8VnDcyJlOCcKNukl66+mn6MkFCQ2494/2o9BFbbQPT
         cVbWsDKdnEB/oJ4jeZL9gZfLTnGo6HgPAWJZ10nCxf3swM0pilVP4C217MqUiPSgIM3w
         RcKPHbVuhHPmIYVlN0S+OmnUB1d/h0N/s9/vsiIghA9g4QZyM/QeYYDKU8sBuqy0qep2
         9X/oDW1TfnK85pI/mnfDIQDOxWkJWyO7GaE6ziQVokC4TFiZ98JNvk/FYWe5zUUTCxZF
         jh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=/CjtAu+M0Wiwb7WvO8Hl9jt0o2jkZcEdDdnm/nslick=;
        b=nRs4x8g2s0UGkw3T1NwjO1um6jqvt60UGofH9zSKCj8pVw76C7YSHPxNsd30XfhkUl
         ihtqRU60Z2IfzDDecN7kp+4b7OtH1VEp0viO+ZpqC7/6+SmwS/yhxqiAv438E7GOAWiY
         amOWZxw8dMouRZPFbjZlLWJqeweTd42+VCjH8ocFDnPzuBFFbNjQf6q5KIv4AV/A5FI+
         MDV9Oy/rxGR8JZLAtFFVnLepq4+OHLU0cq7B/Df+u1++nl4TIe6NeOmPCGyAhhU5rKVE
         Q4Osk2AnTAJhq3yRmFWpT+eJWDdKAMnOdyvDhJtiWyKVYULv6iykwnLnCBYs8FQBngQE
         N+vQ==
X-Gm-Message-State: AOAM531YQLDMTeQL0jXkP+lw7Wo4RcuAY6xj0ZPLbdfotQxbIfaK0PCQ
        RPeLMVenuYcwq7TLIKYgdy0QGB6rsr4FfaEV+1N1O3osT20b8kGf
X-Google-Smtp-Source: ABdhPJzMFqDbTyZ0mbvOAHSV8w+9kchEZ3F2bXMGeWdudZ253jzU13J5Bx3IMtxekV7DyA8uNTmcBV9o3a9ji+LKnAk=
X-Received: by 2002:a05:6602:2b01:: with SMTP id p1mr1647556iov.156.1611869951999;
 Thu, 28 Jan 2021 13:39:11 -0800 (PST)
MIME-Version: 1.0
References: <20210121082451.2240540-1-morbo@google.com> <20210122101156.3257143-1-morbo@google.com>
 <CAKwvOdm+3o8z2GivPjSJRa=c=UKdfkiY-79s6yn2BxJkFnoFTw@mail.gmail.com>
 <CA+icZUU=XfwqMcXYonQKcD4QgqTBW-mA+d_84b7cU2R3HYPOSQ@mail.gmail.com>
 <CAKwvOdnUm2FqC0CEF3qFuMCaWoqiUMqr7ddMjA2UNsJugA9DNQ@mail.gmail.com>
 <CA+icZUWJu0FWdRY0DMQxpYwjqq1WTB87y9u1-6t3YMmkR3UsBQ@mail.gmail.com> <CAKwvOdnVic2MiVSkiTQGGKPFKtJrf=kt1LgjWejOK6mMtMiX3Q@mail.gmail.com>
In-Reply-To: <CAKwvOdnVic2MiVSkiTQGGKPFKtJrf=kt1LgjWejOK6mMtMiX3Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 28 Jan 2021 22:39:00 +0100
Message-ID: <CA+icZUUVpUban7Fka6xE9fXzgZT+SuFWeMfLELMNdKVD4O0TXA@mail.gmail.com>
Subject: Re: [PATCH v7] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 10:24 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jan 28, 2021 at 1:19 PM Sedat Dilek <sedat.dilek@gmail.com> wrote=
:
> >
> > On Thu, Jan 28, 2021 at 10:12 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Thu, Jan 28, 2021 at 12:46 PM Sedat Dilek <sedat.dilek@gmail.com> =
wrote:
> > > >
> > > > [ LLVM ]
> > > >
> > > > Today, I switched over to LLVM version 12.0.0-rc1.
> > > >
> > > >
> > > > [ Step #1: 5.11.0-rc5-5-amd64-clang12-pgo ]
> > > >
> > > > My first kernel was built with CONFIG_PGO_CLANG=3Dy and LLVM=3D1 pl=
us LLVM_IAS=3D1.
> > > >
> > > > [ start-build_5.11.0-rc5-5-amd64-clang12-pgo.txt ]
> > > > dileks    193090  193065  0 06:54 pts/2    00:00:00 /usr/bin/perf_5=
.10
> > > > stat make V=3D1 -j4 HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTLD=3Dld.ll=
d CC=3Dclang
> > > > LD=3Dld.lld LLVM=3D1 LLVM_IAS=3D1 PAHOLE=3D/opt/pahole/bin/pahole
> > > > LOCALVERSION=3D-5-amd64-clang12-pgo KBUILD_VERBOSE=3D1
> > > > KBUILD_BUILD_HOST=3Diniza KBUILD_BUILD_USER=3Dsedat.dilek@gmail.com
> > > > KBUILD_BUILD_TIMESTAMP=3D2021-01-28 bindeb-pkg
> > > > KDEB_PKGVERSION=3D5.11.0~rc5-5~bullseye+dileks1
> > > >
> > > > Config: config-5.11.0-rc5-5-amd64-clang12-pgo
> > > >
> > > >
> > > > [ Step #2: x86-64 defconfig & vmlinux.profdata ]
> > > >
> > > > Booted into 5.11.0-rc5-5-amd64-clang12-pgo and built an x86-64
> > > > defconfig to generate/merge a vmlinux.profdata file.
> > > >
> > > > [ start-build_x86-64-defconfig.txt ]
> > > > dileks     18430   15640  0 11:15 pts/2    00:00:00 make V=3D1 -j4
> > > > HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTLD=3Dld.lld CC=3Dclang LD=3Dld=
.lld LLVM=3D1
> > > > LLVM_IAS=3D1
> > > >
> > > > Script: profile_clang-pgo.sh
> > > > Config: dot-config.x86-64-defconfig
> > > >
> > > >
> > > > [ Step #3.1: 5.11.0-rc5-6-amd64-clang12-pgo & GNU-AS ]
> > > >
> > > > The first rebuild with CONFIG_PGO_CLANG=3Dn and "LLVM=3D1
> > > > KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata".
> > > > I was able to boot into this one.
> > > > Used assembler: GNU-AS 2.35.1
> > > >
> > > > [ start-build_5.11.0-rc5-6-amd64-clang12-pgo.txt ]
> > > > dileks     65734   65709  0 11:54 pts/2    00:00:00 /usr/bin/perf_5=
.10
> > > > stat make V=3D1 -j4 HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTLD=3Dld.ll=
d CC=3Dclang
> > > > LD=3Dld.lld PAHOLE=3D/opt/pahole/bin/pahole
> > > > LOCALVERSION=3D-6-amd64-clang12-pgo KBUILD_VERBOSE=3D1
> > > > KBUILD_BUILD_HOST=3Diniza KBUILD_BUILD_USER=3Dsedat.dilek@gmail.com
> > > > KBUILD_BUILD_TIMESTAMP=3D2021-01-28 bindeb-pkg
> > > > KDEB_PKGVERSION=3D5.11.0~rc5-6~bullseye+dileks1 LLVM=3D1
> > > > KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata
> > > >
> > > > Config: config-5.11.0-rc5-6-amd64-clang12-pgo
> > > >
> > > >
> > > > [ Step #3.2: 5.11.0-rc5-7-amd64-clang12-pgo & Clang-IAS ]
> > > >
> > > > The second rebuild with CONFIG_PGO_CLANG=3Dn and "LLVM=3D1
> > > > KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata" plus LLVM_IAS=3D1.
> > > > Compilable but NOT bootable in QEMU and on bare metal.
> > > > Used assembler: Clang-IAS v12.0.0-rc1
> > > >
> > > > [ start-build_5.11.0-rc5-7-amd64-clang12-pgo.txt ]
> > > > dileks      6545    6520  0 16:31 pts/2    00:00:00 /usr/bin/perf_5=
.10
> > > > stat make V=3D1 -j4 HOSTCC=3Dclang HOSTCXX=3Dclang++ HOSTLD=3Dld.ll=
d CC=3Dclang
> > > > LD=3Dld.lld PAHOLE=3D/opt/pahole/bin/pahole
> > > > LOCALVERSION=3D-7-amd64-clang12-pgo KBUILD_VERBOSE=3D1
> > > > KBUILD_BUILD_HOST=3Diniza KBUILD_BUILD_USER=3Dsedat.dilek@gmail.com
> > > > KBUILD_BUILD_TIMESTAMP=3D2021-01-28 bindeb-pkg
> > > > KDEB_PKGVERSION=3D5.11.0~rc5-7~bullseye+dileks1 LLVM=3D1
> > > > KCFLAGS=3D-fprofile-use=3Dvmlinux.profdata LLVM_IAS=3D1
> > > >
> > > > Config: config-5.11.0-rc5-7-amd64-clang12-pgo
> > > >
> > > >
> > > > [ Conclusion ]
> > > >
> > > > The only statement I can tell you is a "PGO optimized" rebuild with
> > > > LLVM_IAS=3D1 is compilable but NOT bootable.
> > >
> > > Thanks for the extensive testing and report. Can you compress, upload=
,
> > > and post a link to your kernel image? I would like to take it for a
> > > spin in QEMU and see if I can find what it's doing, then work
> > > backwards from there.
> > >
> >
> > Which files do you need?
> > For QEMU: bzImage and initrd.img enough?
>
> bzImage should be enough; I'll use my own initrd.  If that boots for
> me, maybe then I'll take a look with the initrd added.
>

You should receive an email with a link to my dropbox shared-folder
"clang-pgo > for-nick".
Please let me know if you were able to download.

Thanks, Sedat
=EF=BF=BC
