Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F15A858317B
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jul 2022 20:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243282AbiG0SIr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jul 2022 14:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239058AbiG0SIb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jul 2022 14:08:31 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B2CCB750
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 10:11:55 -0700 (PDT)
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8795F3F119
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 17:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1658941912;
        bh=p8BxUinmu0In37tgfklk8SPEbUyiUeXieDC0F6YQ4cE=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=oCIGhuE+BbtgzTjbzXY+o5mSVkNAXeBXBu16cmUG8GF/VYDhZJeXAH9lhtV13o08w
         B6WXRFbTxNAyjFEunOqRx83DS3zet66aRFc2kYGwBEZzOlmo/+TC4mygD3XBtqWDJG
         AN4oiC2fQ/hZCh5ta1DTZkpbaUyl8Oa410mruViOBvW48M3y9+EywQWJuxtBhUapmh
         Zz8H1fWGSoVYIaP1Pr5oxXyUBsomojrJ4gyZbcC8JoK/7pEB37cJFIGJqtyZB4VqPl
         ELiW9nBppKf/VkrSnTRN5RZKZP+oekH4qVB9h7LlFNKy9kM4hwg89e63VqDA5zW1aq
         aAybR6puiyKmg==
Received: by mail-oo1-f71.google.com with SMTP id w17-20020a4a9d11000000b004284d7e1298so1810226ooj.6
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 10:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p8BxUinmu0In37tgfklk8SPEbUyiUeXieDC0F6YQ4cE=;
        b=1LGqK53G6l2KzeQH2qyfdugmwlcgETU/yPmPVj7lgEL34XoppTkkedriz506R4oslq
         2e58TT4LANPOPblm0PkuIx7PiuM3OzQH82T9FYYCf2+EHjK3iUESF++CeyHFSOka4577
         pBRbHU6BgmOey7VGsdTt3q4b8YFqPTqEAC/kXyOO3HOQM8x7eEycJfGH29QPUMETHzIA
         oqg/qzG3LDX47Q0HmF1zV5nqUUszTBLWqVl52LxxsVUzfUk4+XYAL4xlZgQNmKgkaA4H
         9LU5j9SikGBjTu4lyzdocnm9gMKEEzHNOqXDYitw3zY9+fy+ZjH8flPnJpm5MuSZGysq
         7YeQ==
X-Gm-Message-State: AJIora+7UxQBDlei2dCmDGSAaTcCLodFuzM1Pd3nYgHIOmSJbJCTQTPD
        Io0CwGHheqIpwOF+1CrVy1GXekkQHLiZBDhyYJhUE3AP9ZO8CsZez+36ItaJiuRfOWiwRcVteae
        fMLwWJLjg5lJ31j+T4KnGWwz9hKTC3Z8EXR3MFZdLKfMo3OiqD2Vk2xHiLA==
X-Received: by 2002:a54:4789:0:b0:33a:5a42:71c with SMTP id o9-20020a544789000000b0033a5a42071cmr2428441oic.239.1658941911503;
        Wed, 27 Jul 2022 10:11:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sjA2df/OeFt0huzK7VUHvD950PBKeHpumiDp/V7HBV47IAKGCR86pSSZrHEHOHOu4IOdk2k6op21RrZN9myhs=
X-Received: by 2002:a54:4789:0:b0:33a:5a42:71c with SMTP id
 o9-20020a544789000000b0033a5a42071cmr2428429oic.239.1658941911233; Wed, 27
 Jul 2022 10:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220722022416.137548-1-mfo@canonical.com> <20220722022416.137548-4-mfo@canonical.com>
 <CAK7LNARvJEhEOwg_PHe3WKT9BkSchnGOmeiUaB+7E__NS9qrVw@mail.gmail.com>
