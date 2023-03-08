Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125406B01E8
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Mar 2023 09:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjCHIrE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Mar 2023 03:47:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjCHIrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Mar 2023 03:47:02 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36100A5936
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Mar 2023 00:47:01 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id k10so38724292edk.13
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Mar 2023 00:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678265219;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngHgxKcceAmQwpfGI4Ps72SedHpBnkbxwUxssjia52A=;
        b=W8grt1ertfInRpM8APbfl7Gqh/pfKkx/WAT3kXHEzcxQKMLBtkiq8oaTMBFuHlkMpv
         oMAn6PUnbtDYOXhPRtarHlWvIso3gjOYVwjJYdKX1/YSXj0XgaKx2fXf5ykuqeJia6Yy
         f6zId3QawLrdOwHwVjApJkZun4hzXVOorwbsXnn1e7gySr67At837k/T1Z4XkwvOa45m
         E1SGQRE/A054BhllW9GtJynYgIhmhmVLTe+xdtu5w/HGZu4e2mg3tlRJ9YZObRgShmkK
         UaJlIlwhfX2r46eKkCXoTU459N7eB82v8dhFkTa63SbLSn2Ty1oMCA3gSDdOZktBZGRC
         4OVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678265219;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ngHgxKcceAmQwpfGI4Ps72SedHpBnkbxwUxssjia52A=;
        b=ITxa7Gthot2J9TdA66zDLu25b25dD3YL5E3XKC1FJoJnUiaG8voeRnNT7Wcu4JiUTI
         VmeW4IJqZgLVbRW2sdsDpih32QA5W+ZuEWr5jb3Lkw8GrCUKhqep0wsIjwYdy/hYHuOc
         nI8g4zPhpqCQlGl10D9mG4vBJz4kznXGFhwqz/3W7CWtUQLfPJamspNvwCxglODVZ1Pg
         /zwPhP19qMo7nEEGBiWpJnCuZE23gvLpawI5O9ta1tiad2MTU7vMUFkWXhCRslfmb/H4
         VusPlb7ZekdsRmtyydC7ctUs5+eH0heZ8TSN3LC0KEHpA8LT5sdaMplpysC7LwsSID0o
         IkEw==
X-Gm-Message-State: AO0yUKXhJcWKe+vryTawZ6FPCsEqckxElWYe1z4OKy3GXY5vgxaEgy1N
        2Im+J0a47zVI//7yH0r+iu4=
X-Google-Smtp-Source: AK7set+Cp0nsTqfGmOSX+HKdmJQJxPQ2gGz/hWtO7aGRIVZOaHGW4bAcSBhIPUur1oa4153DGkN4iA==
X-Received: by 2002:a17:906:2303:b0:87f:89f2:c012 with SMTP id l3-20020a170906230300b0087f89f2c012mr16359024eja.24.1678265219588;
        Wed, 08 Mar 2023 00:46:59 -0800 (PST)
Received: from localhost ([2001:b07:5d37:537d:5e25:9ef5:7977:d60c])
        by smtp.gmail.com with ESMTPSA id qn23-20020a170907211700b008d173604d72sm7287173ejb.174.2023.03.08.00.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:46:58 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 08 Mar 2023 09:46:57 +0100
Message-Id: <CR0VD9KDRYVJ.2N3C1FVZA1DFR@vincent-arch>
Cc:     <linux-kbuild@vger.kernel.org>, "Roland Kletzing" <devzero@web.de>
Subject: Re: [PATCH v1 1/1] script: modpost: emit warning when description
 is missing
From:   "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To:     "Masahiro Yamada" <masahiroy@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230306174159.145224-1-vincenzopalazzodev@gmail.com>
 <CAK7LNAS598SxdLDoVLFdBtEynzhFZHD0Z1cHeuDHLaJJvL6b0w@mail.gmail.com>
In-Reply-To: <CAK7LNAS598SxdLDoVLFdBtEynzhFZHD0Z1cHeuDHLaJJvL6b0w@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue Mar 7, 2023 at 3:34 AM CET, Masahiro Yamada wrote:
> On Tue, Mar 7, 2023 at 2:42=E2=80=AFAM Vincenzo Palazzo
> <vincenzopalazzodev@gmail.com> wrote:
> >
> > Emit a warning when the mod description is missed.
> >
> > Reported-by: Roland Kletzing <devzero@web.de>
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D10770
> > Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> > ---
> >  scripts/mod/modpost.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index efff8078e395..c63156ba4e5e 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -1824,6 +1824,9 @@ static void read_symbols(const char *modname)
> >                 }
> >         }
> >
> > +       if (!get_modinfo(&info, "description"))
> > +               warn("missing MODULE_DESCRIPTION() in %s\n", modname);
> > +
> >         for (sym =3D info.symtab_start; sym < info.symtab_stop; sym++) =
{
> >                 symname =3D remove_dot(info.strtab + sym->st_name);
> >
> > --
> > 2.39.2
> >
>
>
> Linus requires a clean build log these days.
> This patch would sprinkle warning messages,
> and I am sure it will result in a rejection.

I see, thanks to let me know!

> The best we can do would print the warnings
> only when W=3D1.

I will do it in a v2 later today, thanks!

Cheers!

Vincent.
