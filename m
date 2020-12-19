Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55A6F2DF04A
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Dec 2020 16:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgLSPtC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Dec 2020 10:49:02 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41913 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726780AbgLSPtC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Dec 2020 10:49:02 -0500
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0BJFm3v1015331;
        Sun, 20 Dec 2020 00:48:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0BJFm3v1015331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608392884;
        bh=pTrG7PuXB9Yly1G66C29z3g8B8r+nPVV+B5PAq6d6WQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g/yMLZNXkmgqkjLKr6ugbAxRYAfgAPJlXJZyxDdyG6Dk0ocQo83wAHNZpei+Q6oD7
         fb25CBhIol4CXEOqaupkhwsh547elc/GZbLhDlz+Z+FJruW64zBAfEHzCBUiT69A3T
         vowsP9wshhKoBXriVp9Kxq4ht1zwz35qsvnIu6wUfwQGLfUJN7iOhbxtW2To7Bp8D4
         HcdPqkaY6gaLuroy3tNN5bUwk4Vehhz8vMQhEHXsPqyysM1EWsK1Cz90Zft35eCnDP
         65217/sttdvCvRKidR52fRQx3lnTps20i3nMdbEZEjdaWBGNr8os9RrTwtQqqWmdg+
         5gJPNKyMljasg==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id 4so3057529plk.5;
        Sat, 19 Dec 2020 07:48:04 -0800 (PST)
X-Gm-Message-State: AOAM530NKZTsuL9Yi8u9ODMSQrCi4u2vPSsAXUMBvJBLzGbp/+YXZdPM
        Xu3HjmQQ9OkzLhJA74Yg1O96wlMV1ovtxeL/hAQ=
X-Google-Smtp-Source: ABdhPJy/y/YpMI47HiMoeEevCCNryZ0PuLJwivvixyE9y5TBfl0bP2ui5VzyaqAEdv3FJBZumMaIeuIYviGcfeWyXng=
X-Received: by 2002:a17:90a:c910:: with SMTP id v16mr9494090pjt.198.1608392883505;
 Sat, 19 Dec 2020 07:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20201219055947.29587-1-rdunlap@infradead.org>
In-Reply-To: <20201219055947.29587-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 20 Dec 2020 00:47:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASxzs8DxqzkaF0LiEA7Y4N+sf+bQ7=DdyYdgFWZWMP0tw@mail.gmail.com>
Message-ID: <CAK7LNASxzs8DxqzkaF0LiEA7Y4N+sf+bQ7=DdyYdgFWZWMP0tw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: config script: add a little user help
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Dec 19, 2020 at 3:00 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Give the user a clue about the problem along with the 35 lines of
> usage/help text.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Andi Kleen <ak@linux.intel.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  scripts/config |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20201218.orig/scripts/config
> +++ linux-next-20201218/scripts/config
> @@ -223,6 +223,7 @@ while [ "$1" != "" ] ; do
>                 ;;
>
>         *)
> +               echo "bad cmd: $CMD"

Please send this to stderr.



>                 usage
>                 ;;
>         esac



-- 
Best Regards
Masahiro Yamada
