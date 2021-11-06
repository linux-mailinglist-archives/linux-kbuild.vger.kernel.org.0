Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E8A446DA3
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Nov 2021 12:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhKFLfg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Nov 2021 07:35:36 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28937 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhKFLff (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Nov 2021 07:35:35 -0400
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1A6BWXVJ004615
        for <linux-kbuild@vger.kernel.org>; Sat, 6 Nov 2021 20:32:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1A6BWXVJ004615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636198354;
        bh=5AUktVBmI+Dt6f1yoLPGbdF1OPay4DmBdfEoYOCNlzA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=U2BymMs11cPsle7Q6DcCB+FOBxmwedsmZFxuOund+wrC2wVyvGt2zQ1tcWRIVOS6R
         izVAOwz07q3StWtoB6iSE3Ivu5wQX9M+DT/ErSorVuhXIy4lBy7jnEKYH9p8Jahb0H
         E9BkLwCJkr/PLDtzQuFJThge46jCAnYcPhL8/cWbWdjciu9JIIw2xah6cWMl5po08P
         vag/V46TWJLKGOZsHPmfWhDhnk/WOhR+aHBqDkDpxFBesnvJyIQGm6KvWejfGyHu9n
         BJQW8aKcXh5+BPCp5CuqM5rzJdPqbBszW75pcEdfyECr48DjpEn1szHHddQcMgDY0t
         Dav6gaSRaglPQ==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so5203356pjb.1
        for <linux-kbuild@vger.kernel.org>; Sat, 06 Nov 2021 04:32:34 -0700 (PDT)
X-Gm-Message-State: AOAM533na+Fgh4DkHg80mCtpHyluvnP6Ahur7/IQMdStwi8KzmCq0nea
        YG9ZkhtJizj1nLdTlBWV1nW8dOdjroOpnRDVyds=
X-Google-Smtp-Source: ABdhPJyK9278pai+hI9d8NRu83TNnx3d1ZheGYt7EapuhwE2VA+JBK/WmJXBGkVchWwBcZRE12SDjUMPDah0lwhuuRc=
X-Received: by 2002:a17:902:6b83:b0:141:6368:3562 with SMTP id
 p3-20020a1709026b8300b0014163683562mr56467839plk.42.1636198353231; Sat, 06
 Nov 2021 04:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <560695744.1785825.1636169664203.ref@mail.yahoo.com> <560695744.1785825.1636169664203@mail.yahoo.com>
In-Reply-To: <560695744.1785825.1636169664203@mail.yahoo.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Nov 2021 20:31:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNASUeUxDcfA-C9vFC6y7J=YzO7K7RbS99mxGguAFwKhTnA@mail.gmail.com>
Message-ID: <CAK7LNASUeUxDcfA-C9vFC6y7J=YzO7K7RbS99mxGguAFwKhTnA@mail.gmail.com>
Subject: Re: Given an x32 userspace with a gcc to match (ie defaults to -mx32)
 then CONFIG_EFI_STUB is unavailable
To:     Seed Of Onan <seedofonan@yahoo.com>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 6, 2021 at 12:34 PM Seed Of Onan <seedofonan@yahoo.com> wrote:
>
> Note that everything else about configuring, building, and executing the =
kernel that results works great.
>
> The trouble appears to be because of the dependency test under CONFIG_EFI=
_STUB has $(cc-option,-mabi=3Dms) and (looking at that macro's definition i=
n scripts/Kconfig.include) CLANG_FLAGS doesn't have -m64 (but certainly it =
is getting onto the command line of each invocation of gcc some other way) =
and gcc errors when combining -mabi=3Dms with (in this case defaulted) -mx3=
2.
>
> I'm figuring that although it could be done in principle, the gcc folks w=
ould object to establishing a meaning to the -mabi=3Dms calling convention =
for x32 primarily because Microsoft doesn't support that and the "ms" here =
stands for "Microsoft", I presume.
>
> In any case, what do you think? Shouldn't the cc-option macro be more com=
plete -- if "-m64" is being added because the build config system knows tha=
t it is needed, then it should be included in the command line used by cc-o=
ption macro? Perhaps the "-m64" happens to be in the same environment varia=
ble as the "-mabi=3Dms" part, in which case couldn't instead one just chang=
e the dependency test to be like $(cc-option,-m64 -mabi=3Dms)?
>
> Or am I missing the mark and there's a better fix in another place?
>
> Please help. Thank you,
> -Gary
>



I was not invoked in anyway in the following commit.

commit 8f24f8c2fc82f701866419dcb594e2cc1d3f46ba
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Tue Dec 24 16:10:12 2019 +0100

    efi/libstub: Annotate firmware routines as __efiapi



I added Ard to Cc.



At least, please describe your problem properly.
What error did you get? How to reproduce it?



--=20
Best Regards
Masahiro Yamada
