Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 921F41662B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2020 17:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbgBTQ3T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Feb 2020 11:29:19 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16587 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgBTQ3T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 11:29:19 -0500
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01KGSrpu021150;
        Fri, 21 Feb 2020 01:28:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01KGSrpu021150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582216134;
        bh=suDWqh/Vgm6OA76SAoEUzmbVVF3X/CirBwMThUNiH1o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oNP3POdFCSSgSISF29oMh/Bqi17PPKJfhNCdOnOM/2b6IqASCQMLZ8Wa68bxBOS9o
         Gnzyrg4zJSHZ0irU82QXP1IgtLK2Ek9TSKNaPbvQkTlUQRGjfrczssMt0lJ05iFP24
         nsF5n+RzOLuY1B+jokVhbErfnb8H07bqyFgcfY8t2pNxXRKlRzbShM8yw+hX8gtpt8
         XP7sOPoWakWDm2IDka4mSRBG8zbLvKxfxy3cErk7WXm+ETJF0aGCvlRYNqOYKSbRZg
         QGMZgvTgud1E2g5q2bG/h15tcLsO5Y+6SpBdim+RRgZiAAcpTdxwjL4vPtFDBto0Uu
         9Z8O2iopP2CIA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id x18so3057306vsq.4;
        Thu, 20 Feb 2020 08:28:53 -0800 (PST)
X-Gm-Message-State: APjAAAXCcl5s3PEpGa99VpUDdpPkQifjIHsbCkvKG9BiyfC3aNtdi/Tq
        GMs7F+bqv8AuK11QhcXorQlMGOv+alHn0vLINVw=
X-Google-Smtp-Source: APXvYqzG9OS+kRXfYSaRkZxjQAumRevTgqXu6zx+UCMngO3MELSrWbSBN/OotNZCAUm4Fnq4QoNMCg53D91kCf2SqR8=
X-Received: by 2002:a67:6485:: with SMTP id y127mr18279123vsb.54.1582216132571;
 Thu, 20 Feb 2020 08:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20200219011519.22148-1-masahiroy@kernel.org>
In-Reply-To: <20200219011519.22148-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 21 Feb 2020 01:28:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARuqSDxc1=pMQXUF942TSBeDeB0NosS-n0_hhiWhQZhQw@mail.gmail.com>
Message-ID: <CAK7LNARuqSDxc1=pMQXUF942TSBeDeB0NosS-n0_hhiWhQZhQw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove wrong documentation about mandatory-y
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 19, 2020 at 10:15 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This sentence does not make sense in the section about mandatory-y.
>
> This seems to be a copy-paste mistake of commit fcc8487d477a ("uapi:
> export all headers under uapi directories").
>
> The correct description would be "The convention is to list one
> mandatory-y per line ...".
>
> I just removed it instead of fixing it. If such information is needed,
> it could be commented in include/asm-generic/Kbuild and
> include/uapi/asm-generic/Kbuild.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Applied to linux-kbuild.

> ---
>
>  Documentation/kbuild/makefiles.rst | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 0e0eb2c8da7d..4018ad7c7a11 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1379,9 +1379,6 @@ See subsequent chapter for the syntax of the Kbuild file.
>         in arch/$(ARCH)/include/(uapi/)/asm, Kbuild will automatically generate
>         a wrapper of the asm-generic one.
>
> -       The convention is to list one subdir per line and
> -       preferably in alphabetic order.
> -
>  8 Kbuild Variables
>  ==================
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
