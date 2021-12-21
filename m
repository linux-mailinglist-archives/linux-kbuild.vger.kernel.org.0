Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B49347C9B8
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Dec 2021 00:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236054AbhLUXaX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Dec 2021 18:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235284AbhLUXaX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Dec 2021 18:30:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EC1C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Dec 2021 15:30:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BEB6FB81A17
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Dec 2021 23:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745DEC36AE9
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Dec 2021 23:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640129420;
        bh=rENX5jV+c1pMFrc6oFr1QShd1zsGxm8J47Y9mNM8C+c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HusCLWcF58tW1iunn7fJ4bCAGro+a+ZRMG/l8LYZrXXEUCpV0Q8pcCx+ROvIFEH04
         BPtEHKyK1u2z5HvRXXPk7PLwwVC7AZ1iuFzMEgdXDx11frj45yNXGRguYqwGULbFN2
         T6Yh96jheGl3VtQb8gBxpS0Beu0b7H9AQTYuECNr429izzfLt9ypmtQCUhJxrQrWBN
         +AV9raIdVwG5qtq9YZSLoAUOazK1Kzo1Y07+DZyQTG10zvhrgdurxZ8HEDzINjyPNP
         35feXMX5XrEBJnjIFSg5l87jN8RO7GnqokoUuZPC13SJd8oh3EwTFGMYYaBQ+uPSOx
         jaoCwXIwZ7m1g==
Received: by mail-ed1-f52.google.com with SMTP id b13so1281493edd.8
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Dec 2021 15:30:20 -0800 (PST)
X-Gm-Message-State: AOAM530izug0ae8SI+naZWt4XNUVdBUtdSmmAbGBy+Jx1VI0NhzJ1zuO
        tmq3sa0QPbhlOnwCHLOeaxwEu+6nhEd3si1zpQ==
X-Google-Smtp-Source: ABdhPJxUCqsAkEhGbm0j4+CQGS6vhUKHDtHAVTnMurPrTTYt6ALDFs6PdrLIcu8Fz+YE/ohVLctu0B4wYSZ8yV29Sn4=
X-Received: by 2002:a17:906:229b:: with SMTP id p27mr467708eja.264.1640129418725;
 Tue, 21 Dec 2021 15:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20211220162925.14441-1-ysionneau@kalray.eu> <20211220162925.14441-2-ysionneau@kalray.eu>
In-Reply-To: <20211220162925.14441-2-ysionneau@kalray.eu>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 21 Dec 2021 19:30:06 -0400
X-Gmail-Original-Message-ID: <CAL_JsqJPxPR5QGKDy8CVrph8ScfNJ0Bu29XmrEGxN1d9Zf6WbQ@mail.gmail.com>
Message-ID: <CAL_JsqJPxPR5QGKDy8CVrph8ScfNJ0Bu29XmrEGxN1d9Zf6WbQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Use target CPP to pre-process dts as supported flag
 checks are done on target toolchain
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 20, 2021 at 12:29 PM Yann Sionneau <ysionneau@kalray.eu> wrote:
>
> If some flag is not supported by host toolchain but is supported by target toolchain, then
> using host toolchain will fail here because the checks are only done on target toolchain.
>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 94133708889d..1d11b7a23957 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -316,7 +316,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>         $(call if_changed,dt_S_dtb)
>
>  quiet_cmd_dtc = DTC     $@
> -cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +cmd_dtc = $(CC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \

The host toolchain is used so that we don't have to have cross
compiler for every last arch.

Rob
