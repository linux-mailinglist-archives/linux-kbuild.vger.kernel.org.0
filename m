Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A6A25292B
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 10:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgHZI0D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 04:26:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:44826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726016AbgHZI0C (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 04:26:02 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E96E7206FA;
        Wed, 26 Aug 2020 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598430361;
        bh=5wVmWCd81p+o5o7p8OG6yxBYpUPruz1P71KvQMqUMp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n8zUC52bBAfYO7Lsob5wxELavmBTQS0IkmJlzuiSpC0mz2/6R40u9u0i0FTUzub8q
         q7U6Dj8drhsmb+9RiNemod8uaoipY6qkx8GXsj1WaiAy6IhcbvngAUfEHzA7SxRG7u
         S/RtHVAql+oMfRJ/pMOC56PMVY9n2DXW5pF+Jdrg=
Date:   Wed, 26 Aug 2020 09:25:55 +0100
From:   Will Deacon <will@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Kees Cook <keescook@chromium.org>,
        Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: add minimum clang/llvm version
Message-ID: <20200826082555.GA27752@willie-the-truck>
References: <20200825222552.3113760-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825222552.3113760-1-ndesaulniers@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 25, 2020 at 03:25:51PM -0700, Nick Desaulniers wrote:
> Based on a vote at the LLVM BoF at Plumbers 2020, we decided to start
> small, supporting just one formal upstream release of LLVM for now.
> 
> We can probably widen the support window of supported versions over
> time.  Also, note that LLVM's release process is different than GCC's.
> GCC tends to have 1 major release per year while releasing minor updates
> to the past 3 major versions.  LLVM tends to support one major release
> and one minor release every six months.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Note to reviewers: working remote, I'm having trouble testing/verifying
> that I have the RST links wired up correctly; I would appreciate it if
> someone is able to `make htmldocs` and check
> Documentation/output/process/changes.html properly links to
> Documentation/output/kbuild/llvm.html.
> 
>  Documentation/kbuild/llvm.rst     |  2 ++
>  Documentation/process/changes.rst | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index 2aac50b97921..70ec6e9a183b 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -1,3 +1,5 @@
> +.. _kbuild_llvm:
> +
>  ==============================
>  Building Linux with Clang/LLVM
>  ==============================
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index ee741763a3fc..6c580ef9f2a3 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -30,6 +30,7 @@ you probably needn't concern yourself with pcmciautils.
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================
>  GNU C                  4.9              gcc --version
> +Clang/LLVM (optional)  10.0.1           clang --version
>  GNU make               3.81             make --version
>  binutils               2.23             ld -v
>  flex                   2.5.35           flex --version
> @@ -68,6 +69,15 @@ GCC
>  The gcc version requirements may vary depending on the type of CPU in your
>  computer.
>  
> +Clang/LLVM (optional)
> +---------------------
> +
> +The latest formal release of clang and LLVM utils (according to
> +`releases.llvm.org <https://releases.llvm.org>`_) are supported for building
> +kernels. Older releases aren't gauranteed to work, and we may drop workarounds

typo: guaranteed

Will
