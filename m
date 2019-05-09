Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D87F18AC7
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 15:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfEINe2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 09:34:28 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:48506 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726087AbfEINe2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 09:34:28 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x49DY1R8004660;
        Thu, 9 May 2019 22:34:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x49DY1R8004660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557408841;
        bh=p1/kF2GRRHb9jLz8W1w8YVgWkE62qa9K21kt7paiW0E=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XXaYn4b2/sVk9r9wHkG4nxC78dUpWOZY3JKDzAA6UabBudeEfVJOiUWe0vEO3xfAj
         QJEnbWfOnwtP8nwXphDEPqrvGen74aVk9xBc2RDyiItpeMEGG+uaFfy+lOrOClIRIa
         DtbaQf0/bs1BWInGwt5CSa26sKDuf9niPirqTFTkbwT8MxXatn3O2iuuB90ex40+Tz
         9ZnhQ5Teshxfu98R5IMqXLUdUE3JOTxOJmZlr/sIbq6sKtwP4UD9ao6tB5h2tCBc+I
         MYFZG8Fx8oM99Bn/TOOB8+HAVsAPcT62LKev0vCnMqtQLNuqmrG+VKHLfOpd2ERpWM
         g63CiRPLI9c9w==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id s30so787871uas.8;
        Thu, 09 May 2019 06:34:01 -0700 (PDT)
X-Gm-Message-State: APjAAAWI+s19rm75nw+sU3IaiGM2qGNSRnlFp60+KYZazQJNohlRwVm0
        mJQHTE01giZIhSEWZNOMnwuh5AxQhg20OsmO9dM=
X-Google-Smtp-Source: APXvYqxPJYBTOfHdTFoE3UqrX6S/TkwHbWFdK4raf5Y3eHYmPF3bdZwcOUZLBXdO1rdRQQek1br7uryrLlJL3Z8CwP8=
X-Received: by 2002:ab0:20c1:: with SMTP id z1mr1695951ual.109.1557408840366;
 Thu, 09 May 2019 06:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
 <20190509114824.25866-1-natechancellor@gmail.com>
In-Reply-To: <20190509114824.25866-1-natechancellor@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 9 May 2019 22:33:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNARBH7tpZLJCC4EGvLDGCCt0_425p4nSE5+fimakP5o3NA@mail.gmail.com>
Message-ID: <CAK7LNARBH7tpZLJCC4EGvLDGCCt0_425p4nSE5+fimakP5o3NA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Don't try to add '-fcatch-undefined-behavior' flag
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 8:49 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This is no longer a valid option in clang, it was removed in 3.5, which
> we don't support.
>
> https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4
>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> Let me know if you want this incremental to your patch.

No problem. I will rebase mine on top of this.

> I figured it
> made more sense to remove this then do the cc-option/cc-disable-warning
> removal because it will simplify the commit message.

Yes, I agree!


Thanks.

-- 
Best Regards
Masahiro Yamada
