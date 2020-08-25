Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D262523CF
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 00:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgHYWvi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Aug 2020 18:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgHYWvf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Aug 2020 18:51:35 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E37AC061574;
        Tue, 25 Aug 2020 15:51:35 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id s16so324820qtn.7;
        Tue, 25 Aug 2020 15:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RRYm8K54iTM0KmZ7diI013rBcUcgsXrhjLGzNHRl7Rg=;
        b=rchlr1Gb7qoXlcfZld/WTVS7B4cMQosuzwK/vU04y3i/CR5vmoawJu5NNf+PWijlzO
         zh7Pk7v9aG6fTAev6uTCPjAECWd83nm6cVfRBAw2ejiJQJ1l/hzPH73M3eVf4Xg86eTG
         3iIspWHHE99X0ElIPniIErSg2xHJwb9btjaD0OLYAKihJuXTZn1+C/+FX7anBZdX5U/J
         nJopOCgMoYX+4QHC4oxVfxhQVpaWN9tff8Yi0p6e66DsPGFjW5VOC6npbzo0eyvxgOYe
         IWrk988JpKGN3LEQ9dYJ8a2hguKkcxjFxArWzU7FzhvuqlC33OzHifX6smu3jipeJsIM
         2+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RRYm8K54iTM0KmZ7diI013rBcUcgsXrhjLGzNHRl7Rg=;
        b=tnOj7+oZfWh1D1Ym879HfPy9DOqJnFRXrdhSvAfUohqH5mAtoazVyntPXCa0X3mJxl
         B15dHAK8p+ECH/0J3AK+cd/Abdfx1xRVJBS4+c/2K48UQCvRVyGB83mJScDTVFFjbGKV
         qyRjr4xZ1EXdQDwDRjJUb5OToppO11R4AFJMKv7NuseqnW8VWaLONWkR05A/CG7EVmtU
         l+3lAXdMb5llZNfSe/Y8zjR23gw05iWDZxDEelvqcVqExK7Rl/4vlRBZACyVimxIFu9b
         ojz3wisBQf4iXxO7F6mZZSLd1fJXDoqtn3XT/IKJ7EddjDSKes92bstw+JS1fWNQJ8bs
         nqzg==
X-Gm-Message-State: AOAM531DuGpuKUjTYEYkUZqKDWNETLWpkVK+Add9wgP4fZKY10RZ11es
        g+dlVqrFDuveT539WuAcheo=
X-Google-Smtp-Source: ABdhPJzlIF0klzc1WeI+3Dpjcw7mOVpEhCkd6vWLI961R34YyHmWrmRqxKNFA1rLy9d2d2Qot81Ypg==
X-Received: by 2002:ac8:75c8:: with SMTP id z8mr11468112qtq.327.1598395894379;
        Tue, 25 Aug 2020 15:51:34 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id g13sm254959qki.62.2020.08.25.15.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 15:51:33 -0700 (PDT)
Date:   Tue, 25 Aug 2020 15:51:31 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Theodore Ts'o <tytso@mit.edu>,
        Kees Cook <keescook@chromium.org>,
        Will Deacon <will@kernel.org>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: add minimum clang/llvm version
Message-ID: <20200825225131.GA2702183@ubuntu-n2-xlarge-x86>
References: <20200825222552.3113760-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825222552.3113760-1-ndesaulniers@google.com>
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

I ran 'make O=out htmldocs' and can confirm that the link works properly
in process/changes.html, pointing to kbuild/llvm.html.

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

Maybe it is worth making the "(optional)" a footnote like Sphinx? Seems
to just kind of stick out to me but I do not have a strong opinion
unless others do.

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
> +from the kernel that were used to support older versions. Please see additional
> +docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
> +

Do we maybe want to add a section for LLVM/clang in the "Getting updated
software" section? Maybe just a link to the existing section that we
have in kbuild/llvm.rst?

>  Make
>  ----
>  
> -- 
> 2.28.0.297.g1956fa8f8d-goog
> 

Regardless of the nits above:

Reviewed-and-tested-by: Nathan Chancellor <natechancellor@gmail.com>
