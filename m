Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE00878DBA
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 16:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfG2OXm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 10:23:42 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33942 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfG2OXl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 10:23:41 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so22129769pgc.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2019 07:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:subject:cc:user-agent:date;
        bh=kqUnPKiz6VvTqc0+3BE84kZ35KLnOhXxMY+yopDUPhY=;
        b=k86W0aohKTIyLzBKu/wc2N16ENz7QVuJCm9eOV3rf+vXz48wbkR6TSL3KnMNu+Qg9u
         QwKbRBGZVkYTYR7rmUEX9cVlei8WTfWGVGQeVr42nqCKd7VzgcrsSLCm88DonZsNdxaY
         e9jZiEiFJMVjy054rF8KvLZqdz94yA3Q0rK/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:subject:cc
         :user-agent:date;
        bh=kqUnPKiz6VvTqc0+3BE84kZ35KLnOhXxMY+yopDUPhY=;
        b=n/vR0+Jz1tD8NoMosTcAdpC/0UnCFttlCIDFcSIvB5iVh8FYp2TuFeB72GlxADP1xf
         Duz75FKdgAaWJTr/plMfUtKltVnwUoGi/rxSrxcZnvw9wPuzQvva1zMQ7iVvX4HF3+I/
         byhsGF4duJlUQ3wTU5M3oeihdvad0TQBfPwF/rmVGVjbs20DUuZwehLAn2NzUtk3COeP
         sPEBNWV3ryDKNGGMcsonPmlWJ8ugVSXl6EGnmv+WDdvnw1sXv/abqCJUC5KBGso7IMuK
         FyqzOOLSZG7BurWjCk/uE4GLodYFvRLZATzmIgolmDffe+BZZyIfCUqcVUkW70XzXlRM
         Ad5g==
X-Gm-Message-State: APjAAAWuzzEoApdg1KNApHlnrYzlHs0dgwPP+JXifLlbkVkZlIZGuXcD
        gQIQplgYKkpxme6N1xtwiME0dA==
X-Google-Smtp-Source: APXvYqw/PF2vE+zBYn0D8DUzj3HuB5GsG03DneqIHvSfRszws4YVVcUlAfy/9QpCj7nC6Zl53Whsmw==
X-Received: by 2002:a63:5c07:: with SMTP id q7mr52206048pgb.436.1564410221179;
        Mon, 29 Jul 2019 07:23:41 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y14sm11289667pge.7.2019.07.29.07.23.40
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 07:23:40 -0700 (PDT)
Message-ID: <5d3f016c.1c69fb81.b4775.c7d0@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
References: <20190725154730.80169-1-swboyd@chromium.org> <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] kbuild: Check for unknown options with cc-option usage in Kconfig and clang
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Smith <peter.smith@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
User-Agent: alot/0.8.1
Date:   Mon, 29 Jul 2019 07:23:39 -0700
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Quoting Masahiro Yamada (2019-07-29 03:02:40)
>=20
> Thanks for catching this.
>=20
> I wonder if we could fix this issue
> by one-liner, like this:
>=20
>=20
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 8a5c4d645eb1..4bbf4fc163a2 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -25,7 +25,7 @@ failure =3D $(if-success,$(1),n,y)
>=20
>  # $(cc-option,<flag>)
>  # Return y if the compiler supports <flag>, n otherwise
> -cc-option =3D $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/nul=
l)
> +cc-option =3D $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c
> /dev/null -o /dev/null)
>=20
>  # $(ld-option,<flag>)
>  # Return y if the linker supports <flag>, n otherwise
>=20
>=20
>=20
> This propagates not only -Werror=3Dunknown-warning-option
> but also other clang flags to Kconfig.
>=20
>=20
> Currently, we do not pass the target triplet to Kconfig.
> This means, cc-option in Kconfig evaluates the given flags
> against host-arch instead of target-arch.
> The compiler flags are mostly independent of the architecture,
> and this is not a big deal, I think.
> But, maybe, would it make more sense to pass the other
> basic clang flags as well?
>=20

Yes that also works and I had that earlier. I wanted to mirror what was
done in scripts/Kbuild.include where there's a CC_OPTION_CFLAGS
variable. I'm happy either way, so it's up to you.

