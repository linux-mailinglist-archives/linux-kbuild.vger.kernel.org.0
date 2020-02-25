Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 131D216F096
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 21:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728315AbgBYUw2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Feb 2020 15:52:28 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40379 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgBYUw2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 15:52:28 -0500
Received: by mail-pj1-f66.google.com with SMTP id 12so245843pjb.5
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 12:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GAoYW3jtAWCjdGaJXCm1P0l2hukH5ekAbYDVhrn3FCI=;
        b=kJBKheySLFt0Q1njT7UpJ8+EDt27CVBBJHrvJ0UtSvuHFxIIjGi22GqBUgpH2nAHdI
         JY5jrCDf3PIG9COk+pwYByEiwkOKxIApV/ovtrc9wrCaKya9UoDMEVp3Rz9kOWYFJgZ6
         LFrubn4k0J3ci67mSNf1jdg3j0c2vRI3NMo0hVWrLh5JRtR2Ea45SlATQTxbUKChv5wX
         4xOYXRcY5SQJ59KF+n2sYezpKSTZ/7kWy6dPhVgzAu1h6Pl5XBxt8qUPbxgM379BZ/Oa
         /iM37C2zdp+gP8bAXtXgNbQc3SdKilus0OLnBjt0xT5I3zkOQcbj5sMbfKPzqlA7Sd0v
         mZhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GAoYW3jtAWCjdGaJXCm1P0l2hukH5ekAbYDVhrn3FCI=;
        b=b2THmKzqnEDC/oq6WpCV3jfmSgdPINVkw0EhLaiIMogjYNi2KolDVwqTfDpGqW/SNt
         82kJgyhwfLyFpM7KAT1xXdtHDuIFIaU45UlNQ/+EBp7IB6X8usjRyE5mpfQjN55U9Lq6
         4tPUOtXQckt2tCNSdI62sB7s3knLu35wzlyjP7wqMDSYrhwNRjpXo770phUv7hGRzzod
         /IahjUjsb1551AXlFNkw9o2Bu2ZuRZhcPr2Ad1NEBM+PAUBREvS8clIcdoB7pYP2YrM7
         tFZdlXgIO8lAUo4PA+VcuNLyQuiX619sVSeh4wd0G6sNwjG3DuRUbpWLSb3+v5htB9WJ
         zQ5Q==
X-Gm-Message-State: APjAAAV8EQWfKqeiqAzLFXF1j9w2iNMpFnSv7uORaiHkW3rlVfUxcPPH
        QlR/K/PkjnY5DZMBcDgctX1oJSbdTgpnjZtU+Rhpntjs
X-Google-Smtp-Source: APXvYqwmB04vyduuyJu/HEN0PY3Yi4sOxYmfQoRVMJPmSpkr6VIiN9TCWrQH4VKDHGWrnSeq/vTIXr42Ie5xms8bARw=
X-Received: by 2002:a17:902:8a88:: with SMTP id p8mr353457plo.179.1582663947479;
 Tue, 25 Feb 2020 12:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com> <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
In-Reply-To: <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 25 Feb 2020 12:52:16 -0800
Message-ID: <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 24, 2020 at 4:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Added to kbuild documentation. Provides more official info on building
> > kernels with Clang and LLVM than our wiki.
> >
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
>
>
> Perhaps, is it better to explicitly add it to MAINTAINERS?
>
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
>  B:     https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  S:     Supported
> +F:     Documentation/kbuild/llvm.rst
>  K:     \b(?i:clang|llvm)\b

I'm happy to leave it to the maintainers of Documentation/.  Otherwise
we have a file for which there is no MAINTAINER, which seems
ambiguous.

-- 
Thanks,
~Nick Desaulniers
