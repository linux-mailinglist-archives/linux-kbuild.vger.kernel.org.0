Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5AD253407
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 17:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgHZPxn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 11:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728068AbgHZPxj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 11:53:39 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B4DC061574;
        Wed, 26 Aug 2020 08:53:39 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id n128so1947705oif.0;
        Wed, 26 Aug 2020 08:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=o3hN2x+K2/a0e691YPA0Bl66LAw1FrnMBO3y3+oCnw8=;
        b=IRq8tSuYrnH25QN6Yj9rP9sTiyDlZe/Z16udXMEYsXNK1Cx59627FnacRrw9G0TCBp
         tkncY0LMZ8KbJC/egWcEsoNB9KmAlDw6DF6CLzxmUiet0dJ9kSAcZyYHcIPT6aPWwWUP
         DdbAWH1TsaPRnWSH6doL+z2afqNth8Akeq2xZG1EoplE4eftzNdIFmdUUz9RIAhOL7nj
         9WmOoTuyrTbh9F8h3CU5x3s4i+L/ACDPl3fGInu4X0vc1ADOpgy+X/gIRpACnavf95UQ
         /KLQCUmeApoAq193qXEx2syow/Q2YWuK/o5Vx0MYRk7QJGMbRnOUNM3PkFkUC4zkO+X9
         HGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=o3hN2x+K2/a0e691YPA0Bl66LAw1FrnMBO3y3+oCnw8=;
        b=Kp9dwaT9SxyRFaOpnTKY/WQRMvPh/dxZ5kNlWjWTbWy/xpxciAm0oV6VNYl1eLHDdO
         MMfsybu65UQwCdYW1lwNaXQzVpbsdhmbJ2EL15nxlNFqk42vC3e+xl9yZGIJz5y5OSr7
         bEqmFBdAEa3cVPwmQ3TRTr7ARF1yBUkpB5P8FJO6VgBeN1kJSXDdTT6y+pm8nzpTADpv
         DmSloYI0MOsZl1HWMi77bKbEiQ6zMwxYaA7KMmJPstsJ+tvVxnSb3ItyuHhzMlgpl8Gl
         3aCEFlZSbaqm2SOP41z4yHIfXU3D7PSzvQ8TQ1nZXOrThy/SpSgTTO7izzrH37ms/Jym
         9lKQ==
X-Gm-Message-State: AOAM530n3dUfswWs+W+GvtC4CFJGWlTiaQfQHPWtPbTG/547yLgaAd4p
        cN3fAPXw1mUm7pQ2xkoQ9hEyeLPRyp9dteD1HmM=
X-Google-Smtp-Source: ABdhPJzoSAfWMhlozkz+grn8+d7raGhdyOYl/yX0Fb/i5A3N9pMZqPhhKnDtFmoxWwYp/6Y8Hoejauz4mnlJOzde2rk=
X-Received: by 2002:aca:3157:: with SMTP id x84mr1273577oix.70.1598457217075;
 Wed, 26 Aug 2020 08:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200825222552.3113760-1-ndesaulniers@google.com>
In-Reply-To: <20200825222552.3113760-1-ndesaulniers@google.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Aug 2020 17:53:26 +0200
Message-ID: <CA+icZUVhwqF=TT2V3XOw1RbdX4g_i5qVX-5eTkVcsgEbfGyJkw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: add minimum clang/llvm version
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Kees Cook <keescook@chromium.org>,
        Will Deacon <will@kernel.org>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 26, 2020 at 12:26 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
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
> +from the kernel that were used to support older versions. Please see additional
> +docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
> +
>  Make

Thanks for the text - a first good step.

Do you plan checks in the source-code - in the future (see [1] where I
played a bit)?
Arch-specific supported LLVM toolchain versions?
Feature-specific support (like KCSAN, Clang-IAS, etc.)?
In the future we should introduce some checks for this to be user-friendly.

If you talk about "Clang/LLVM" does this include the LLD linker?
Personally, I think LLD is worth a separate item like GNU/ld (BFD) linker.

The last few days I was able to build with GCC v10.2 and LLD and even
full LLVM "bin"utils (see [2]) version 11.0.0-rc2 on Debian/unstable
AMD64.

Just some thoughts - for the future.

- Sedat -

[1] https://github.com/ClangBuiltLinux/linux/issues/941
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/kbuild/llvm.rst#n47

>  ----
>
> --
> 2.28.0.297.g1956fa8f8d-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200825222552.3113760-1-ndesaulniers%40google.com.
