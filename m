Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98C3718647
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 09:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfEIHlP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 03:41:15 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56261 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfEIHlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:41:15 -0400
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x497f2Vm021745
        for <linux-kbuild@vger.kernel.org>; Thu, 9 May 2019 16:41:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x497f2Vm021745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557387663;
        bh=hi4FDtBaCYI3a3PQRCp4FTA1I639YkOtbdbEmzVpHXw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=llmg0PRJHfsOSUHoJelB5C9d1vIW3DYIlDDJdXqDCBc46iV5JbijYzKV1B1ihH5fh
         IvhlykpI2Et5y79Os8p1UbglnZpIGzPAS6Rzx16+g63+h2+MSv1tAvUYmGDLsnPUJn
         kxKop0kO+v16UbTewqdFDNMuXhLK0c1RqpUYe3odCwUmNPv86znRmz1L4ty1ZW0a/T
         gwv0hGuYlGHAKHCU53miWY1X0Rto2gkzAsCmwZnqwJbRVT7R6yykbK9bNXtq48Jp51
         VBi04EC5V/z8sj3rKG0AmfYK5EQ3dj3u9LGr7tfjDhazyMN+2/u3jQa4j5OjEWmaZq
         oeiiUUe51zdTg==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id h127so346552vkd.12
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 00:41:02 -0700 (PDT)
X-Gm-Message-State: APjAAAUz5a1k0/AL3ZG2a5ECEca0gW+REwBmc13USrBlJ4Jd6ZnB74a6
        1a97GQTVglfSQh7BT/GdyqSeMWB+YPLp0UQVIVI=
X-Google-Smtp-Source: APXvYqyOJ9LlOXckc2YAzU4ei88xRT4AH/5UYgTJXLYHQlA1Ojn9FxI9nna8M6u6XZJJmdEClwZ+y9878brD7XWYtuk=
X-Received: by 2002:a1f:8581:: with SMTP id h123mr843919vkd.64.1557387661810;
 Thu, 09 May 2019 00:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XemTPvV9KTuMDXew3vxzOw=A2Cj-ToVpe=ZSjrrYC-XRQ@mail.gmail.com>
In-Reply-To: <CACPK8XemTPvV9KTuMDXew3vxzOw=A2Cj-ToVpe=ZSjrrYC-XRQ@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 9 May 2019 16:40:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASWoyCeAJg-b7vL4qMDKq-x6RdT5_sBcmtHKknNjuCJrQ@mail.gmail.com>
Message-ID: <CAK7LNASWoyCeAJg-b7vL4qMDKq-x6RdT5_sBcmtHKknNjuCJrQ@mail.gmail.com>
Subject: Re: Error message when compiler not present
To:     Joel Stanley <joel@jms.id.au>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Christophe LEROY <christophe.leroy@c-s.fr>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Joel,

On Tue, May 7, 2019 at 2:56 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello,
>
> The other day I was attempting a kernel build and stumbled across this:
>
> $ CROSS_COMPILE=foo make
> /bin/sh: 1: foogcc: not found
> make: foogcc: Command not found
> /bin/sh: 1: foogcc: not found
> /bin/sh: 1: foogcc: not found
> scripts/kconfig/conf  --syncconfig Kconfig
> ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
> ./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
> init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
> /bin/sh: 1: foogcc: not found
> make: foogcc: Command not found
> Compiler lacks asm-goto support.
> make: *** [arch/x86/Makefile:302: checkbin] Error 1
>
> I had something more sensible for CROSS_COMPILE, but the point is it
> did not exist in my $PATH.
>
> I tried the patch below but there's still something calling the
> $(CROSS_COMPILE)gcc before gcc-version:
>
> $ CROSS_COMPILE=foo  make
> /bin/sh: 1: foogcc: not found
> make: foogcc: Command not found
> Compiler lacks asm-goto support.
>
> This isn't a big deal but if there's a simple fix it would be nice to clean up.

Yeah, I had noticed this, and it is somewhat ugly.

Instead of fixing every script,
I want to terminate Kconfig in the very beginning of the parse stage.

https://patchwork.kernel.org/patch/10936811/


I still see some "/bin/sh: 1: foogcc: not found" in the build stage,
but not fixing up every $(shell ...) calls
since displaying some warnings is not a big deal.

Thanks.

>
> Cheers,
>
> Joel
>
> --- a/scripts/gcc-version.sh
> +++ b/scripts/gcc-version.sh
> @@ -8,6 +8,11 @@
>
>  compiler="$*"
>
> +if [ -x "command -v ${#compiler}" ]; then
> +       echo "Error: Compiler not found." >&2
> +       exit 1
> +fi
> +
>  if [ ${#compiler} -eq 0 ]; then
>         echo "Error: No compiler specified." >&2
>         printf "Usage:\n\t$0 <gcc-command>\n" >&2



-- 
Best Regards
Masahiro Yamada
