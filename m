Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210CA320B11
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 15:47:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhBUOrL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 09:47:11 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26424 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhBUOrK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 09:47:10 -0500
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 11LEk5sq002268;
        Sun, 21 Feb 2021 23:46:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11LEk5sq002268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613918765;
        bh=o85pGxzQ4oK290wfKdH6EJiECD84oDzWhP9pNrJyQy4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QqRZFbC48IlYJOMwW3CziNxzkp3/g0y9UjSkHc/esu91zB7amWFuUUrpyiy8y0deH
         UtZxHAJ2qN/0yyb2/ZuAQxBf0AOU9bZT1Jtg7W1mha5y0eC2f7ieTo6UJaYk3BTDM1
         /l8K+vqVAf2EPX6I0tW3ZXOKs0aUcCavTjEcswxx3LVnvLetVdgezAC6LEYRXhOk4s
         fVJj3tM7c1bJ8QSqfiCncKBPrY+jFmLYl6dy8O7+Hp+mL67RjXTdgFH+SqwQ340qjX
         dVuWVGJ1kV8IXIXY4IhNPrvpp0M89VuauopQdc9MufOzaIQRkiX+5BWWDnkvAmPuge
         MDGSPfjkCDDow==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id d2so7077088pjs.4;
        Sun, 21 Feb 2021 06:46:05 -0800 (PST)
X-Gm-Message-State: AOAM532TaHxlJI2wMbaHb/+FJMjiinpX/mjU4ZPvVesyCR2/Rrb/0C5y
        HHSc516w8ufFFSc11BpWZOQSAcxjh9NnjhUz46M=
X-Google-Smtp-Source: ABdhPJwQJusJbGaxtCNnp+BJ0gxkrnGWWF5FOzzwgJnZxkgACKsuXWEzSa5bv4sC3/7t2FUd6tGmvZ/+w5dqgzN/5ac=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr18849598pji.87.1613918764601;
 Sun, 21 Feb 2021 06:46:04 -0800 (PST)
MIME-Version: 1.0
References: <20210215181511.2840674-1-mic@digikod.net> <20210215181511.2840674-3-mic@digikod.net>
 <CAK7LNAS54Zw7d8Lp5BNs1JVktSLTFx0dNbLMA7W0U_sH2712_A@mail.gmail.com> <b3ea85ca-5c49-61ab-4769-f2e4557df3c7@digikod.net>
In-Reply-To: <b3ea85ca-5c49-61ab-4769-f2e4557df3c7@digikod.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 21 Feb 2021 23:45:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR-WLk+y01CB7Jjx8VVw4v_qNkdiSGDNkpqvWdTu1L1jg@mail.gmail.com>
Message-ID: <CAK7LNAR-WLk+y01CB7Jjx8VVw4v_qNkdiSGDNkpqvWdTu1L1jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kconfig: Ask user if string needs to be changed
 when dependency changed
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 21, 2021 at 8:09 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
>
> On 21/02/2021 09:47, Masahiro Yamada wrote:
> > On Tue, Feb 16, 2021 at 3:14 AM Micka=C3=ABl Sala=C3=BCn <mic@digikod.n=
et> wrote:
> >>
> >> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> >>
> >> Content of string configuration may depend on related kernel
> >> configurations.  Modify oldconfig and syncconfig to inform users about
> >> possible required configuration update and give them the opportunity t=
o
> >> update it:
> >> * if dependencies of this string has changed (e.g. enabled or disabled=
),
> >> * and if the current value of this string is different than the (new)
> >>   default one.
> >>
> >> This is particularly relevant for CONFIG_LSM which contains a list of
> >> LSMs enabled at boot, but users will not have a chance to update this
> >> list with a make oldconfig.
> >
> > If CONFIG_LSM already exists in the .config,
> > oldconfig does not show a prompt.
> > This is the expected behavior.
>
> It is not the behavior wished for LSM stacking.

Because LSM is doing wrong.


> >
> > You are trying to fix your problem in a wrong way.
> > NACK.
>
> What do you suggest to ensure that users will be asked to update the
> CONFIG_LSM string if they add or remove an LSM?


Fix it in the security subsystem.


Hint:
See 050e9baa9dc9fbd9ce2b27f0056990fc9e0a08a0

--=20
Best Regards
Masahiro Yamada
