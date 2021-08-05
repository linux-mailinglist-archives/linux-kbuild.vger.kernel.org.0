Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 257E13E1506
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 14:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240650AbhHEMsv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 08:48:51 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:46940 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbhHEMsu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 08:48:50 -0400
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 175CluwM015994;
        Thu, 5 Aug 2021 21:47:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 175CluwM015994
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628167677;
        bh=jIPR2O/wSgPGHR9pIJA/jvrw2g80N0njD4lCEnw8R2E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vAHbWmJf/drD4VdbSH8UNVTBSWDesTC4Vfa4iXiKesZU99+owk4ZbBnqsSo/JGhax
         LI2Uvhk7+InFsFDomcQvyeyYxw4odT32IRWSrV9ljI+kX8Y38qRGa98JK44r8BNEh9
         13l4B8tT1+LYVmiQ0dJwPI9zrmWQFpFgVd/q+7fdAT9OmzvW8Ruw70RGgKyTgyEi5s
         B/6qLXwmJkJB5Ke40cyLeg3VHlOv4HO+BT7th3YKkI9fbbZ9LLh6ZYvLIMStSY8qtr
         1mlkSs+ZRmonZhQmbcnpDxJElTVVaHtPmZ0LUwzUYBShsE9t/WLCaH43UGSabr9L6V
         0gjU9CV9rVxaQ==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id mt6so8460365pjb.1;
        Thu, 05 Aug 2021 05:47:56 -0700 (PDT)
X-Gm-Message-State: AOAM530XrIBp1jw3vKCLQQQId42S3TJJuA6/tKryX3cV0s+Hp9KeVs4S
        MqmS23WMYh0ID5HJ4Tk8QZdbneXgB9JTsWT/Svc=
X-Google-Smtp-Source: ABdhPJwp6bNv9d3tv3e5hkUubgRBjvL3IlkFENLKM/+JtIM3RYNTLbDsjOp7knUKh3aKQqNCg7Ek4rmAPs2z0cUwoLo=
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr630529pgm.175.1628167675871;
 Thu, 05 Aug 2021 05:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <YPXeqUV+22sxXS9y@rric.localdomain> <20210719202844.18281-1-rrichter@amd.com>
In-Reply-To: <20210719202844.18281-1-rrichter@amd.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 21:47:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARtAv7Vybjk61_MffQhQj2HSZzAGtdCxr83ODPtk+1OaQ@mail.gmail.com>
Message-ID: <CAK7LNARtAv7Vybjk61_MffQhQj2HSZzAGtdCxr83ODPtk+1OaQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation/kbuild: Document the kconfig choice
 default value
To:     Robert Richter <rrichter@amd.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 5:29 AM Robert Richter <rrichter@amd.com> wrote:
>
> Document how choice defaults are determined:
>
> Default of a choice is its first visible choice element unless it is
> explicitly set by the 'default' property [1]. Choice elements do not
> support default attributes. [2]
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/symbol.c?h=v5.14-rc1#n245
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/menu.c?h=v5.14-rc1#n494
>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> ---
> v3: Fix base of v2 (rebased onto v5.14-rc2)
> v2: clarification on 'default' attribute of a choice
>     added example
> ---
>  Documentation/kbuild/kconfig-language.rst | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 98c24183d8c3..d919dde0bcbf 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -417,6 +417,21 @@ definitions of that choice. If a [symbol] is associated to the choice,
>  then you may define the same choice (i.e. with the same entries) in another
>  place.
>
> +The default value of a choice is set to the first visible choice
> +element unless it is explicitly set by the 'default' property.
> +
> +Note:
> +       Choice options do not support the 'default' attribute.
> +
> +E.g.::
> +
> +  choice
> +       default C1
> +  config C0
> +  config C1
> +       # no default attribute here
> +  endchoice
> +
>  comment::
>
>         "comment" <prompt>
> --
> 2.29.2
>


I am not sure whether this note is needed or not,
anyway the code example is wrong.

Kconfig:3:warning: config symbol defined without type
Kconfig:4:warning: config symbol defined without type
Kconfig:3:warning: choice value must have a prompt
Kconfig:4:warning: choice value must have a prompt
Kconfig:1:warning: config symbol defined without type
Kconfig:1:warning: choice must have a prompt







-- 
Best Regards
Masahiro Yamada
