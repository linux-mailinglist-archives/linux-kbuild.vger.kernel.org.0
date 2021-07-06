Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94273BC45D
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jul 2021 02:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhGFA3U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 5 Jul 2021 20:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhGFA3U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Jul 2021 20:29:20 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BC7C061574;
        Mon,  5 Jul 2021 17:26:42 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id q2so7593285iot.11;
        Mon, 05 Jul 2021 17:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2U66haJLHnOXFpbcQWuhOnvZbLMHBCG56bTZcH/pO4M=;
        b=XWpO6m3QVh//UmnQcKt9RK+Czog2c4HYAOIaQKWnOyUCs4Ya/o/jH5/OyMiowhyegY
         ALj9kjH06GRTIcr5V6Q5VwD4Vje/Lg18O2MeHrCs6fCCUDq92coUESEFoHxCP157dewD
         Ww3XP64NTOixcD5KG1mS4PofVL5i4m+JSWEFsy1Gzl6jWDD88TWQ2Ip6uX2WMzr+jJwC
         Gtrj7qa7GqwpeSBNn1YsGaQjbPKk6P7OPG1HgSa7cor080SvsVoNKBcUBWwCgp1LCfMK
         ZlmhR3oxbKla06W9rFPow3012CYAC8/FjoRw/XVXDS30T6TfWOePmoktFXW3YU7No4ft
         aTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2U66haJLHnOXFpbcQWuhOnvZbLMHBCG56bTZcH/pO4M=;
        b=W1lMKKq+NQi5l/1MAHTl7xJwc0uebmTEmc87yI84ecSA6bR9ffUlxv0BXcdRpRfbC6
         CCdluschKxuXNUjIkOGaZbOvh8w+96EA9V9F4a5w9OvJMUN8nLqyu5+AsLtJnZBRx3C7
         9hkKVfGb3IXDq0WsoVt5OYqPwPSLpuwRP2bDAUK7jrK6azbHKj+tjWIqFMH5o1Zdr2Mm
         9APCrugqX0syP3FcogkDss1pPM/0OvF+eqWws85wWUAkfPhL5CV+8JLeuStQlmtRVhoi
         vpvNbRwXJQAS1r511pfVFLtDwC8BodIlX80Uh0qKWWJ3S/khTRW2Le2Gn7mmlKrl9Fsg
         ARKg==
X-Gm-Message-State: AOAM5317k51bBHrV/s7quM7VRwFin3v1YqNtZvn+HTM5axpyhsvxmOd4
        k5iuCwnbC7Mz49qJgZFDbI8CrYFJV9BfclwrHwk=
X-Google-Smtp-Source: ABdhPJxq1oePCiG6oC1Wqd2pwcEGh9az4DC/Q01VSGknsLvwOxW7hkBVl4ZjJM0/RpzZ8FpHesan+dVls74ad9fDxlk=
X-Received: by 2002:a05:6638:248d:: with SMTP id x13mr14685750jat.78.1625531201944;
 Mon, 05 Jul 2021 17:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-17-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-17-ojeda@kernel.org>
From:   Pedro Tammela <pctammela@gmail.com>
Date:   Mon, 5 Jul 2021 21:26:30 -0300
Message-ID: <CAKY_9u1WN1nK3fdS0WDVgc4umYrCMVxODn3wG0rtctJzgNE5Ag@mail.gmail.com>
Subject: Re: [PATCH 16/17] MAINTAINERS: Rust
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> ---
>  MAINTAINERS | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0cce91cd562..a439204d9be 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15894,6 +15894,20 @@ L:     linux-rdma@vger.kernel.org
>  S:     Maintained
>  F:     drivers/infiniband/ulp/rtrs/
>
> +RUST
> +M:     Miguel Ojeda <ojeda@kernel.org>
> +M:     Alex Gaynor <alex.gaynor@gmail.com>
> +M:     Wedson Almeida Filho <wedsonaf@google.com>
> +L:     rust-for-linux@vger.kernel.org
> +S:     Supported
> +W:     https://github.com/Rust-for-Linux/linux
> +B:     https://github.com/Rust-for-Linux/linux/issues
> +T:     git https://github.com/Rust-for-Linux/linux.git rust-next
> +F:     rust/
> +F:     samples/rust/
> +F:     Documentation/rust/
> +K:     \b(?i:rust)\b
> +

Does this mean that development will be done exclusively on GitHub?
If affirmative, is there a bot that will replicate the messages in the
mailing list?

>  RXRPC SOCKETS (AF_RXRPC)
>  M:     David Howells <dhowells@redhat.com>
>  M:     Marc Dionne <marc.dionne@auristor.com>
> --
> 2.32.0
>
