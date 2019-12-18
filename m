Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 255BE124943
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Dec 2019 15:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfLRORQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Dec 2019 09:17:16 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17557 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfLRORQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 09:17:16 -0500
X-Greylist: delayed 95084 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Dec 2019 09:17:15 EST
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id xBIEGjfI021877;
        Wed, 18 Dec 2019 23:16:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com xBIEGjfI021877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576678606;
        bh=qmHvB4juxMPU3zIuVI2Brd26weLsZ6/2g5Iqv2+p7W0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PlMB2e7Pe4segIaQQANKREfkxM4abkGhBdOT9ubs8R2TAUALxN2Dd2c2kWGllC8YU
         MJs6+wUTYcQGGc3suk0E1jrf+uEoDLbiHLN26mW9SHtAL0/KMSXvdvfZw6bFChsfLk
         dFgvfGp9lOhvuZ/BmmZWAKENRX/qh0+Id4EHKXCppJoQ4hbYpKEpa3slfLdnqTigpI
         aUtLAx0BmzGvMpn6gIPLPKfjibEq0xDmEa/PjWSLDmXEeCEQci7jci/YGBk/mZEso7
         vCajyN8Ij6WBMF9HFdKZo6DxG9ADiG5y5mT09r8F/Jb6T9YITyTsJQmQuXU9yqio/+
         s6WyCTNcrK4Ew==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id u14so1474134vsu.3;
        Wed, 18 Dec 2019 06:16:45 -0800 (PST)
X-Gm-Message-State: APjAAAWBwFtBwiez2OLd2S7Xb6D3g+UfTejFCa2xjHrV8d+u22ekKQEk
        sCrXLIs8hWepwZcQBmxh6Nj7+gCq6XBjMaHwakE=
X-Google-Smtp-Source: APXvYqxMRyzTjfqlEpXcNMIZydJI68nPt3I8yfvImlkDJE7pX8UDC+Xba8CQeMVSUXXDVjStScD7bmst/DsXb6G7tx8=
X-Received: by 2002:a05:6102:3102:: with SMTP id e2mr1515570vsh.179.1576678604346;
 Wed, 18 Dec 2019 06:16:44 -0800 (PST)
MIME-Version: 1.0
References: <20191217115151.12465-1-masahiroy@kernel.org>
In-Reply-To: <20191217115151.12465-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Dec 2019 23:16:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQj3Hsv7Nbd3qVj-ie2z+DsPmBseh4tS9hfk+6mg4PpYw@mail.gmail.com>
Message-ID: <CAK7LNAQj3Hsv7Nbd3qVj-ie2z+DsPmBseh4tS9hfk+6mg4PpYw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove ---help--- from documentation
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Ulf Magnusson <ulfalizer@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 17, 2019 at 8:52 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 84af7a6194e4 ("checkpatch: kconfig: prefer 'help' over
> '---help---'"), scripts/checkpatch.pl warns the use of ---help---.
>
> This still exists, but new code should avoid using it.
> Let's stop advertising it in documentation.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.

>
>  Documentation/kbuild/kconfig-language.rst | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 74bef19f69f0..231e6a64957f 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -196,14 +196,11 @@ applicable everywhere (see syntax).
>    or equal to the first symbol and smaller than or equal to the second
>    symbol.
>
> -- help text: "help" or "---help---"
> +- help text: "help"
>
>    This defines a help text. The end of the help text is determined by
>    the indentation level, this means it ends at the first line which has
>    a smaller indentation than the first line of the help text.
> -  "---help---" and "help" do not differ in behaviour, "---help---" is
> -  used to help visually separate configuration logic from help within
> -  the file as an aid to developers.
>
>  - misc options: "option" <symbol>[=<value>]
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
