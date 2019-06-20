Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9131F4D265
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Jun 2019 17:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbfFTPqg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Jun 2019 11:46:36 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:37742 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfFTPqg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jun 2019 11:46:36 -0400
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x5KFk5jJ029576;
        Fri, 21 Jun 2019 00:46:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x5KFk5jJ029576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561045566;
        bh=9i03caR2ECEq/q+aW869XY+C+VxbqwsnsWklWv7B9eo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1x6JgFvrFwRMDNMIdloEL1OqqdCZS0776tvyreeTG1e6g9KehasjfbXl4tEcaaro9
         9ZiOpVfsBb/9JafQTLMTm+avbhqUWDRY9CJSHHvEgBFXD+gR9MTS1H+DA93mceIEGU
         a1ZJ70Up8y3+7+BPKLiHJFX++M2QRp0vSelz97/XTWmFAdEZ7RdxqOrKcGZD17/2s2
         1YCPEMLBOod3erep0LIW5WYXFYQRfgOqHV7Elh2j7Rh0Myl2HqecuNU4Y+iToj2Kd/
         BuOyKpTsHupFLIXe78Gd0NRbOEQyxWxBRYFiQVVXW3B6XXHOqwin9kcvK0KTHwUVGH
         62kbyVfoemB4w==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id k1so666380vkb.2;
        Thu, 20 Jun 2019 08:46:06 -0700 (PDT)
X-Gm-Message-State: APjAAAX0kjmf9eV0giGwxN4NazSI8ty9XD5ShoZeQG6uXTshIZbIcBCv
        10bB+4a/ZAd3wNCrvzVvXn8/wE5Lts9SnyIJrZc=
X-Google-Smtp-Source: APXvYqyp1S2LP2eYsGfXBtTBzMi1H805FURj8jPyinxB7XMBDVa3H8a/TkxCh192R+l3WO5nO6TBP6dtRro99IRiNK8=
X-Received: by 2002:a1f:6347:: with SMTP id x68mr7258691vkb.64.1561045565131;
 Thu, 20 Jun 2019 08:46:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190614165242.79257-1-natechancellor@gmail.com>
In-Reply-To: <20190614165242.79257-1-natechancellor@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 21 Jun 2019 00:45:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNASn9wDnhbP=FAg8tvXyXSQTUqQu_JY-+HqCds5c8Tor8g@mail.gmail.com>
Message-ID: <CAK7LNASn9wDnhbP=FAg8tvXyXSQTUqQu_JY-+HqCds5c8Tor8g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wuninitialized
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 15, 2019 at 1:53 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This helps fine very dodgy behavior through both -Wuninitialized
> (warning that a variable is always uninitialized) and
> -Wsometimes-uninitialized (warning that a variable is sometimes
> uninitialized, like GCC's -Wmaybe-uninitialized). These warnings
> catch things that GCC doesn't such as:
>
> https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
>
> We very much want to catch these so turn this warning on so that CI is
> aware of it.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/381
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Applied to linux-kbuild.
Thanks!


-- 
Best Regards
Masahiro Yamada
