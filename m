Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E94E3822DF
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 04:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhEQCvI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 May 2021 22:51:08 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60991 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbhEQCvH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 May 2021 22:51:07 -0400
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 14H2nThF031004;
        Mon, 17 May 2021 11:49:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 14H2nThF031004
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621219770;
        bh=BlDuqY9vGz6gg8gF6Ez1NhQjRQ3zVpTIC+qoFRfVW58=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oe8DLjmTslGbVHZBTuEaPUV5obaGDkdPbTruXgzRLw29WyYvbC6dotL/bqnHlpvxL
         2HhEHCYY9melTeDXzcUMZ+SlcGT4sQ35XsvehOn78Vj8Oc0zy767XPzzsWQoxolhvm
         MUH4qU2DVL+Y66ahmaSl50+g5l5nFVFZVNdaCMIbHPvsSqLsHhQMnD6dqebFePOedM
         81FR6OvrFwPANVZxZUwsSL9POygPFAqK1Rnq44Rz5y5PVJNtOT34NWyExFHpVrd7jJ
         HGnxvSbaJ7cgn6SV0mllliy8bVMmeryiUWXn1vxuSCMYMgbm5LUQ6OXcuPGkXEGsTo
         IGbxye/Q6vD8w==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id w1so1303194pfu.0;
        Sun, 16 May 2021 19:49:29 -0700 (PDT)
X-Gm-Message-State: AOAM531Kl6Hm6MXabIhlwwC1GgRjCqR4iaxFsdHaCKHs9oK4eX+N92O8
        NzeqJrt+x0WP0iXJ2xsWXziX6m+n/aiF2ENfYBQ=
X-Google-Smtp-Source: ABdhPJzcIh10qvepSeRPqigyMT/8QPGLp73hIekQ8h2nLYsdRUOCvsLJ4ZTBfwOvUPO2xxslgUXXf6xMj9LsBmfiPLM=
X-Received: by 2002:aa7:94af:0:b029:28e:80ff:cc1d with SMTP id
 a15-20020aa794af0000b029028e80ffcc1dmr57688983pfl.63.1621219769255; Sun, 16
 May 2021 19:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <13e53f8f5dab1e3e070b4cb34bbe8b89f85f5326.1621076083.git.mkubecek@suse.cz>
In-Reply-To: <13e53f8f5dab1e3e070b4cb34bbe8b89f85f5326.1621076083.git.mkubecek@suse.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 17 May 2021 11:48:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQewGP4aRU-Xm60wTZuJ5-u2jPcgxNSBxUP0VjzprtMhg@mail.gmail.com>
Message-ID: <CAK7LNAQewGP4aRU-Xm60wTZuJ5-u2jPcgxNSBxUP0VjzprtMhg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: dummy-tools: adjust to stricter stackprotector check
To:     Michal Kubecek <mkubecek@suse.cz>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 15, 2021 at 7:58 PM Michal Kubecek <mkubecek@suse.cz> wrote:
>
> Commit 3fb0fdb3bbe7 ("x86/stackprotector/32: Make the canary into a regular
> percpu variable") modified the stackprotector check on 32-bit x86 to check
> if gcc supports using %fs as canary. Adjust dummy-tools gcc script to pass
> this new test by returning "%fs" rather than "%gs" if it detects
> -mstack-protector-guard-reg=fs on command line.
>
> Fixes: 3fb0fdb3bbe7 ("x86/stackprotector/32: Make the canary into a regular percpu variable")
> Signed-off-by: Michal Kubecek <mkubecek@suse.cz>


Applied to linux-kbuild/fixes.
Thanks.

> ---
>  scripts/dummy-tools/gcc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
> index f6d543725f1e..b2483149bbe5 100755
> --- a/scripts/dummy-tools/gcc
> +++ b/scripts/dummy-tools/gcc
> @@ -76,7 +76,11 @@ fi
>  if arg_contain -S "$@"; then
>         # For scripts/gcc-x86-*-has-stack-protector.sh
>         if arg_contain -fstack-protector "$@"; then
> -               echo "%gs"
> +               if arg_contain -mstack-protector-guard-reg=fs "$@"; then
> +                       echo "%fs"
> +               else
> +                       echo "%gs"
> +               fi
>                 exit 0
>         fi
>
> --
> 2.31.1
>


-- 
Best Regards
Masahiro Yamada
