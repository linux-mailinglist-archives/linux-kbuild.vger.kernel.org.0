Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DAA30A00A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Feb 2021 02:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhBABeb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 Jan 2021 20:34:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:56974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229840AbhBABeS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 Jan 2021 20:34:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FE0B64E2A;
        Mon,  1 Feb 2021 01:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612143207;
        bh=fO+4HxRtzLeF20gmbZMjzwA2k734mn4BlsZYG5CM7ao=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hsJzZlc9h740CxmeA4nGT6eqC1QOGYFWB6KQCSK3GoQm5ep5jcH8YcDtYngqaSk2W
         tYvtdMc15wIbw90h5ppfkZQQnwnWbapJnuNt6J6VTEU2P0sJ8hnR75OsIlRDNKdEaO
         0gMj0jpdXK9RMOGMfx34gUcBqCcVvevcwyTVS0LRwl2LMspGc1y/fxnP4n6c7nmJpL
         kMI9VMPISMkjvj7QnvVsESsmMj8+BqRIgdf7///vmymp3mWDzO+wKb9F3dRplSJ43V
         dFnsnymGoKaFRs6ySpiEFPDj9n4O19qsrR3i7SqPPUoBOvsAF66tHGssX7cN2uHKUV
         yhUE8/22LhFeg==
Date:   Sun, 31 Jan 2021 18:33:24 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-spdx@vger.kernel.org
Subject: Re: [PATCH] scripts: switch some more scripts explicitly to Python 3
Message-ID: <20210201013324.GA2423231@localhost>
References: <20210201010819.655597-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201010819.655597-1-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 01, 2021 at 10:08:18AM +0900, Masahiro Yamada wrote:
> For the same reason as commit 51839e29cb59 ("scripts: switch explicitly
> to Python 3"), switch some more scripts, which I tested and confirmed
> working on Python 3.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  scripts/clang-tools/run-clang-tools.py      | 2 +-
>  scripts/spdxcheck.py                        | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 19963708bcf8..8ddb5d099029 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Copyright (C) Google LLC, 2018
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index fa7655c7cec0..f754415af398 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Copyright (C) Google LLC, 2020
> diff --git a/scripts/spdxcheck.py b/scripts/spdxcheck.py
> index bc87200f9c7c..cbdb5c83c08f 100755
> --- a/scripts/spdxcheck.py
> +++ b/scripts/spdxcheck.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  # Copyright Thomas Gleixner <tglx@linutronix.de>
>  
> -- 
> 2.27.0
> 
