Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2932F09AC
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Jan 2021 21:19:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbhAJUSP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Jan 2021 15:18:15 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50256 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbhAJUSP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Jan 2021 15:18:15 -0500
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 10AKHAHD018308;
        Mon, 11 Jan 2021 05:17:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 10AKHAHD018308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610309831;
        bh=92UFZwn5rH6dES5yWvRNhvQHxZ2dhzVHs9u2pm1p3m8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=w9wZFhrRfhuYH7QMhcKbYvfQ4XywvjU8wmdzxSDDLGF1JHTz+3eFuQUw0PfpYdTHS
         CLxxEzdG3XbzPl5d0seExPwIsfoIDqtvDe5UkG+ld2U6XkpZM6skneTyJKgoOzoHTM
         CgLvvotIT/Csh6Yq99SI1AWsvIWKgd1tH+cIT2UDM/nGNzQHerv0TlvkJEpSvbZ+ue
         xnqKiYnNpXzzMKHBQsw8vASd1vxXWjGxHatu0L3/qMtJHEWa4DZJJ5cLhGcGiyiZJW
         SGddTHTbZ8e4fuT7C/7ZirHewwm3PcTBheO7dt5yz1EWHpkjY9llQpZo31RQzq3TWN
         zBqDyzMs9R1Zg==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id l23so9208799pjg.1;
        Sun, 10 Jan 2021 12:17:11 -0800 (PST)
X-Gm-Message-State: AOAM531nt0Q1z1TousGiZUSI3fK4OCWpoqgjqnSZlpO31THdRKl+Z+OW
        QravTFB7pNOOINiZbtfzllPHHW6U4ZzuEZiMLBQ=
X-Google-Smtp-Source: ABdhPJyoDpYzVjeVK4wF66jhvCNZJLbkOwN30MRYXw53O0JWsjmYZ2CY3S9XTi+zQjJYtdxeK2PgV0ITQxEKG1O8D/M=
X-Received: by 2002:a17:902:9b91:b029:db:f003:c5eb with SMTP id
 y17-20020a1709029b91b02900dbf003c5ebmr13288781plp.1.1610309830433; Sun, 10
 Jan 2021 12:17:10 -0800 (PST)
MIME-Version: 1.0
References: <6f551ebb80f88e9b1bf6aa981f3c201409e1555c.1610019699.git.viresh.kumar@linaro.org>
In-Reply-To: <6f551ebb80f88e9b1bf6aa981f3c201409e1555c.1610019699.git.viresh.kumar@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 11 Jan 2021 05:16:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-d-9VSLdS9SLM9_cjUrL3tvLXndiFw124c_qic2vh5g@mail.gmail.com>
Message-ID: <CAK7LNAQ-d-9VSLdS9SLM9_cjUrL3tvLXndiFw124c_qic2vh5g@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kbuild: Fix section reference
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 7, 2021 at 8:42 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Section 3.11 was incorrectly called 3.9, fix it.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  Documentation/kbuild/makefiles.rst | 2 +-


Applied to linux-kbuild. Thanks.


>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index d36768cf1250..9f6a11881951 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -598,7 +598,7 @@ more details, with real examples.
>         explicitly added to $(targets).
>
>         Assignments to $(targets) are without $(obj)/ prefix. if_changed may be
> -       used in conjunction with custom rules as defined in "3.9 Custom Rules".
> +       used in conjunction with custom rules as defined in "3.11 Custom Rules".
>
>         Note: It is a typical mistake to forget the FORCE prerequisite.
>         Another common pitfall is that whitespace is sometimes significant; for
> --
> 2.25.0.rc1.19.g042ed3e048af
>


-- 
Best Regards
Masahiro Yamada
