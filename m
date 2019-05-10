Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98E9119E85
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 15:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbfEJNyN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 09:54:13 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:36509 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbfEJNyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 09:54:13 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x4ADrpuo019896;
        Fri, 10 May 2019 22:53:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4ADrpuo019896
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557496431;
        bh=fCZyYc7lUxOhLrTG7ucal3L6rAGhMTDpi2n2QdqKTdI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FaFvhIpvVy7uXca8x+5s7hB+aTwlru3OpLG6nDSZp/4dx9WMDCpz4TKe3jx5INTMv
         fcO56dBh9WZq8HA6hRaHCNQPQajNxWcHmm3o+foF4+Jh7eYj1IoXjdveCKbbfNfPjB
         St/TpCHLfQYlCUv3ninPb8HPMEwl8wrM+Cn8GAXeinMgIvH2XM4VkXb6gLCJh5w/Tr
         2G+aymrzHxo1y/5mduRtWM0ZqBZM2Iz34496SZJU0JfzUfOOnGQjO39/FLiUIKhTYO
         vLM3Ru4g5jtEYCcYLTgyVxQ8F7SxND0UYZlr7XbaIhD+kTULuIx00DmuCj9UO4KZe5
         /1XZM3z+2u/kg==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id c76so3671577vsd.3;
        Fri, 10 May 2019 06:53:51 -0700 (PDT)
X-Gm-Message-State: APjAAAVzhMsdL7YJ7RPKoWHM5GJ88xiMgbJq5eZUaUBEo8sixIfB8pDB
        G9sCKy3G5mvdyBG3zeMtqcjE7ytS9gtKMulnr2c=
X-Google-Smtp-Source: APXvYqxrG5kYfgTx+VylEbc4eQ4VMLIbvXqQT7ZPVtEHSqc3JTmEQf82nxFi2KVRZbVGhm+jOD5G/BPS2dkPAopIKjA=
X-Received: by 2002:a67:db8b:: with SMTP id f11mr5993687vsk.155.1557496430324;
 Fri, 10 May 2019 06:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064455.1173-1-yamada.masahiro@socionext.com> <CA+icZUX_AgZdH5Z+1+k+oVdYSo7vqzeJsGPndb_Sa8VOSk_yOg@mail.gmail.com>
In-Reply-To: <CA+icZUX_AgZdH5Z+1+k+oVdYSo7vqzeJsGPndb_Sa8VOSk_yOg@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 10 May 2019 22:53:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS+FQqQZ0RfW8e6mxabUOq9YVk=eEEztmN-+BHnTmDa_w@mail.gmail.com>
Message-ID: <CAK7LNAS+FQqQZ0RfW8e6mxabUOq9YVk=eEEztmN-+BHnTmDa_w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 4:06 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, May 9, 2019 at 8:45 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > We do not support old Clang versions. Upgrade your clang version
> > if any of these flags is unsupported.
> >
> > Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> > except -fcatch-undefined-behavior.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Looks good to me.
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> Just as sidenote:
> I experimented with a snapshot version of clang-9 and lld-9 and could
> build, link and boot on bare-metal with '-mglobal-merge' on
> Debian/buster AMD64.


The comment says
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the
whitelisted names.
 # See modpost pattern 2

So, it seems it is just a matter of modpost,
but I am not sure enough.

This flag has been here since the initial support.
(61163efae02040f66a95c8ed17f4407951ba58fa)


Perhaps, we should review clang flags one by one again?




> But forgot to document in [1].
>
> [1] https://github.com/ClangBuiltLinux/linux/issues/431



-- 
Best Regards
Masahiro Yamada
