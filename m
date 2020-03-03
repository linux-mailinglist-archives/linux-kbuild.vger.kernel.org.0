Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679D31777B7
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2020 14:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbgCCNsU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 08:48:20 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17398 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgCCNsU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 08:48:20 -0500
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 023DmF3Q024927;
        Tue, 3 Mar 2020 22:48:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 023DmF3Q024927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583243296;
        bh=xTxEoE0DqYqg792ecc95uiMjXvkkzaqownbqCwALg+w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=265LoLA2SezrWcr3PUYz0KDYjQC6dNQeOp7xBBiptKIlo5DGo4nO+4R1fveYDvrXH
         duXNhB4ay7CGmgVufSJD1tyoHnKyyNlsLHeXl50HoAn+Isj5a/GkF8+ntrY1i4XKoM
         2q72e0yvnC+mvWK5NXvIcd0e2jhgmhlhVFdMMi4uw7fQ4M0lryJy15opX6w+1xejjQ
         OHS5ssayNNQux9RBsnnzozutuOh7df1pI+ZIV0BvglOL2NX/Sso3sJr63AjKOWbKzF
         YbR7PQ66efTqSdj37cYQ7R/zx4n+zmY1l5c+IB6dldQLVCE8bukGQ6rFuJMnY82y4J
         NokNQV+gqaVWQ==
X-Nifty-SrcIP: [209.85.221.174]
Received: by mail-vk1-f174.google.com with SMTP id x62so868675vkg.11;
        Tue, 03 Mar 2020 05:48:16 -0800 (PST)
X-Gm-Message-State: ANhLgQ3CZgbM2DJBEc3/pkMoVoIsAUWEjVIAN+pQg4V2KEtT+LIKUSgH
        iL2YkozVM2Bx4MBuUwStMd58acHoop4kHYoSdVo=
X-Google-Smtp-Source: ADFU+vtXBk0momfM4duMHdkHroEOqDdFo7/vIJTOegKIurOSydDddzPRY//2dkZbcFzZmOWMb4KFV2ITAFYULGGJFGw=
X-Received: by 2002:a1f:b401:: with SMTP id d1mr2769067vkf.26.1583243294990;
 Tue, 03 Mar 2020 05:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20200226175325.8787-1-masahiroy@kernel.org>
In-Reply-To: <20200226175325.8787-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 3 Mar 2020 22:47:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVX6bJPO0yPo7k_ateDNmk_bXGfoR8nmkEUbkCVtJTLw@mail.gmail.com>
Message-ID: <CAK7LNARVX6bJPO0yPo7k_ateDNmk_bXGfoR8nmkEUbkCVtJTLw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove trailing slash from devicetree/binding/
 for descending
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 27, 2020 at 2:53 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> obj-* needs a trailing slash for a directory, but subdir-* does not
> because it already implies a directory.
>
> Also, change subdir-y to subdir- to ensure this is effective only
> for cleaning targets.
>
> This makes the cleaning log consistent. (no trailing slash)
>
> Before:
>
>   $ make clean
>   CLEAN   Documentation/devicetree/bindings/
>
> After:
>
>   $ make clean
>   CLEAN   Documentation/devicetree/bindings
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.



>
>  Documentation/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index d77bb607aea4..39569a2e1953 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -2,7 +2,8 @@
>  # Makefile for Sphinx documentation
>  #
>
> -subdir-y := devicetree/bindings/
> +# for cleaning
> +subdir- := devicetree/bindings
>
>  # Check for broken documentation file references
>  ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
