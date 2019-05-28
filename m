Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D14062BC7A
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2019 02:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfE1Afq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 May 2019 20:35:46 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:46349 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfE1Afp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 20:35:45 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4S0ZMSm021349;
        Tue, 28 May 2019 09:35:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4S0ZMSm021349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559003723;
        bh=ZrnfQGP3U7n4WOAOji/GRy+OIeHaMp/+iXRai5SU7wQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ixSWdT8ppBAChw6vM/HosZZcEyU8b/NAGH5YZO7j/vhhIRJnxnQkpg7HAWR2B1ojN
         bkFytrQtIBPkdxCEH1GQ3F9F9VA/J6TCuiAoPln6jWRA7hhoBiFikMDjwp5RHJh7Q5
         AioOyO9CDKG3fLqhJmRo1GlTtWOzGQsfjQyld1ZF/zxTcUACfruBWI/LuKQ67r/2fF
         +l9lpO/7HSGwi8tVUQuVyWZ2crudqRhKCEWmrFIcgAolgWuQEV8VV+P4vwbJbqc0qo
         A/6gXdCe1hbcPqLudyyUoVV8W/fpNoXD/XsBdNdUWSgVgibQNmaMr+bIvW/fcv/+Z1
         6zscD3UI3egwA==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id e9so7141612uar.9;
        Mon, 27 May 2019 17:35:23 -0700 (PDT)
X-Gm-Message-State: APjAAAWkQ+KK2f/gMTzZxKzxMDGebzf+4BaG+YdbPsbS+ZZy6xI697nK
        Oa2oJbELUin43e15ORUsD69QUnN11gBAnKj9DYY=
X-Google-Smtp-Source: APXvYqy8LV8t35Sn6WgYDnkjgZXIO1Pit+u3Tt/SpuNlp6FdfPNgoFxm+nPXEG1meBCQnWztRia8dlXY40a9Z+X0P4g=
X-Received: by 2002:a9f:366b:: with SMTP id s40mr23027906uad.121.1559003722296;
 Mon, 27 May 2019 17:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190525114919.26188-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190525114919.26188-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 28 May 2019 09:34:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNATQCpNp4azKE4YJDpC-gSTRBYe6Lj7dTX+1N=7iqKsMXw@mail.gmail.com>
Message-ID: <CAK7LNATQCpNp4azKE4YJDpC-gSTRBYe6Lj7dTX+1N=7iqKsMXw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: tests: fix recursive inclusion unit test
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 25, 2019 at 8:49 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Adding SPDX license identifier is pretty safe; however, here is one
> exception.
>
> Since commit ec8f24b7faaf ("treewide: Add SPDX license identifier -
> Makefile/Kconfig"), "make testconfig" would not pass.
>
> When Kconfig detects a circular file inclusion, it displays error
> messages with a file name and a line number prefixed to each line.
>
> The unit test checks if Kconfig emits the error messages correctly
> (this also checks the line number correctness).
>
> Now that the test input has the SPDX license identifier at the very top,
> the line numbers in the expected stderr should be incremented by 1.
>
> Fixes: ec8f24b7faaf ("treewide: Add SPDX license identifier - Makefile/Kconfig")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild/fixes.


>
>  scripts/kconfig/tests/err_recursive_inc/expected_stderr | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/tests/err_recursive_inc/expected_stderr b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
> index 6b582eee2176..b070a31fdfeb 100644
> --- a/scripts/kconfig/tests/err_recursive_inc/expected_stderr
> +++ b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
> @@ -1,6 +1,6 @@
>  Recursive inclusion detected.
>  Inclusion path:
>    current file : Kconfig.inc1
> -  included from: Kconfig.inc3:1
> -  included from: Kconfig.inc2:3
> -  included from: Kconfig.inc1:4
> +  included from: Kconfig.inc3:2
> +  included from: Kconfig.inc2:4
> +  included from: Kconfig.inc1:5
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
