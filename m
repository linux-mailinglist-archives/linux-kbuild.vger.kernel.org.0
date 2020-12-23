Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF9F2E19BC
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 09:13:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgLWINj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 03:13:39 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25124 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727719AbgLWINi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 03:13:38 -0500
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BN8CZIu013910
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Dec 2020 17:12:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BN8CZIu013910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608711156;
        bh=KjbPMvNB1jJ25Q1+rNxb9MpPzanwkOB9BlMl9UaHA1E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g3TeodBW9zA7YNeJqROgzWXd69H2DZj76ERhHINM9I97vP37Ms8bQG7LnM1clfZ6n
         uIsv3VfzUKXt/X/hTFerRm0UMv4Vn7z3FNL9Dgnx6N9SFjmJ0I3skYb9rQl/3OtQbv
         nG+FgH2x4aZTXvWxfjjnOFpT+9lVkd51qYKkbWFRj5srDfqKRsWnss14N9OI99xIg5
         U2j9zjH76jZvj54N+FpfkH6vuKUkibdp8Pl+AvJomggHm1zmdXgGVd4HDvl4kpGTcO
         iTnETNh3m4bhZGeN+7g7XvfN867VOZ1k0HAAxkNu76SktNjJu+71DYEsi4B9EzoD4N
         rrY67CKXd6nPg==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id m5so2782004pjv.5
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Dec 2020 00:12:36 -0800 (PST)
X-Gm-Message-State: AOAM530vaA3x7Uz8EJO6lR8vwfKjKd8SiM8zkVbVz0G7EH7JpBzY0SIG
        LLIbi0Hcyon0FPoHY7YBHejU3LP0l4Mpq5qFOmk=
X-Google-Smtp-Source: ABdhPJzmCgn5lRXAnRNB3Vmi6aRcCf16DXrMeVPaXz9wQkXUB7qVeFBZmhjw3Que1WVT7bMYOPq+jck8ZAPrz/i4eWQ=
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr24828758pjb.153.1608711155478;
 Wed, 23 Dec 2020 00:12:35 -0800 (PST)
MIME-Version: 1.0
References: <CAL1ky9r9FutN2baRhV_WO-stV1FHKq-par4uv-VfCdofcGhSVg@mail.gmail.com>
 <CAK7LNAQRa18QWQep=Tj9Due_TvAotD4_v0GX83yP0SKX=jUQSQ@mail.gmail.com>
 <CAL1ky9orK39qmvPPk05SoUHWByTwL-kSkgTsbZEvh1vUR4+hXw@mail.gmail.com>
 <CAK7LNARnoU6GFCxNTEzOqj1J2hYZVNJKTtEb81b_VtRz6jswiQ@mail.gmail.com> <60f12be3-2f7f-8c7c-55dc-f360ff959fe0@john-millikin.com>
In-Reply-To: <60f12be3-2f7f-8c7c-55dc-f360ff959fe0@john-millikin.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 23 Dec 2020 17:11:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNARH1CD-2ykVr17-xbjHB7GWCAWY0KA3u09kL7HUYuDxHQ@mail.gmail.com>
Message-ID: <CAK7LNARH1CD-2ykVr17-xbjHB7GWCAWY0KA3u09kL7HUYuDxHQ@mail.gmail.com>
Subject: Re: [PATCH v2] lib/raid6: Let $(UNROLL) rules work with macOS userland
To:     John Millikin <john@john-millikin.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 23, 2020 at 3:23 PM John Millikin <john@john-millikin.com> wrote:
>
> Older versions of BSD awk are fussy about the order of '-v' and '-f'
> flags, and require a space after the flag name. This causes build
> failures on platforms with an old awk, such as macOS and NetBSD.
>
> Since GNU awk and modern versions of BSD awk (distributed with
> FreeBSD/OpenBSD) are fine with either form, the definition of
> 'cmd_unroll' can be trivially tweaked to let the lib/raid6 Makefile
> work with both old and new awk flag dialects.
>
> Signed-off-by: John Millikin <john@john-millikin.com>
> ---
> Changes in v2:
>   - Updated the patch description to note that only older versions of
>     awk (as found in macOS and NetBSD) need this patch to work.
>
>  lib/raid6/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
> index b4c0df6d706d..c770570bfe4f 100644
> --- a/lib/raid6/Makefile
> +++ b/lib/raid6/Makefile
> @@ -48,7 +48,7 @@ endif
>  endif
>
>  quiet_cmd_unroll = UNROLL  $@
> -      cmd_unroll = $(AWK) -f$(srctree)/$(src)/unroll.awk -vN=$* < $< > $@
> +      cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
>
>  targets += int1.c int2.c int4.c int8.c int16.c int32.c
>  $(obj)/int%.c: $(src)/int.uc $(src)/unroll.awk FORCE
> --
>


Applied to linux-kbuild. Thanks.

The patch is corrupted somehow (another one too).

I manually fixed it, but please check the patch format next time.


masahiro@grover:~/workspace/linux-kbuild$ git am -s
~/Downloads/v2-lib-raid6-Let-UNROLL-rules-work-with-macOS-userland.patch
Applying: lib/raid6: Let $(UNROLL) rules work with macOS userland
error: corrupt patch at line 16
Patch failed at 0001 lib/raid6: Let $(UNROLL) rules work with macOS userland
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".




-- 
Best Regards
Masahiro Yamada
