Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D785FBCAD
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Oct 2022 23:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiJKVKm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Oct 2022 17:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiJKVKk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Oct 2022 17:10:40 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A69711087
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Oct 2022 14:10:38 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id g8-20020a17090a128800b0020c79f987ceso110307pja.5
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Oct 2022 14:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oafogegdaPZXzoXHnF3Oghbpz4xzRGdJpbKq76q2a2Y=;
        b=jnczQYliYIsLsFbP/UZl/kvgenSOJLgaf8Pfm1gb8cHOLkDDEW/2cL9PG94IxYEW4q
         suMuqxEBoUSfPSr3l/S2pPP9K5AJA9cI9+5wWr/qdpXCWpBciZLC0oZsQXhwfXtf2OsA
         6RJxL7AzUa28+fyVCxQacl3gaAztM+w+YBCduYXw0Egcpc7YFDWfvnNpJ8RcD+rpETnN
         kt85vhSqQmsz/hifsR8afjplOuiFTmszmZeKLXMiVESMeAbxVrGzZ3PjqGltw8pWZY1Y
         Ev74QT2hKYNO4YwgVSkfOPntQ6+e6GjXQekolNwSW1WOKXOVG3Fknivha7plE/WWXlUk
         FW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oafogegdaPZXzoXHnF3Oghbpz4xzRGdJpbKq76q2a2Y=;
        b=Sn3+DmnygGJ8Vay/LPX2rx8j8AWGo98APhk58KvOBt7opD5zIltlQlK9L/Rg3I9plL
         j9a1ufd0Uy9gHex3SRm+TsqL+SE9hzgFv12ppArwGPSKf/mEVNMecw62+DScXxv5IkKq
         Y92iBoGC4mcdHAgnLUOvjowOWIGsz4D5Nj/4xhOo0ykyKebpPANOLPxHDRGcXTdzYYCY
         koJBC5YRtTzL2WNTssdnYsRq52/o7lGiIPYmI3tyZJslAO2+Yao2RvQHagDx6isYlcyN
         vqusajP6q6SxSFgeA0XBAzEcb+XGbY4SbUPbwWIzCTvGe+UiS8acIn0kO4BSRgIs/rnk
         riyg==
X-Gm-Message-State: ACrzQf2q73EgZInI7UZ7vOWMbopZMnrStNn7OL7aOcZQGEONZQztt5tK
        DjctW2MsjyY31VWw/XqgzqK3AlSAbsZlSLgzS8cm2g==
X-Google-Smtp-Source: AMsMyM6PldU15XpYKT+5xulQiXStYTcESn3GyVSq7lLp6grdvkqvA9V1svb1pzlVoyZmAjU53mCAHKZxCjfWfjlGatM=
X-Received: by 2002:a17:90b:33c3:b0:20a:ebc3:6514 with SMTP id
 lk3-20020a17090b33c300b0020aebc36514mr1188220pjb.147.1665522637959; Tue, 11
 Oct 2022 14:10:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221011032327.2761241-1-zengheng4@huawei.com>
In-Reply-To: <20221011032327.2761241-1-zengheng4@huawei.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 11 Oct 2022 14:10:26 -0700
Message-ID: <CAKwvOdn=4Vzgt6zo64tTc+d=QHVrWxRe2JzBC8ydyc_wst1EEA@mail.gmail.com>
Subject: Re: [PATCH -next] Makefile: add implicit enum-conversion check for
 compile build
To:     Zeng Heng <zengheng4@huawei.com>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, nathan@kernel.org,
        trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, liwei391@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 10, 2022 at 8:24 PM Zeng Heng <zengheng4@huawei.com> wrote:
>
> Enable implicit enum-conversion warning option in kernel gcc build.
> When it set enabled, it can detect implicit enum type conversion
> and locate conversion errors like below (use "allmodconfig"):
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.c:=
3904:46:
> error: implicit conversion from =E2=80=98enum <anonymous>=E2=80=99 to =E2=
=80=98enum odm_combine_mode=E2=80=99
> [-Werror=3Denum-conversion]
>  3904 |       locals->ODMCombineEnablePerState[i][k] =3D true;
>       |                                              ^
>
> The '-Wenum-conversion' could be regarded as effective check in
> compile runtime and call attention on potential mistakes, which is
> firstly introduced from GNU gcc-10.
>
> Although "-Wenum-conversion" could be enabled by "-Wextra"
> when compiling with 'W=3D[123]' option, there are many warnings
> generated by '-Wextra' that cause too much noise in the build.
>
> Seeing the more details from the following link:
> https://gcc.gnu.org/onlinedocs/gcc-11.3.0/gcc/Warning-Options.html
>
> Therefore, "-Wenum-conversion" warning option needs to be
> explicitly requested for GCC when compilation process is only
> companied with '-Wall'.
>
> With clang, -Wenum-conversion is just default enabled, not even
> behind -Wall.

Probably didn't need the examples below since you already provide an
example above, too, but it doesn't matter.  Thanks for the patch.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Provide a couple examples for reference as below:
>
> $ cat test.c
> enum enum1 { A =3D 1 };
> enum enum2 { B =3D 2 };
>
> enum enum1 foo(enum enum2 bar)
> {
>     return bar;
> }
>
> $ gcc -Wall -fsyntax-only test.c
>
> $ gcc -Wall -Wenum-conversion -fsyntax-only test.c
> test.c: In function =E2=80=98foo=E2=80=99:
> test.c:6:9: warning: implicit conversion from =E2=80=98enum enum2=E2=80=
=99 to =E2=80=98enum enum1=E2=80=99 [-Wenum-conversion]
>     6 |  return bar;
>       |         ^~~
>
> $ gcc -Wextra -fsyntax-only test.c
> test.c: In function =E2=80=98foo=E2=80=99:
> test.c:6:9: warning: implicit conversion from =E2=80=98enum enum2=E2=80=
=99 to =E2=80=98enum enum1=E2=80=99 [-Wenum-conversion]
>     6 |  return bar;
>       |         ^~~
>
> $ clang -fsyntax-only test.c
> test.c:6:9: warning: implicit conversion from enumeration type 'enum enum=
2' to different enumeration type 'enum enum1' [-Wenum-conversion]
>         return bar;
>         ~~~~~~ ^~~
> 1 warning generated.
>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 8f6ed52fa08f..72103d22df23 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -880,6 +880,10 @@ endif
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-but-set-variable)
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, unused-const-variable)
>
> +# implicit enum conversion checking is supported since from gcc-10
> +# this warning option has to be explicitly requested for GCC
> +KBUILD_CFLAGS +=3D $(call cc-option, -Wenum-conversion)
> +
>  # These result in bogus false positives
>  KBUILD_CFLAGS +=3D $(call cc-disable-warning, dangling-pointer)
>
> --
> 2.25.1
>


--=20
Thanks,
~Nick Desaulniers
