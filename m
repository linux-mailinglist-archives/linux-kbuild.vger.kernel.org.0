Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB10343E306
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 16:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhJ1OHV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 10:07:21 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54253 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbhJ1OHT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 10:07:19 -0400
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 19SE4WjO022024;
        Thu, 28 Oct 2021 23:04:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 19SE4WjO022024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1635429873;
        bh=Sea5hD6phvwTmk5ZADmU7oqXzEZCMAYU29Idfkm0Ubg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yi6BwuyyjwhN8oBIlmznzedZQr+PW3rIPs6ynCAqem0e1daYGX3uxzeFAGu3f2XS2
         xu/H52j/+0ymy6o/EJJ/ULeM2YHq4/DvlJmR7yQaFxVsAywb0DS7rePauSePa0hsHp
         HoFD3dJhL1+HncmghTJSxkZu5nec+K9GSbrnm6qK0iVv5lFwRMedTtBHAIynvJ40Gg
         aUNqdtB11wCXtrS5H+BLaPXDklyKjFwS7Nl22tJR3xIKkNe0SFBQ5YcNvEc6BWJBBW
         9wIqU6QHfb9CrynA6S5qAp+Jfuph2+bI7bEdI/NK8tLZ1BQBcKG772Rkf1foEENmD2
         q5Ynm4fz9Tpbw==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id g184so6461445pgc.6;
        Thu, 28 Oct 2021 07:04:32 -0700 (PDT)
X-Gm-Message-State: AOAM532zVUIGjF7f+KWtISQEuZf6ENkq+7hrGe6aVhQyOt9anFnvmKxb
        KbKBXqc03QlmnUh6zx57U8FbyUVlNHl1vlZlUd4=
X-Google-Smtp-Source: ABdhPJxdmip7Bng/77jo+FGar0VlJBV9bZ/zdzncUg6wrysw8S0CsBXN4HXY6vfrN3NqhuNyVoDQtkD/H7GWQHA9I8o=
X-Received: by 2002:a63:d64c:: with SMTP id d12mr3422492pgj.186.1635429871388;
 Thu, 28 Oct 2021 07:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <962c0565-89a3-c6d2-37e0-a93c8c753d57@quicinc.com>
In-Reply-To: <962c0565-89a3-c6d2-37e0-a93c8c753d57@quicinc.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 28 Oct 2021 23:03:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQX2GiUB04fOm7p=F+H5p9XFQjt9hEPSZS4JR+FZK6PZg@mail.gmail.com>
Message-ID: <CAK7LNAQX2GiUB04fOm7p=F+H5p9XFQjt9hEPSZS4JR+FZK6PZg@mail.gmail.com>
Subject: Re: Introduce "make debugconfig"
To:     Qian Cai <quic_qiancai@quicinc.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 10:32 PM Qian Cai <quic_qiancai@quicinc.com> wrote:
>
> Hi there, some general debugging features like kmemleak, KASAN, lockdep,
>
> UBSAN etc help fix many viruses like a microscope. On the other hand, those
>  features are scatter around and mixed up with more situational debugging
>  options making them difficult to consume properly.
>
>
>
> Since I have been deal with those options on a daily basis for the last
>
> a few years and accumulated the knowledge of their pros and cons, I am
>
> thinking about to create an initial "make debugconfig" target, so that
> it could amplify the general debugging/testing efforts and help
> establish sensitive default values for those options across the broad.
>
>
> The idea is to have a debugconfig inside kernel/configs/ and update
> scripts/kconfig/Makefile

Please do not wire it up to Makefile.




> and Documentation/admin-guide/README.rst
> accordingly. I am still trying to figure out a few implementation
> details like how to convert an existing .config to debugconfig, but want
> to gather some feedback before I dive in too deep.



-- 
Best Regards
Masahiro Yamada
