Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6962732B305
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbhCCB07 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:26:59 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37171 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236935AbhCBDiA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Mar 2021 22:38:00 -0500
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 1223bJZO025766;
        Tue, 2 Mar 2021 12:37:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 1223bJZO025766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614656240;
        bh=Cr8tlH7j3bNl9ku5mVKuUWuEPpXto+pARDOog8IUFXQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nIrk26hfsHNaTCCwg++1+kac6VToZMXoOqM9f2xCcSzviV0DTLoBevfbLklVpkMY4
         BQa0l1iaeImZLL5kaugjewm9Yl0nFm3uaZObnHfQhX3D0zY6zPVrM1OHOpsasw03+c
         hnV2m8ZVqHZGXC78HDd9uZGKbvpuJXgotJn7SfVFG8dgatE/RI5FAu0dNZqvfzwajb
         xDPtj1JZEiEH11gz8SLV112Q7h28zQ/nPTlBXUeTZpGfGw7YKM7hOlAnYKFSlr0m86
         bvpyYj2odxrlSQMn2PXXlxoj6k0ZANEXGTxzR2ri1YNeqZrWGDfJaBHSV0HIycJued
         02e1K0U9KgIWQ==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id i4-20020a17090a7184b02900bfb60fbc6bso556261pjk.0;
        Mon, 01 Mar 2021 19:37:19 -0800 (PST)
X-Gm-Message-State: AOAM532FwEogNfqKfWEaW256DEAjbNkfcMFMSTdyb3GgRd5fwbuhoiMC
        b4+qDQsrSClSlIs1Ibff4jgYL/Jrh+iFr/bXCRs=
X-Google-Smtp-Source: ABdhPJz4JiErB3PkAxU+Fn2BaEgHDgOyAfIhLnetawhnApDyqfgv/d1iNz4PmY8Rfmik+QCXimbFbqu4fY5+JJVBBUM=
X-Received: by 2002:a17:90a:3b0e:: with SMTP id d14mr2238354pjc.198.1614656239307;
 Mon, 01 Mar 2021 19:37:19 -0800 (PST)
MIME-Version: 1.0
References: <1614608540-1025-1-git-send-email-jshriram@codeaurora.org>
In-Reply-To: <1614608540-1025-1-git-send-email-jshriram@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 2 Mar 2021 12:36:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjxtyiBAfejQKePp-f=MTpA2PjAEedsHyCjHx6_eoJqA@mail.gmail.com>
Message-ID: <CAK7LNARjxtyiBAfejQKePp-f=MTpA2PjAEedsHyCjHx6_eoJqA@mail.gmail.com>
Subject: Re: [PATCH] scripts: Fix incremental build header re-generation
To:     Jeevan Shriram <jshriram@codeaurora.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Trilok Soni <tsoni@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 1, 2021 at 11:23 PM Jeevan Shriram <jshriram@codeaurora.org> wrote:
>
> compile.h and autoconf.h are ignored when checking headers sha as they
> are always re-generated for every kernel compilation. However,
> these two headers are packaged into kheaders tar. During incremental
> compilation of kernel, kheaders tar file is always generated and re-packaged
> irrespective of the changes in headers.


I do not see this problem.
Could you describe the steps to reproduce it, please?







> Change-Id: I7a64faebb81df44c32230b0fea1d6df09d7ce66f
> Signed-off-by: Jeevan Shriram <jshriram@codeaurora.org>
> ---
>  kernel/gen_kheaders.sh | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index c1510f0..5499f72 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -51,8 +51,7 @@ this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
>  if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
>  if [ -f kernel/kheaders.md5 ] &&
>         [ "$(head -n 1 kernel/kheaders.md5)" = "$headers_md5" ] &&
> -       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
> -       [ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
> +       [ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ]; then
>                 exit
>  fi
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
Best Regards
Masahiro Yamada
