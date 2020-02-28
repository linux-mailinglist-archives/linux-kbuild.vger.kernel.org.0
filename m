Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B58317358D
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 11:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgB1Kpk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 05:45:40 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20008 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgB1Kpk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 05:45:40 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01SAjZiL017509;
        Fri, 28 Feb 2020 19:45:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01SAjZiL017509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582886735;
        bh=AVWPDjvEFkL5nZDtBP72nvXCX+4qaLVka0coBrV64D8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u8IBV3SfBwXEchtxhDXF8Dji6oYDaaJZNyhD0p3923ssYwY7daukuG+/ZwPWEpoRj
         YtlNx0RX13NH6r4MYJmfUzirJ6bEx5Lo0hJkr1OX2eSucBA2Thgu9xFwr7eVFRMC44
         jeookHN/xeyPR25zrSjTvX3iXQNHdO+VOg1+/9oj/c0YXQAaRJTdsWsDrZ1qgfdpOl
         53KcxqzgTZ0Q0iDJcIpr8DlOlWvB/fS6n+XNOVITlOv5+4OaufgJbfqGkZvYvkln8M
         MtgFpMYTeHvbGMv7WcWiwgl8BYcgubjFubdWB5tTpIT7I5PpLnLU1NfrDF3TiK6jpF
         enHkOX+VediwA==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id r18so1640535vso.5;
        Fri, 28 Feb 2020 02:45:35 -0800 (PST)
X-Gm-Message-State: ANhLgQ0ovsptjidtv2mqDO0Qm7zpXblOv9eKdEUOxP+0jAq00qmMtuXc
        fKjjmyXzB37k0RrTx+iu2mXN1/MBXTUmiI2ZJ1Q=
X-Google-Smtp-Source: ADFU+vuT4IEKXTX14l2zA9Pn0Pag7bwinoTJNY2RRdKibw8N1mxf/ANOn4DHp/+jSmwUFj20bsSXGkGbGr0YnjKgM30=
X-Received: by 2002:a05:6102:48b:: with SMTP id n11mr2189284vsa.181.1582886734408;
 Fri, 28 Feb 2020 02:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20200218094139.78835-1-qperret@google.com> <20200218094139.78835-3-qperret@google.com>
 <CAK7LNAS0D_1k8FUJ+Bre1jrtGvHu28psU_xCa=K24iD7BkcJeA@mail.gmail.com> <20200228100302.GA228304@google.com>
In-Reply-To: <20200228100302.GA228304@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Feb 2020 19:44:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNATADSQDp9bGzChE1xck_vw_6B6joLXXozDBrWWv4f=v=w@mail.gmail.com>
Message-ID: <CAK7LNATADSQDp9bGzChE1xck_vw_6B6joLXXozDBrWWv4f=v=w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] kbuild: split adjust_autoksyms.sh in two parts
To:     Quentin Perret <qperret@google.com>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 28, 2020 at 7:03 PM Quentin Perret <qperret@google.com> wrote:
>
> On Friday 28 Feb 2020 at 01:41:50 (+0900), Masahiro Yamada wrote:
> > Hi.
> >
> > On Tue, Feb 18, 2020 at 6:41 PM Quentin Perret <qperret@google.com> wrote:
> > >
> > > In order to prepare the ground for a build-time optimization, split
> > > adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
> > > based on all currently available information (whitelist, and .mod
> > > files), and the other to inspect the diff between two versions of
> > > autoksyms.h and trigger appropriate rebuilds.
> > >
> > > Acked-by: Nicolas Pitre <nico@fluxnic.net>
> > > Tested-by: Matthias Maennich <maennich@google.com>
> > > Reviewed-by: Matthias Maennich <maennich@google.com>
> > > Signed-off-by: Quentin Perret <qperret@google.com>
> > > ---
> > >  scripts/adjust_autoksyms.sh | 36 +++-----------------------
> > >  scripts/gen_autoksyms.sh    | 51 +++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 55 insertions(+), 32 deletions(-)
> > >  create mode 100755 scripts/gen_autoksyms.sh
> > >
> > > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > > index ff46996525d3..2b366d945ccb 100755
> > > --- a/scripts/adjust_autoksyms.sh
> > > +++ b/scripts/adjust_autoksyms.sh
> > > @@ -1,14 +1,13 @@
> > >  #!/bin/sh
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >
> > > -# Script to create/update include/generated/autoksyms.h and dependency files
> > > +# Script to update include/generated/autoksyms.h and dependency files
> > >  #
> > >  # Copyright:   (C) 2016  Linaro Limited
> > >  # Created by:  Nicolas Pitre, January 2016
> > >  #
> > >
> > > -# Create/update the include/generated/autoksyms.h file from the list
> > > -# of all module's needed symbols as recorded on the second line of *.mod files.
> > > +# Update the include/generated/autoksyms.h file.
> > >  #
> > >  # For each symbol being added or removed, the corresponding dependency
> > >  # file's timestamp is updated to force a rebuild of the affected source
> > > @@ -38,35 +37,8 @@ esac
> > >  # We need access to CONFIG_ symbols
> > >  . include/config/auto.conf
> > >
> > > -ksym_wl=/dev/null
> > > -if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
> > > -       # Use 'eval' to expand the whitelist path and check if it is relative
> > > -       eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
> > > -       [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
> > > -       if [ ! -f "$ksym_wl" ]; then
> >
> >
> > Just a Nit.
> >
> > Maybe, is testing  -r better ?
> >
> > 'cat - "$ksym_wl"' is piped, so its error code is not checked.
> >
> > So, checking the read permission here is robust, I think.
>
> Right, that's a good point. And actually, I think we want both -f and
> -r. -r alone would consider a path to a folder as correct.
>
> This should do the trick:


Sounds good.

Thanks.



>
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index 679c9f05e4b4..16c0b2ddaa4c 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -24,7 +24,7 @@ if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
>         # Use 'eval' to expand the whitelist path and check if it is relative
>         eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
>         [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
> -       if [ ! -f "$ksym_wl" ]; then
> +       if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
>                 echo "ERROR: '$ksym_wl' whitelist file not found" >&2
>                 exit 1
>         fi
>
> I'll send a v6 shortly.
>
> Thanks!
> Quentin



-- 
Best Regards
Masahiro Yamada