In-Reply-To: <CAK7LNARvJEhEOwg_PHe3WKT9BkSchnGOmeiUaB+7E__NS9qrVw@mail.gmail.com>
From:   Mauricio Faria de Oliveira <mfo@canonical.com>
Date:   Wed, 27 Jul 2022 14:11:39 -0300
Message-ID: <CAO9xwp2Ud-60Eb0cdpsBpq_ixOBaiOannxZ7SsbfHKrjj8mGDQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/6] sysctl, mod_devicetable: shadow struct
 ctl_table.procname for file2alias
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 26, 2022 at 6:27 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Jul 22, 2022 at 11:24 AM Mauricio Faria de Oliveira
> <mfo@canonical.com> wrote:
> >
> > In order to expose a sysctl entry to modpost (file2alias.c, precisely)
> > we have to shadow 'struct ctl_table' in mod_devicetable.h, as scripts
> > should not access kernel headers or its types (see file2alias.c).
> >
> > The required field is '.procname' (basename of '/proc/sys/.../entry').
> >
> > Since 'struct ctl_table' is annotated for structure randomization and
> > we need a known offset for '.procname' (remember, no kernel headers),
> > take it out of the randomized portion (as in, eg, 'struct task_struct').
> >
> > Of course, add build-time checks for struct size and .procname offset
> > between both structs. (This has to be done on kernel side; for headers.)
> >
> > With that in place, use the regular macros in devicetable-offsets.c to
> > define SIZE_... and OFF_... macros for the shadow struct and the field
> > of interest.
> >
> > Signed-off-by: Mauricio Faria de Oliveira <mfo@canonical.com>
> > ---
> >  fs/proc/proc_sysctl.c             | 19 +++++++++++++++++++
> >  include/linux/mod_devicetable.h   | 25 +++++++++++++++++++++++++
> >  include/linux/sysctl.h            | 11 ++++++++++-
> >  kernel/sysctl.c                   |  1 +
> >  scripts/mod/devicetable-offsets.c |  3 +++
> >  5 files changed, 58 insertions(+), 1 deletion(-)
> >
> > diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> > index 021e83fe831f..ebbf8702387e 100644
> > --- a/fs/proc/proc_sysctl.c
> > +++ b/fs/proc/proc_sysctl.c
> > @@ -19,6 +19,24 @@
> >  #include <linux/kmemleak.h>
> >  #include "internal.h"
> >
> > +#ifdef CONFIG_MODULES
> > +#include <linux/mod_devicetable.h>
> > +
> > +static void check_struct_sysctl_device_id(void)
> > +{
> > +       /*
> > +        * The shadow struct sysctl_device_id for file2alias.c needs
> > +        * the same size of struct ctl_table and offset for procname.
> > +        */
> > +       BUILD_BUG_ON(sizeof(struct sysctl_device_id)
> > +                       != sizeof(struct ctl_table));
> > +       BUILD_BUG_ON(offsetof(struct sysctl_device_id, procname)
> > +                       != offsetof(struct ctl_table, procname));
>
>
> Nit:
>
> If you use static_assert(), you can remove
>  check_struct_sysctl_device_id().
>
>
> You can write static_assert() out of a function.

That's a nice cleanup; thanks!

>
>
>
> > diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> > index 223376959d29..15073621cfa8 100644
> > --- a/kernel/sysctl.c
> > +++ b/kernel/sysctl.c
> > @@ -2487,6 +2487,7 @@ int __init sysctl_init_bases(void)
> >
> >         return 0;
> >  }
> > +
>
>
> Noise.

Fixed.


>
>
>
>
> >  #endif /* CONFIG_SYSCTL */
> >  /*
> >   * No sense putting this after each symbol definition, twice,
> > diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> > index c0d3bcb99138..43b2549940d2 100644
> > --- a/scripts/mod/devicetable-offsets.c
> > +++ b/scripts/mod/devicetable-offsets.c
> > @@ -262,5 +262,8 @@ int main(void)
> >         DEVID(ishtp_device_id);
> >         DEVID_FIELD(ishtp_device_id, guid);
> >
> > +       DEVID(sysctl_device_id);
> > +       DEVID_FIELD(sysctl_device_id, procname);
> > +
> >         return 0;
> >  }
> > --
> > 2.25.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada



--
Mauricio Faria de Oliveira
