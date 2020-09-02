Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8946C25B204
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Sep 2020 18:50:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgIBQro (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 12:47:44 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:27668 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgIBQro (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 12:47:44 -0400
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 082GlSKw024027;
        Thu, 3 Sep 2020 01:47:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 082GlSKw024027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599065248;
        bh=3k2mLh1ZpDvilSN4hj2bI62MdEyVALec7gSW1Mn1QEo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DmcgU2kIIQMF0hH4EyzzBgwAX0DxBymVIgQcrQH/8iFQ0Zns11sKrHXt3rjK6rhPk
         WB2WKyOvLqQanVc4ZRCPQj9vb3Dk0w7iiL3isSiBRC417DDhcV1G9wLPetLyaNLB6G
         d8LxksAz3WvL5nwxUJBStEFmg8tpPNow1eVE8Co1KBxrTHrH6udNAEEOZU/XxayQs7
         EPiv2ah/AdZ/+EgwwglCYZDv2uhdlT2KTTp3CTt2ScZoDnfRZZexKedFqWAf/lsFBt
         OBCEdmuZwNzTzEUo+7rYLZGjE06yIIQSrVNB5lxr545EvxyUWs3J/6xOp3mUcmiTJ8
         UrKA5THwpWRGg==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id d19so2817464pgl.10;
        Wed, 02 Sep 2020 09:47:28 -0700 (PDT)
X-Gm-Message-State: AOAM531XFqMT6RGEMFgEoikAwlebjmF+VN3Uwzx8Xgd5Y05zHtEre/qp
        93eiPSNsdqp7L8KavP/79AHeveIshCdC1qHQG9g=
X-Google-Smtp-Source: ABdhPJwq48Llk0mh1HjSuc5awflktCBQOXZapJOtyxcrUw/POtlHKsmiU3V4Sb7UCxGf5EAgHpGuaPAF0rxa9+J/Ljs=
X-Received: by 2002:a05:6a00:1356:: with SMTP id k22mr4023716pfu.76.1599065247862;
 Wed, 02 Sep 2020 09:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <be80ceda-596b-03aa-394f-166cc6388aa0@infradead.org>
In-Reply-To: <be80ceda-596b-03aa-394f-166cc6388aa0@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Sep 2020 01:46:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQekh08D6=+CqRWiB7F4KCLOgSK9oof8ArVUvMc7B1YXQ@mail.gmail.com>
Message-ID: <CAK7LNAQekh08D6=+CqRWiB7F4KCLOgSK9oof8ArVUvMc7B1YXQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: streamline_config.pl: check defined(ENV
 variable) before using it
To:     Randy Dunlap <rdunlap@infradead.org>,
        Nathan Royce <nroycea+kernel@gmail.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 27, 2020 at 6:21 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> A user reported:
> 'Use of uninitialized value $ENV{"LMC_KEEP"} in split at
>  ./scripts/kconfig/streamline_config.pl line 596.'
>
> so first check that $ENV{LMC_KEEP} is defined before trying
> to use it.
>
> Fixes: c027b02d89fd ("streamline_config.pl: add LMC_KEEP to preserve some kconfigs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Changbin Du <changbin.du@gmail.com>
> Cc: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> ---



Applied to linux-kbuild/fixes with Nathan's tag

Reported-by: Nathan Royce <nroycea+kernel@gmail.com>



Nathan,
I think adding your tag is OK to credit your contribution.
Please let me know if you do not have it in
the commit log.








>  scripts/kconfig/streamline_config.pl |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> --- linux-next-20200825.orig/scripts/kconfig/streamline_config.pl
> +++ linux-next-20200825/scripts/kconfig/streamline_config.pl
> @@ -593,7 +593,10 @@ while ($repeat) {
>  }
>
>  my %setconfigs;
> -my @preserved_kconfigs = split(/:/,$ENV{LMC_KEEP});
> +my @preserved_kconfigs;
> +if (defined($ENV{'LMC_KEEP'})) {
> +       @preserved_kconfigs = split(/:/,$ENV{LMC_KEEP});
> +}
>
>  sub in_preserved_kconfigs {
>      my $kconfig = $config2kfile{$_[0]};
>


-- 
Best Regards
Masahiro Yamada
