Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C7646C7ED
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Dec 2021 00:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242134AbhLGXFl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Dec 2021 18:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241807AbhLGXFl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Dec 2021 18:05:41 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20D38C061748
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Dec 2021 15:02:10 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id l22so1771507lfg.7
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Dec 2021 15:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XeysCYKuIXT30NpKmxVW0LuuA+5Y9jF9W/gtwz7ItQs=;
        b=FjWKHHI5PiBkeM53HJ0SJ8QW3pwZzOqQOjK+ZF5sx7OT+T49loOhaddpCBDI3KVtK9
         G3W8JoJaT2gLeh23K56rW0XqsGUDfQBWPSlRUpiyMBWrwRESbpCREPfznGpocHMz9Jf5
         KTn8soeKulfYk3hqMUD/z7Zx8owzOzX8VkcMydwtoEQ4GmTJslVi0R5449kC+szdM4Dx
         m241C13+coQvCrtRQ7yj49/uRQCajqIkjkKLC/NBjympTCs3D4ZvTaSfN02gjAqsMnGN
         Ur9lQfMbX0byWz8vRjiI6d+I1nRqKhZIfuxK7hwvnuoLl+PiVBQLZEASabzSEx7CyYaG
         Is1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XeysCYKuIXT30NpKmxVW0LuuA+5Y9jF9W/gtwz7ItQs=;
        b=A5Teb3K+BsunTitiHkdmISCOGI1KoYeUZgDRU5YpPdjF6iDqVWp30SlcJjF0XHeNoW
         ezFgO1yIiJegFK3TcjiBXNtnwtDV4MOqy1vmpn7g7V9uRdE7kM3cIQggGi6/gUeYIKDy
         xqECyfOyIXMCaw2RONa6zGomvM83hQI0Ixp+UKxVnD5Lpbt95tCmknYGiicUkX7cQbyi
         OKtIsyG+AMpPKxGO+JuWtbnCqUGxtP7ad36GkW2b5gyb3TufCo1+DhaNeY3CwbFkwAAR
         UN0JC179xQNu+OmSTmt/MSa8i8Fz+GkBb1Et4ntBoyyJoHgPhQm3FUMQ5OJN5eayH0qI
         LwRQ==
X-Gm-Message-State: AOAM532mHptNE3vBwNZle/wK08C2Y9ahVZetdYRIdi4j4MVQ3+1WK9Dw
        HiKn11CYJgd3rzRmEaKPVGoft2KjfkgVfPs1cR7qpw==
X-Google-Smtp-Source: ABdhPJycRpNrtmgPnLthJBwXFriPhrz3LH63dzqAVAo1jcSHKR5llRWJKZLjakqcbvDHbnK3EfH8MLGqnfo8YgsG0oo=
X-Received: by 2002:a05:6512:228c:: with SMTP id f12mr14294851lfu.550.1638918128028;
 Tue, 07 Dec 2021 15:02:08 -0800 (PST)
MIME-Version: 1.0
References: <20211206140313.5653-1-ojeda@kernel.org> <20211206140313.5653-6-ojeda@kernel.org>
In-Reply-To: <20211206140313.5653-6-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Dec 2021 15:01:56 -0800
Message-ID: <CAKwvOdk+A2PBdjSFVUhj4xyCGCKujtej1uPgywQgrKPiK2ksPw@mail.gmail.com>
Subject: Re: [PATCH 05/19] rust: add `compiler_builtins` crate
To:     Miguel Ojeda <ojeda@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 6, 2021 at 6:05 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Rust provides `compiler_builtins` as a port of LLVM's `compiler-rt`.
> Since we do not need the vast majority of them, we avoid the
> dependency by providing our own crate.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
> Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/compiler_builtins.rs | 57 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 rust/compiler_builtins.rs
>
> diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
> new file mode 100644
> index 000000000000..a5a0be72591b
> --- /dev/null
> +++ b/rust/compiler_builtins.rs
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Our own `compiler_builtins`.
> +//!
> +//! Rust provides [`compiler_builtins`] as a port of LLVM's [`compiler-rt`].
> +//! Since we do not need the vast majority of them, we avoid the dependency
> +//! by providing this file.
> +//!
> +//! At the moment, some builtins are required that should not be. For instance,
> +//! [`core`] has floating-point functionality which we should not be compiling
> +//! in. We will work with upstream [`core`] to provide feature flags to disable
> +//! the parts we do not need. For the moment, we define them to [`panic!`] at
> +//! runtime for simplicity to catch mistakes, instead of performing surgery

Rather than panic at runtime, could we do some binary post processing
in Kbuild with $(NM) to error the build if any of the below symbols
are referenced from .o files produced by .rs sources?

If we provide definitions of these symbols, then I worry about C code
that previously would have failed to link at build time when
referencing these will now succeed at linking when CONFIG_RUST=y is
enabled, but may panic at runtime IF we happen to hit those code
paths.

> +//! on `core.o`.
> +//!
> +//! In any case, all these symbols are weakened to ensure we do not override
> +//! those that may be provided by the rest of the kernel.
> +//!
> +//! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
> +//! [`compiler-rt`]: https://compiler-rt.llvm.org/
> +
> +#![feature(compiler_builtins)]
> +#![compiler_builtins]
> +#![no_builtins]
> +#![no_std]
> +
> +macro_rules! define_panicking_intrinsics(
> +    ($reason: tt, { $($ident: ident, )* }) => {
> +        $(
> +            #[doc(hidden)]
> +            #[no_mangle]
> +            pub extern "C" fn $ident() {
> +                panic!($reason);
> +            }
> +        )*
> +    }
> +);
> +
> +define_panicking_intrinsics!("`i128` should not be used", {
> +    __ashrti3,
> +    __muloti4,
> +    __multi3,
> +});
> +
> +define_panicking_intrinsics!("`u128` should not be used", {
> +    __ashlti3,
> +    __lshrti3,
> +    __udivmodti4,
> +    __udivti3,
> +    __umodti3,
> +});
> +
> +#[cfg(target_arch = "arm")]
> +define_panicking_intrinsics!("`u64` division/modulo should not be used", {
> +    __aeabi_uldivmod,
> +    __mulodi4,
> +});
> --
> 2.34.0
>


-- 
Thanks,
~Nick Desaulniers
