Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9202CA4DC
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 15:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391401AbgLAOCS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 09:02:18 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:49911 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391102AbgLAOCS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 09:02:18 -0500
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0B1E1Hc2025598;
        Tue, 1 Dec 2020 23:01:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0B1E1Hc2025598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606831277;
        bh=42+OWCIwxDyM+q69U8eB2vW06YbrOCdwfCtvzHCs448=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gmt7lYV+rHQK/L9WfkAgGjfHGlE0EOxtX3IzUo3Aj0BVMwhX29VhVL+Qv+4F40fx6
         5yyKKFqzmCWuGRbtoksP4YzlM4g2PQavtBIDvA/i4NaxW6uCW8mKsrvRzRlnHGUhx3
         peTk8hfgp53rSmmJHZPUVo+8sPV6+dTCyotCyFYqFeLsgDvjHRip7Lgghcoe5HhXxD
         cj1S7D21kV9p3gHhn2DGokXHDFKRVBSoOK8JHwxBc9TCeOAzrVIJg04Mddb7ljR+gk
         z9AtADv/WMVlzKQpNcVTMnLjh+aAgHBx6J0AiIMYL6bZfOLI6GuBA8SxzfkPIi9aC+
         QFTmDH15qjxYA==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id r20so1277207pjp.1;
        Tue, 01 Dec 2020 06:01:17 -0800 (PST)
X-Gm-Message-State: AOAM531KRRPWESX4MEIa/bprvUN1A7JkBUDV+apQFB2F4b7EBQ6qTTdX
        aRwfF1RCdUdM9YeQVgUn09TCHU2sWgfhDnoisRk=
X-Google-Smtp-Source: ABdhPJwlJoYz4cF+HFjxUOTDEdCCTRMJH7oj2/FdPZtkRmI5/Y+CaI9P3b0DOFIbnJQilpCruAR0EO9rMgUqKfs9Lq8=
X-Received: by 2002:a17:902:402:b029:da:2cb9:56e8 with SMTP id
 2-20020a1709020402b02900da2cb956e8mr2802759ple.1.1606831276621; Tue, 01 Dec
 2020 06:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20201124182420.2202514-1-qperret@google.com>
In-Reply-To: <20201124182420.2202514-1-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 23:00:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNATj8C7C=dYcDD4M5Q-Zc_kUhY2+i6epH=LbiOAUaDZqiw@mail.gmail.com>
Message-ID: <CAK7LNATj8C7C=dYcDD4M5Q-Zc_kUhY2+i6epH=LbiOAUaDZqiw@mail.gmail.com>
Subject: Re: [PATCH] modpost: Make static exports fatal
To:     Quentin Perret <qperret@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 25, 2020 at 3:24 AM Quentin Perret <qperret@google.com> wrote:
>
> Using EXPORT_SYMBOL*() on static functions is fundamentally wrong.
> Modpost currently reports that as a warning, but clearly this is not a
> pattern we should allow, and all in-tree occurences should have been
> fixed by now. So, promote the warn() message to fatal() to make sure
> this never happens again.
>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  scripts/mod/modpost.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f882ce0d9327..70b0e825a139 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2663,9 +2663,9 @@ int main(int argc, char **argv)
>
>                 for (s = symbolhash[n]; s; s = s->next) {
>                         if (s->is_static)
> -                               warn("\"%s\" [%s] is a static %s\n",
> -                                    s->name, s->module->name,
> -                                    export_str(s->export));
> +                               fatal("\"%s\" [%s] is a static %s\n",
> +                                     s->name, s->module->name,
> +                                     export_str(s->export));
>                 }
>         }
>
> --
> 2.29.2.454.gaff20da3a2-goog
>


I am not a big fan of (ab)using fatal() for this case.

Please consider using error() once
the following is queued up.

https://patchwork.kernel.org/project/linux-kbuild/patch/20201201103418.675850-2-masahiroy@kernel.org/




-- 
Best Regards
Masahiro Yamada
