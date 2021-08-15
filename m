Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCF43EC6D5
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Aug 2021 05:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhHODTN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 14 Aug 2021 23:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbhHODTM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Aug 2021 23:19:12 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53024C061764
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Aug 2021 20:18:43 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id l144so840063ybl.12
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Aug 2021 20:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M3h39XrOI3FJ6un0byHMUduS6niGgV73IZr3z/auRus=;
        b=I9HCpAzIi3/0p/TeJe6il/j6YEGQ4N0xHlicqHh61nNtz2bdV+xf+Nsz3OHPJkPv5i
         rjqo87392uLWAqiR3EaWNlp/oqjP92g7c1EyayQGevMWnEHPfyzHlTWynrp1ZzzoXMl6
         ixeT7H1I4pdmOvM364RDTunoV1fHwjtGPdqlUX7TrR899umuWZMFBdsunejKHI+C5IDM
         UuSJRwLmpF7Y9bBT+NkXUbBudGDYIWSRbVkdlovoXFbU8bmdOvsoyxn29U+7rpeEp1Gu
         A1qWoycrhxrHQNm7TQ1AgrC3UMWBgYhXvHJuaBXTV4HBwA4sVgH/PhAsMid8dUe2ulQb
         0DBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M3h39XrOI3FJ6un0byHMUduS6niGgV73IZr3z/auRus=;
        b=HpQZE+MZXWWMDCfEkdcC2f+4S3XidCdztL//wAl/RyHlckKJeRqwAvnay2zEAHlJxE
         /TNAEhjMyz9RgSCnwF33bGsaPcaZlCAgu6Za4DV0hfjA9qNWvC2eMPANeIZlz6Bw4Y7x
         rFZgAsI69oXQYENi/aYWNeYYDaF+ViS8ztS9Mz67fPNSHqU4wxtu5xF6SDK9Tnne4lNx
         vlfDZQTjuyayizt02J7IFqCqEjWJ+UIwFhsiwheeNZOjKt8R4bxY0lf6fq0bMgHtuKNf
         LOYP1HOdLO7vJOphJBx9ef7moXQWT8bT87mJx0v+MOHZ7bpoaWJEvW0TVlFUsFFFjM4r
         eTDg==
X-Gm-Message-State: AOAM532NlBNzSmOnsd0BLjwazDcoDMwSN6HIygjZlWj9SlRIg+eLl0rs
        LnCgvHunN/cjKhBN7VOfvbDztRKx2YKPhft6YVGj0Q==
X-Google-Smtp-Source: ABdhPJy6cULzYl1VNLPc1EQXNMgQEitJHUJhymGhBeBKPi2/GZsDp6PKBu9RtxxQ1AkBBygj5+bdMkUrZjocT0NIZ+Q=
X-Received: by 2002:a25:19d7:: with SMTP id 206mr11657033ybz.240.1628997522341;
 Sat, 14 Aug 2021 20:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210814234102.2315551-1-masahiroy@kernel.org> <3afe5054-8129-fe42-b5a4-00bd091b1a0c@kernel.org>
In-Reply-To: <3afe5054-8129-fe42-b5a4-00bd091b1a0c@kernel.org>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Sat, 14 Aug 2021 20:18:31 -0700
Message-ID: <CAFP8O3JtOpb368h4PBbYnR4fsqRYkX_TKuCKrS-Csu=dMMNiKA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 14, 2021 at 6:15 PM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> On 8/14/2021 4:41 PM, Masahiro Yamada wrote:
> > When CONFIG_TRIM_UNUSED_KSYMS is enabled, I see some warnings like this=
:
> >
> >    nm: arch/x86/entry/vdso/vdso32/note.o: no symbols
> >
> > $NM (both GNU nm and llvm-nm) warns when no symbol is found in the
> > object. Suppress the stderr.
> >
> > Fixes: bbda5ec671d3 ("kbuild: simplify dependency generation for CONFIG=
_TRIM_UNUSED_KSYMS")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

LGTM.

FWIW binutils>=3D2.37 `nm -q` can be used to suppress "no symbols"
https://sourceware.org/bugzilla/show_bug.cgi?id=3D27408

llvm-nm>=3D13.0.0 supports -q as well.

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >
> >   scripts/gen_ksymdeps.sh | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
> > index 1324986e1362..5493124e8ee6 100755
> > --- a/scripts/gen_ksymdeps.sh
> > +++ b/scripts/gen_ksymdeps.sh
> > @@ -4,7 +4,10 @@
> >   set -e
> >
> >   # List of exported symbols
> > -ksyms=3D$($NM $1 | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z=
)
> > +#
> > +# If the object has no symbol, $NM warns 'no symbols'.
> > +# Suppress the stdout.
> > +ksyms=3D$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' =
| tr A-Z a-z)
> >
> >   if [ -z "$ksyms" ]; then
> >       exit 0
> >
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/3afe5054-8129-fe42-b5a4-00bd091b1a0c%40kernel.org.



--=20
=E5=AE=8B=E6=96=B9=E7=9D=BF
