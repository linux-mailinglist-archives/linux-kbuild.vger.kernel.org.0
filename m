Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7A7363B46
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 08:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhDSGJW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 02:09:22 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46635 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhDSGJW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 02:09:22 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 13J68VOY029471
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 15:08:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13J68VOY029471
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618812512;
        bh=ZJslR4Q3JAoms4pk3yj/iEsmpyeZrWn7DGm7NGRXDyE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=we9A2Bij8kCg4KBZ7cGXQsUcFfM87iB7bntwbRAmPtK9i18kst8NKICducOd9YW5h
         +oEBnyT9WqOAiTqpLozzcxtAqDY+X+ldVo0QGwVhiSFCGtRoKX1cLbB2OJW5AP2yrd
         5XO24b6rg43DE7iqvjc8yfpacJwRHmi1L5lDnPTUEn/tyAYL1fIfj1s7xE7hXAf1Ky
         rO1AswPUy+1C9UjCcbrdo9Rlhxxh/F3PQM2UKiXZLI5YR4fNS0EA/51kOz2EMCVRbt
         L/bbW52DsrP1dJYUl6uv9e3JUKnAvuTfh4IKOj7Ya1VrbMAWCnOBoQmN8vNlzzfJ4v
         kyv9a/Gmre7lA==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id e9so128325plj.2
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Apr 2021 23:08:32 -0700 (PDT)
X-Gm-Message-State: AOAM532zcmu9JIsosUtJejcEgu3ypatEndlf9LOR5z7+XugNoNZAmaop
        U3oViZTmTnuoNfes6jPhbWqi11OC3Y+SRwKb+W4=
X-Google-Smtp-Source: ABdhPJypPOig5yj88v8wFscwr72NFIOV8P34lk4RAj5Zq6jI7tU9BzpGU9GhjDZ+bK6J/RGFtmqFxyK/pYY/L4AENWU=
X-Received: by 2002:a17:902:8bcb:b029:ec:a192:21cf with SMTP id
 r11-20020a1709028bcbb02900eca19221cfmr4806286plo.71.1618812511481; Sun, 18
 Apr 2021 23:08:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210411101422.7092-1-bage@linutronix.de> <20210411101422.7092-4-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-4-bage@linutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 19 Apr 2021 15:07:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNATS-kxVPk+9Z-FN2aH5Vzp1r--bg+846Bpv28gE901PQg@mail.gmail.com>
Message-ID: <CAK7LNATS-kxVPk+9Z-FN2aH5Vzp1r--bg+846Bpv28gE901PQg@mail.gmail.com>
Subject: Re: [PATCH 3/6] builddeb: clean generated package content
To:     bage@linutronix.de
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 7:14 PM <bage@linutronix.de> wrote:
>
> From: Bastian Germann <bage@linutronix.de>
>
> For each binary Debian package, a directory with the package name is
> created in the debian directory. Include the generated files in the
> package's clean target.
>
> Signed-off-by: Bastian Germann <bage@linutronix.de>
> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 2fa149796791..717223ef6b03 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -246,7 +246,7 @@ binary-arch: build-arch
>         KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg
>
>  clean:
> -       rm -rf debian/*tmp debian/files
> +       rm -rf debian/*tmp debian/files debian/linux-*
>         \$(MAKE) clean
>
>  binary: binary-arch
> --
> 2.30.2
>


Please also remove debian/*tmp.


Add this tag:

Fixes: 1694e94e4f46 ("builddeb: match temporary directory name to the
package name")


-- 
Best Regards
Masahiro Yamada
