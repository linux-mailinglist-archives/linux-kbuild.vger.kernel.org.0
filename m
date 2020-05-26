Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751FD1E1FA5
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2020 12:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbgEZK3i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 May 2020 06:29:38 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61556 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731745AbgEZK3i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 06:29:38 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 04QAT8UK010919;
        Tue, 26 May 2020 19:29:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 04QAT8UK010919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590488949;
        bh=TgsarORKpFM4KluKtI1I3e2MGsvi+5T5qfa8PyqrwgE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2VmZVc21WtkEURw7YqCRKsS+aQ5wP/290gQaEBUyZvRL9whhJGcyBZFikvZI/1q+b
         RmyST7Mte4L/CSawQMEoyr1vz3leUNegbTTM9TAkx4pHKzAotsNwNL9QIkaB7+1QZe
         I0RUFfhy3z6AjQLzRr7+MaOxDKE07jU9FORkCHKVezOrRZtIskdxwavBTzI8RMPmGT
         MWU7kOfUYERLjlvJ71Axvo8ApRAE9HvHBcM8MkWwop/M0chr3kV7i21Hd4hiMCOB7j
         nYvoEgJllb8ubyTpJ/LQrar7hZZElxjkRC92CUEpoWYSnxMSrvhvqtHcYy6p7tUBE8
         zTUd2Th6rDLtQ==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id g7so7019688uap.7;
        Tue, 26 May 2020 03:29:08 -0700 (PDT)
X-Gm-Message-State: AOAM533wHw38IUcbqIhKbeQJnfO3fOLwcPS46bNAmeyLDFZ+aRxxYUum
        AUzMnzYDNMagYQRCoPw2y97fGOm1Q0aNb4VeAJQ=
X-Google-Smtp-Source: ABdhPJwVJOrNGzx/JrucBQ3KP/bPBRzCqbJTBbROp2kKQKvfPkp9E6fyAk3gFfqiKFeErZdIny3cGBFx85HGbu0xsCs=
X-Received: by 2002:ab0:3f5:: with SMTP id 108mr214487uau.25.1590488947823;
 Tue, 26 May 2020 03:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200521043117.242585-1-masahiroy@kernel.org>
In-Reply-To: <20200521043117.242585-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 May 2020 19:28:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6p5kj5BWvF8M+7LFyOM0dxUe1w9DL5SzY65ZNraWutQ@mail.gmail.com>
Message-ID: <CAK7LNAT6p5kj5BWvF8M+7LFyOM0dxUe1w9DL5SzY65ZNraWutQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: doc: remove documentation about copying
 Module.symvers around
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jessica Yu <jeyu@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 21, 2020 at 1:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is a left-over of commit 39808e451fdf ("kbuild: do not read
> $(KBUILD_EXTMOD)/Module.symvers").
>
> Kbuild no longer supports this way.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Applied to linux-kbuild.



>  Documentation/kbuild/modules.rst | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index e0b45a257f21..a45cccff467d 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -528,18 +528,6 @@ build.
>                 will then do the expected and compile both modules with
>                 full knowledge of symbols from either module.
>
> -       Use an extra Module.symvers file
> -               When an external module is built, a Module.symvers file
> -               is generated containing all exported symbols which are
> -               not defined in the kernel. To get access to symbols
> -               from bar.ko, copy the Module.symvers file from the
> -               compilation of bar.ko to the directory where foo.ko is
> -               built. During the module build, kbuild will read the
> -               Module.symvers file in the directory of the external
> -               module, and when the build is finished, a new
> -               Module.symvers file is created containing the sum of
> -               all symbols defined and not part of the kernel.
> -
>         Use "make" variable KBUILD_EXTRA_SYMBOLS
>                 If it is impractical to add a top-level kbuild file,
>                 you can assign a space separated list
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
