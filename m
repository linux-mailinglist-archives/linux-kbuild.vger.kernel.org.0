Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530561F071C
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2020 16:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728770AbgFFOoK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jun 2020 10:44:10 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:17257 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbgFFOoK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jun 2020 10:44:10 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 056Ehlgo016107;
        Sat, 6 Jun 2020 23:43:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 056Ehlgo016107
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591454628;
        bh=tjJf9yrzYB6UwD08OE5+OR5eSSMZmjyIOBpMcr//QGs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XdFCzxLJAslsQWU56itcSH1zKDbWp9ff4kDDB3fvjOQ819Iwf0gSg0V7h4ewqaoxE
         +Uc5qixP6UwBWGCoszF7KflJ2D0UOmPiZ6lWwKnOrCtBwdd566Z9g3a3a4VonBYKPd
         UhafJeNa3cJePf6XfVF1vl76zEgnZ8xxxndENJ5Xa3GGPnbaLMEeWZSCk9N3sPQZMH
         IHgFQSZuy8yJGWoLcGvROhr8XeQo1BoDYtOsmupGH+WD+r3J4M90/f+bPnC7dJfHbO
         myC55bb++rPDG+rtOAb5nc1Y3EkAc+8dtWaNy/3Tx+/DpqdcKLSw7nG0rvCvT/3R/Y
         3WygLVcNF1ulw==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id k13so7267798vsm.13;
        Sat, 06 Jun 2020 07:43:48 -0700 (PDT)
X-Gm-Message-State: AOAM531Iac1wPR9bYCQi8ci9JWCcydQTJ2iNGabPxQASWDGn0paivAk9
        QAzKk1upuC49fzBwa3AK+2MiZhPCBxA//waKlvg=
X-Google-Smtp-Source: ABdhPJze68VJW1GjAz6C7aMA4c3Yup2JuYfY+OwIzZcDBKZhh9WKEFkXfNY/v+kHw+DNFLcjNwhDt+DWkQbWCm6WhlE=
X-Received: by 2002:a67:22c7:: with SMTP id i190mr10578583vsi.179.1591454627220;
 Sat, 06 Jun 2020 07:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com> <20200605073955.6384-1-efremov@linux.com>
In-Reply-To: <20200605073955.6384-1-efremov@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Jun 2020 23:43:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqJpM1m38o_5Ft1HV_sriDTBNE27JgxJfmbv2PM9EjQA@mail.gmail.com>
Message-ID: <CAK7LNARqJpM1m38o_5Ft1HV_sriDTBNE27JgxJfmbv2PM9EjQA@mail.gmail.com>
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
To:     Denis Efremov <efremov@linux.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 5, 2020 at 4:40 PM Denis Efremov <efremov@linux.com> wrote:
>
> Allow user to use alternative implementations of compression tools,
> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
> speed up the build:
> $ make GZIP=pigz BZIP2=pbzip2
>
> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
> since 2015. However, alternative implementations (e.g., pigz) still rely
> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>
> The credit goes to @grsecurity.
>
> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT="--threads=0"
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
> Changes in v2:
>   - _GZIP used instead of GZIP
>   - tar commands altered to use tools from the vars
> Changes in v3:
>   - _BZIP2 used instead of BZIP2
>   - _LZOP used instead of LZOP
> Changes in v4:
>   - Unexports removed from Kbuild.include
>   - MAKEOVERRIDES used in top Makefile
>   - All variables checks removed from scripts
> Changes in v5:
>   - Conflict with removed LASAT resolved


Replaced. Thanks.



-- 
Best Regards
Masahiro Yamada
