Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DFF2DBB28
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 07:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgLPGVy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 01:21:54 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:29484 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbgLPGVy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 01:21:54 -0500
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0BG6KhPM015053;
        Wed, 16 Dec 2020 15:20:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0BG6KhPM015053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608099643;
        bh=RzVHFM8iY76lZlDdNWArl3gO6UPVSG6umbPbfFwlJEQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NTneXKdgdVgkNQ41o6nYYRcE+rF58eiFSKQdLgn7O9dkt6RduT6kt9mNrPlHOAGCk
         8/Zg0cvqExw92vJu3uQk3soXuCK6rXXU0h4YNHCY341NiDuSIv5z/lp/QO0oQImYWj
         Do2No12q/PUajq572/sTO+nlIhzepEtP+gsBs6IojuFOrdS9a8hHZYaox1yINk1w3H
         C8f8Js+JMf8UpIe+jVaERFvImb0CphJhHzhpk7iauzNkMQJQeOX3o/iAnbdmZb7Uj5
         BQQBNV8xzbQAaaj3ujKRNZUdVK5Z8SF3KnS+I0vIYQY7YX254n47IgnbnTKGDJXsmO
         Ju0CqcgOQMKqQ==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id c12so16422050pgm.4;
        Tue, 15 Dec 2020 22:20:43 -0800 (PST)
X-Gm-Message-State: AOAM530jZaCbGztRIlvBluyPvB7QfYC6AJh1WKFJHePwuQgYjoisa0ur
        X05OkHmzqjz2F0mbEZ2Z3RfH6r9FQl3Cf9Rv9hQ=
X-Google-Smtp-Source: ABdhPJxQlvJPe4n1EYyD3lIQ683f0pdbFlLmJE05qn+5mc0dAIDw2pHO53kvOmBoNmnKyrGE6JFfZ9vFB1Ne5+oEIm8=
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca1a with SMTP id
 t2-20020a62d1420000b029019e62a0ca1amr30519520pfl.80.1608099642801; Tue, 15
 Dec 2020 22:20:42 -0800 (PST)
MIME-Version: 1.0
References: <20201201165222.2001985-1-qperret@google.com>
In-Reply-To: <20201201165222.2001985-1-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 16 Dec 2020 15:20:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARaPZP0FkOCzq0M+9uA6TOL-TDPi4+rOjRBTsTefP_3Zw@mail.gmail.com>
Message-ID: <CAK7LNARaPZP0FkOCzq0M+9uA6TOL-TDPi4+rOjRBTsTefP_3Zw@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: turn static exports into error
To:     Quentin Perret <qperret@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 2, 2020 at 1:52 AM Quentin Perret <qperret@google.com> wrote:
>
> Using EXPORT_SYMBOL*() on static functions is fundamentally wrong.
> Modpost currently reports that as a warning, but clearly this is not a
> pattern we should allow, and all in-tree occurences should have been
> fixed by now. So, promote the warn() message to error() to make sure
> this never happens again.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Matthias Maennich <maennich@google.com>
> Signed-off-by: Quentin Perret <qperret@google.com>
>
> ---
> v2: now depends on 20201201103418.675850-2-masahiroy@kernel.org

Applied to linux-kbuild. Thanks.


> ---
>  scripts/mod/modpost.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 43e00867623a..5562526c8c32 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2648,9 +2648,9 @@ int main(int argc, char **argv)
>
>                 for (s = symbolhash[n]; s; s = s->next) {
>                         if (s->is_static)
> -                               warn("\"%s\" [%s] is a static %s\n",
> -                                    s->name, s->module->name,
> -                                    export_str(s->export));
> +                               error("\"%s\" [%s] is a static %s\n",
> +                                     s->name, s->module->name,
> +                                     export_str(s->export));
>                 }
>         }
>
> --
> 2.29.2.454.gaff20da3a2-goog
>


-- 
Best Regards
Masahiro Yamada
