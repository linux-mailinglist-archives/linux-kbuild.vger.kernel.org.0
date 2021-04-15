Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B8E3607CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 12:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhDOKyz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 06:54:55 -0400
Received: from codesynthesis.com ([188.40.148.39]:50340 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOKyx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 06:54:53 -0400
Received: from brak.codesynthesis.com (unknown [105.186.239.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 19C455F744;
        Thu, 15 Apr 2021 10:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1618484069;
        bh=reD9xaYuqg0SjFGIUsFww6nZY6w7d0yiET65h5mPuM4=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=W7KeNT0P/rEfidTCe2ssTOv6VtxSjxolY0537TthIi3jZUJuI4Bhw1xo1UFnSP/Le
         pFRiZfn3if+/m1FbW90HrRXWJHalJPoxJ0EXx2nYrXj/z3WLuaU7lh/H+MwwZBvOlS
         wT7rr+L9XGfRibRs8rcuGfHZkqWvQq/jwRPli7wXTfyq3jXRiYLWsj+FPyIz5nI8XI
         P2KyIotv7khDWFO2/YLK5nq2WqUmN3RYufP78vkFDW43haUodTZ5Kp2+9wrMunCGE+
         UcIKeEamIuRwo12EXY1aa3CDJI13/zhNS3UpIWASNEJ3/hSfafSrVHbZ4rwjwsXEet
         2dgpgXTcUAdLQ==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id C39E91A802C0; Thu, 15 Apr 2021 12:54:22 +0200 (SAST)
Date:   Thu, 15 Apr 2021 12:54:22 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: split menu.c out of parser.y
Message-ID: <boris.20210415125211@codesynthesis.com>
References: <20210413150817.110282-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413150817.110282-1-masahiroy@kernel.org>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> --- /dev/null
> +++ b/scripts/kconfig/internal.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef INTERNAL_H
> +#define INTERNAL_H
> +
> +struct menu;
> +
> +extern struct menu *current_menu, *current_entry;
> +
> +#endif /* INTERNAL_H */

Maybe call it menu.h instead of internal.h? Unless you have plans
to put other "internal" stuff in there.


> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -28,7 +29,7 @@ static bool zconf_endtoken(const char *tokenname,
>  
>  struct symbol *symbol_hash[SYMBOL_HASHSIZE];
>  
> -static struct menu *current_menu, *current_entry;
> +struct menu *current_menu, *current_entry;

Why not put these in menu.c?

