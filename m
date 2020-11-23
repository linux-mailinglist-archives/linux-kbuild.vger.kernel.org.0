Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E892BFFA1
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 06:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgKWFYG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Nov 2020 00:24:06 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29468 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgKWFYG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Nov 2020 00:24:06 -0500
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0AN5NrcE019320;
        Mon, 23 Nov 2020 14:23:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0AN5NrcE019320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606109034;
        bh=uwFae/h5TnuX8Oqwdmcex7ZoKY5x9+HUwl7LPW1ePF8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ICfkDDrV4HHXdNq1c4Jhdz4fudR4Nfm5K3roRZW+wm4Se8N0cnwcEBIqL2+O4vjP9
         HBki0aHU5GsIA7tH9u8dpWCGrKzU17YHTbPcBXmxWgYTpW9GVpy0v4EHuE8FqKedGR
         5QhH/A0HFgn7I1O1984LFSNwUgDIof1qN1oihLQYZ9wfuuEw/5fVYc/HtHftXl/LPv
         5x20SPA+8pn3MgLjP8wdq8u43eFczbmlJTN2EcQhVSxX9+5fwjZHL4Z5pFAFYeusXy
         YdhgkAD+YcnreRlKvP2jLAJY6z0HB0G4p9vcGX//inoEiIJhLarcyoxuRHOKomY80v
         HtDmW1UTIwA0w==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id v21so13190620pgi.2;
        Sun, 22 Nov 2020 21:23:54 -0800 (PST)
X-Gm-Message-State: AOAM530IKXNoc4gqBGvdy6I03xXFB/EaY82486Q2gfrSDV40Vzxxi8lO
        dN37lPUFmWP4mravgvyRt3HBXWNbzgn/CzyOmaE=
X-Google-Smtp-Source: ABdhPJy+vPgz7egPiM/KMLaIpQXKFUMI23c0CcEnsjRVt5IqdbCrbPgmTjOiLTEe5K2icSzZIbFRiSQhxrupzJFzLUg=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr13964581pgu.175.1606109033386;
 Sun, 22 Nov 2020 21:23:53 -0800 (PST)
MIME-Version: 1.0
References: <20201103054425.59251-1-chao.wang@ucloud.cn>
In-Reply-To: <20201103054425.59251-1-chao.wang@ucloud.cn>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 23 Nov 2020 14:23:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
Message-ID: <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
To:     WANG Chao <chao.wang@ucloud.cn>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
>
> extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
> ("kbuild: do not create built-in objects for external module builds").
>
> This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
> and 'make M=...' to build livepatch patch module.
>
> Add extra-y to targets-for-modules so that such kind of build works
> properly.
>
> Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
> ---
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index ae647379b579..0113a042d643 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -86,7 +86,7 @@ ifdef need-builtin
>  targets-for-builtin += $(obj)/built-in.a
>  endif
>
> -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
> +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
>
>  ifdef need-modorder
>  targets-for-modules += $(obj)/modules.order
> --
> 2.29.1
>

NACK.

Please fix your Makefile.

Hint:
https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/


Probably what you should use is 'targets'.







-- 
Best Regards
Masahiro Yamada
