Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91BF24B73F
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 12:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731399AbgHTKr4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 06:47:56 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51422 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731486AbgHTKrm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 06:47:42 -0400
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07KAlPHa027839
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 19:47:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07KAlPHa027839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597920446;
        bh=spoFGOqiUoG+XU6ZfitGDu2VG770Lkm0FhgNTi8ak4E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N2j+kmBeRg96WsUlofKCA0dYcTe87luAYQEtACbzBFMuwqDqg3TAQwci7EPdUX1EL
         uKzliNAe36bhwMZpulcJ2wy0672dF08ZJNBf0fsILPF8L8NMJLLQasF2RaPR8Oa/w7
         jopaewPlHnGV/OU00rC8eKQfQ99N2NvzGkjkfgIO8aR9TolyCqURov3liSe7R3Glx/
         R4otml9s8QIRDEtVc2zOmTCBJArQfthvbVhBQbax6f8BvWcMgs4YbuQtuXUgjnzss5
         xUiLjiVI+ihxDEhWVRuY283WwCKjLfkNX1Tvib8UoyFSgdEoNucpuaRgalZkJjvNMP
         Pqn95X4DzmYOw==
X-Nifty-SrcIP: [209.85.222.54]
Received: by mail-ua1-f54.google.com with SMTP id z12so423402uam.12
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2020 03:47:25 -0700 (PDT)
X-Gm-Message-State: AOAM530xxyT/1JL6Bf9kboW/gkRS2fbHPr2hRiwTGxhT5LvWb+TOVq5V
        kOW0NKjjo+CW6NWDx3Df44FnJXBU8tIhbjWizUk=
X-Google-Smtp-Source: ABdhPJwtVUXSo0Vs57e/T5jduM7y5Sc+SN2RmsgBdbrWilOMDjZ6O95rvVaP5l10C6F5KMvbsNGjNyuQ5ZNvp8n3fbE=
X-Received: by 2002:ab0:5b91:: with SMTP id y17mr1208233uae.95.1597920444600;
 Thu, 20 Aug 2020 03:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200819215554.5742-1-hayes.graeme.p@gmail.com>
In-Reply-To: <20200819215554.5742-1-hayes.graeme.p@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 20 Aug 2020 19:46:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQcKD=4OD++LX7_tSXajyoo1zuSjyR7shwDJNq=zj2ZeA@mail.gmail.com>
Message-ID: <CAK7LNAQcKD=4OD++LX7_tSXajyoo1zuSjyR7shwDJNq=zj2ZeA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kbuild: modules.rst: Edit '$$' typo, avoid
 make error
To:     Graeme Hayes <hayes.graeme.p@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 20, 2020 at 7:00 AM Graeme Hayes <hayes.graeme.p@gmail.com> wrote:
>
> Typo '$$' generates make error when run, and was pasted twice more.


Are you sure?

$$PWD is the correct escape sequence
to expand $PWD in the shell instead of Make.





> Signed-off-by: Graeme Hayes <hayes.graeme.p@gmail.com>
>
> ---
>  linux-kbuild/Documentation/kbuild/modules.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/linux-kbuild/Documentation/kbuild/modules.rst b/linux-kbuild/Documentation/kbuild/modules.rst
> index 85ccc87..c7837a5 100644
> --- a/linux-kbuild/Documentation/kbuild/modules.rst
> +++ b/linux-kbuild/Documentation/kbuild/modules.rst
> @@ -205,7 +205,7 @@ module 8123.ko, which is built from the following files::
>                 KDIR ?= /lib/modules/`uname -r`/build
>
>                 default:
> -                       $(MAKE) -C $(KDIR) M=$$PWD
> +                       $(MAKE) -C $(KDIR) M=$PWD
>
>                 # Module specific targets
>                 genbin:
> @@ -239,7 +239,7 @@ module 8123.ko, which is built from the following files::
>                 KDIR ?= /lib/modules/`uname -r`/build
>
>                 default:
> -                       $(MAKE) -C $(KDIR) M=$$PWD
> +                       $(MAKE) -C $(KDIR) M=$PWD
>
>                 # Module specific targets
>                 genbin:
> @@ -268,7 +268,7 @@ module 8123.ko, which is built from the following files::
>                 KDIR ?= /lib/modules/`uname -r`/build
>
>                 default:
> -                       $(MAKE) -C $(KDIR) M=$$PWD
> +                       $(MAKE) -C $(KDIR) M=$PWD
>
>                 # Module specific targets
>                 genbin:
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
