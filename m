Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDFCF176FAC
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2020 07:55:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgCCGzR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Mar 2020 01:55:17 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:44948 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgCCGzQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 01:55:16 -0500
Received: by mail-qv1-f68.google.com with SMTP id b13so1183933qvt.11;
        Mon, 02 Mar 2020 22:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EJd0EY7gw7xGakEhmNzQdOydvEieyJ9F8aucq7jAODI=;
        b=GGrwq7SwLj1k2UViEIH4Y8/FIJCm+oVdSjmeIq0uqyUYByVTtZUIszyULm1jS1vX1c
         wP572fU6T0qYVC+IJ2F6gmN+DmpsfV0+xwni6SbbYiIF+qN9yyif3yfLYU13JpnwYHy/
         J+RITiRm8xbYAf0MZVDdD/l8QsUKWxyg6r7y1pD8mxoBcqoZkX2bWfMm5dMiUHKddemz
         /V2rHm1DwnnvpdeSIE8o2Cr5s1x++HR3TpO4mbu6B48baeAEc9Jhmr8ZAZDyJMfCUB8m
         d2yaTLXwcb32wpyRorg+ILRv7QxXHqujpe9Gr3niWE9rLXWmS9pu0P7qNMY0bpxv9J3C
         4MqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EJd0EY7gw7xGakEhmNzQdOydvEieyJ9F8aucq7jAODI=;
        b=PcZ8WfAEGav9g5kLoBXj7IGpvMclZI+4kX+c+pLapHBe1cmXAimehATmMbfgn/Yk7G
         p3/82zI5YNfxjPOuQ9m8rcZ+RjQLrRLzmhn9H6dBz8DhnwmCVMPArdh7V9qHi44cGdAw
         4txvAaQ81vJKvdGdvNwgI/Lo/7XrPA5fQAeHVpOuvk2WXzEMAK7OXvOvWo4gy33RbzIW
         f5/TlTCgEdGtlqSqzWdbmm+xbbSGRK+4na0GYMfinEFbLDCwOua6FzEq9VP1t8i63/0g
         39dnmqsQKet69/1qrx6pae1wNgkBRJS7lHMHY73575PCrzOB3r3HWXBxXyTqSFxH0jPs
         1Ibw==
X-Gm-Message-State: ANhLgQ2oFMJZGX33S5lIg6mbnWAjApmXBsoMoIo5MWktJFBHQPgRX24E
        zYbt99fPktupFRLQabHKcqzRZPOVC4PDBSPt4wM=
X-Google-Smtp-Source: ADFU+vvvjY8YdGf5kqvCLCo+zLETN8GTZWFpfSenHeWj/U2VtSGzzVY03HrA+JshFRI+r5FEsgQHlkzNymbA+aIFPno=
X-Received: by 2002:a05:6214:8cb:: with SMTP id da11mr2684383qvb.228.1583218515450;
 Mon, 02 Mar 2020 22:55:15 -0800 (PST)
MIME-Version: 1.0
References: <202002242114.CBED7F1@keescook>
In-Reply-To: <202002242114.CBED7F1@keescook>
From:   Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date:   Mon, 2 Mar 2020 22:55:04 -0800
Message-ID: <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
>
> When CONFIG_DEBUG_INFO is enabled, the two kallsyms linking steps spend
> time collecting and writing the dwarf sections to the temporary output
> files. kallsyms does not need this information, and leaving it off
> halves their linking time. This is especially noticeable without
> CONFIG_DEBUG_INFO_REDUCED. The BTF linking stage, however, does still
> need those details.
>
> Refactor the BTF and kallsyms generation stages slightly for more
> regularized temporary names. Skip debug during kallsyms links.
>
> For a full debug info build with BTF, my link time goes from 1m06s to
> 0m54s, saving about 12 seconds, or 18%.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

I've tested locally, seems to be generating BTF properly (I haven't
timed anything, though). See nit below, but otherwise:

Acked-by: Andrii Nakryiko <andriin@fb.com>

>  scripts/link-vmlinux.sh | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>

[...]

> @@ -106,6 +114,8 @@ gen_btf()
>  {
>         local pahole_ver
>         local bin_arch
> +       local bin_format
> +       local bin_file
>
>         if ! [ -x "$(command -v ${PAHOLE})" ]; then
>                 echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
> @@ -118,8 +128,9 @@ gen_btf()
>                 return 1
>         fi
>
> -       info "BTF" ${2}
>         vmlinux_link ${1}
> +
> +       info "BTF" ${2}

Any reason to exclude linking from "BTF" step? It's still a part of
BTF generation, so seems fair to have BTF encompass both vmlinux
linking and BTF generation/deduplication?

>         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
>
>         # dump .BTF section into raw binary file to link with final vmlinux

[...]
