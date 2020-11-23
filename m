Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B614E2C13C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 20:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388852AbgKWSmW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 13:42:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387970AbgKWSmW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 13:42:22 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BB8C0613CF
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 10:42:22 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id x15so9293644pll.2
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Nov 2020 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nJpF2gat8sIt3hy0qTCyIbzDeQ9i0fB1Rc02MDjSdMo=;
        b=Xo+IICOVGLt3K5DTzifwsDmhU2bw3XpbSOth7zBf0YtrMOcywoA7vKYHOTrNbQ/cy5
         Wu2u0j0BYYEhqP97oK87DYkrPmp5aE5r28Gx/xZi9dbyrYZ4A7lXa35F/XQuM6S75qrz
         2zy9YncnWdm4MApfAv8i8XhkJDGkKcBUePtwI6OJQI7qszQyxWBO7M23sWV0L3fVSBIy
         Bf67URSBbdR868+F9oAGnCu/Dx6cL9eAp3FujPNNtjh0HWBAmF54SqBgAlBcs3RupQYa
         gHkPM7G4I7OLSg1ZIPudEOhX2dUut7Y78zvnlN/GNG9t1y9AYCKPPkV0k7SzmejGqjoZ
         NCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nJpF2gat8sIt3hy0qTCyIbzDeQ9i0fB1Rc02MDjSdMo=;
        b=aXBnLWaPscbyhq8DhATg6m3WGgZnSmgP//4ccvHmS704B/oVrsLz6eDeMeKw+Pqh2V
         iwIId9hraS98dS/aHGn7JZjaiHTakuYKgjOl5Zxbp8tnNCEYrNVY/TP5+1eWJkL1V2T4
         VMx1bBzKmg0FxmI7hEBEW51cfwCW8bqjSbf7Go6I6qr+iftd4c6f4EBQIdpmd9JqronG
         /95XNIcKzN4L36h33mSlvAoysk3MxuKdAgE+E9V9sypn1cABNFOyrwZrkDLrIZqnMeM5
         2nQ3ZPsxzVASR3HZsWO1HYe0bhENcFKHbMvEKa/0I5L4fvojFWUvw6kPTfva34B3tfqe
         /VrA==
X-Gm-Message-State: AOAM531xasVxRCNAlQ1UHAXAtjzXqAhw++wi9SgRFsGGaiYaYVjNyng2
        Z7bfo8Iz4TXhZp7NnTLSZvi8UUTHu0J67F+oc5NBxN9JqX8=
X-Google-Smtp-Source: ABdhPJz2y23kaDogZeYSzaZ8TlHAb3VOf4t6+w3ZMmbCWzUdvceIsMpH2hbtRYSvATaO/ZuHzxMtKk9B9Ty8c17OTJE=
X-Received: by 2002:a17:902:221:b029:d8:f938:b112 with SMTP id
 30-20020a1709020221b02900d8f938b112mr702048plc.10.1606156941355; Mon, 23 Nov
 2020 10:42:21 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOd=9iqLgdtAWe2h-9n=KUWm_rjCCJJYeop8PS6F+AA0VtA@mail.gmail.com>
 <20201109183528.1391885-1-ndesaulniers@google.com> <CAKwvOdnxAr7UdjUiuttj=bz1_voK1qUvpOvSY35qOZ60+E8LBA@mail.gmail.com>
 <CA+SOCLJTg6U+Ddop_5O-baVR42va3vGAvMQ62o9H6rd+10aKrw@mail.gmail.com>
In-Reply-To: <CA+SOCLJTg6U+Ddop_5O-baVR42va3vGAvMQ62o9H6rd+10aKrw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 23 Nov 2020 10:42:10 -0800
Message-ID: <CAKwvOdn0qoa_F-qX10Hu7Cr8eeCjcK23i10zw4fty32u1aBPSw@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: do not emit debug info for assembly with LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>,
        "# 3.4.x" <stable@vger.kernel.org>, Jian Cai <jiancai@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,
I would appreciate any feedback you have on this patch.

On Fri, Nov 20, 2020 at 3:58 PM Jian Cai <jiancai@google.com> wrote:
>
> I also verified that with this patch Chrome OS devices booted with either=
 GNU assembler or LLVM's integrated assembler. With this patch, IAS no long=
er produces extra warnings compared to GNU as on Chrome OS and would remove=
 the last blocker of enabling IAS on it.
>
> Tested-by: Jian Cai <jiancai@google.com> # Compile-tested on mainline (wi=
th defconfig) and boot-tested on ChromeOS (with olddefconfig).
>
>
> On Mon, Nov 16, 2020 at 3:41 PM 'Nick Desaulniers' via Clang Built Linux =
<clang-built-linux@googlegroups.com> wrote:
>>
>> Hi Masahiro, have you had time to review v3 of this patch?
>>
>> On Mon, Nov 9, 2020 at 10:35 AM Nick Desaulniers
>> <ndesaulniers@google.com> wrote:
>> >
>> > Clang's integrated assembler produces the warning for assembly files:
>> >
>> > warning: DWARF2 only supports one section per compilation unit
>> >
>> > If -Wa,-gdwarf-* is unspecified, then debug info is not emitted for
>> > assembly sources (it is still emitted for C sources).  This will be
>> > re-enabled for newer DWARF versions in a follow up patch.
>> >
>> > Enables defconfig+CONFIG_DEBUG_INFO to build cleanly with
>> > LLVM=3D1 LLVM_IAS=3D1 for x86_64 and arm64.
>> >
>> > Cc: <stable@vger.kernel.org>
>> > Link: https://github.com/ClangBuiltLinux/linux/issues/716
>> > Reported-by: Dmitry Golovin <dima@golovin.in>
>> > Reported-by: Nathan Chancellor <natechancellor@gmail.com>
>> > Suggested-by: Dmitry Golovin <dima@golovin.in>
>> > Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
>> > Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
>> > Reviewed-by: Fangrui Song <maskray@google.com>
>> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> > ---
>> >  Makefile | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/Makefile b/Makefile
>> > index f353886dbf44..7e899d356902 100644
>> > --- a/Makefile
>> > +++ b/Makefile
>> > @@ -826,7 +826,9 @@ else
>> >  DEBUG_CFLAGS   +=3D -g
>> >  endif
>> >
>> > +ifneq ($(LLVM_IAS),1)
>> >  KBUILD_AFLAGS  +=3D -Wa,-gdwarf-2
>> > +endif
>> >
>> >  ifdef CONFIG_DEBUG_INFO_DWARF4
>> >  DEBUG_CFLAGS   +=3D -gdwarf-4
>> > --
>> > 2.29.2.222.g5d2a92d10f8-goog
>> >
>>
>>
>> --
>> Thanks,
>> ~Nick Desaulniers
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s "Clang Built Linux" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email to clang-built-linux+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msg=
id/clang-built-linux/CAKwvOdnxAr7UdjUiuttj%3Dbz1_voK1qUvpOvSY35qOZ60%2BE8LB=
A%40mail.gmail.com.



--=20
Thanks,
~Nick Desaulniers
