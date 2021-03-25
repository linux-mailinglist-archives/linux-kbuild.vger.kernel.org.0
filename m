Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B4634880C
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 05:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCYEsT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 00:48:19 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:48778 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCYEr4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 00:47:56 -0400
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 12P4lfQV004224;
        Thu, 25 Mar 2021 13:47:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 12P4lfQV004224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616647662;
        bh=LaHNVlaOy53jqJwwQZtyYFUyZryl+Mejn02Pwe9PQ+8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=l16p7qe232+EwMAh73vfvxSMQ+zmJofd1m1i4xCgDzaEcS4tHzjcjVFVZScFiOH0h
         x+dHdlIfKH0+ai533ICzNWvPhn1/33eI2lpW6Loi9oyeK1MEdqLvBq0MLzRykTckON
         2h4qrk31+IBDQBv6fX4Lrk/93nVMGRuhst6etVVVLhQh4PL6dX8GIw4AiQnVTvWM3+
         AVuJSOgUTXGsbkztUNiu7cTCf+YPkoG9StG5Lz2KcbIizT3XVQaJxhx1yN+I1j3JJp
         Ut7DA1Bqmb3bfk0m6pj+4k8qbZhLlr0qc1T+bBHRYrlQ9Lcy7hQckzyDQYRKYy/2FB
         exBcgkiSd4QAg==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so2204135pjh.1;
        Wed, 24 Mar 2021 21:47:41 -0700 (PDT)
X-Gm-Message-State: AOAM5300tsTbHKo7kAmYebTwpCKsCJoBizTRomubDuH6ro1mx55clStc
        9b+9GFSUTbl+sgqmvK+UaOiQo70SaG1UF9v8BUI=
X-Google-Smtp-Source: ABdhPJyyw4LcZWLus4AWeJJR5BGVrOMh0lyGvjKobpoQlUoSLI7eOb1DEDUgWvaOpkvRaDb3EgEzScTtJpjtaxxl9Qc=
X-Received: by 2002:a17:90a:fb54:: with SMTP id iq20mr6592682pjb.153.1616647660965;
 Wed, 24 Mar 2021 21:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <1615791344-48675-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1615791344-48675-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 25 Mar 2021 13:47:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARWjJsm79mBtFsRsGCsLn7JpGwzEQdzAbHcT-VmeBQKVw@mail.gmail.com>
Message-ID: <CAK7LNARWjJsm79mBtFsRsGCsLn7JpGwzEQdzAbHcT-VmeBQKVw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: use true and false for bool variable
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 15, 2021 at 3:55 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> fixed the following coccicheck:
> ./scripts/kconfig/confdata.c:36:9-10: WARNING: return of 0/1 in function
> 'is_dir' with return type bool
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Applied. Thanks.




>  scripts/kconfig/confdata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 2568dbe..b65b8c3 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -33,7 +33,7 @@ static bool is_dir(const char *path)
>         struct stat st;
>
>         if (stat(path, &st))
> -               return 0;
> +               return false;
>
>         return S_ISDIR(st.st_mode);
>  }
> --
> 1.8.3.1
>


-- 
Best Regards
Masahiro Yamada
