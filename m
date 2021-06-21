Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BBD3AF9AB
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbhFUXo1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:44:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:39678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231268AbhFUXo1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:44:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB77E611BD;
        Mon, 21 Jun 2021 23:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624318932;
        bh=DvDLPnl1T2QLDOKnX2hy+Vza+bRnQ7CiMwP0kyUwRkA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=e/XBiSb7nbvYw6tmWEfExCE2S4NXYz0QkQqOO91wmZOXqeyoLebODJvSnzdo39vbA
         jE0i8gPiQL8omNOvog2a/xIkMZ7aG2X5EMY8JnHkBjW0kAIp1T7ZtMohnT+VH/k6OI
         8v35NgOnTDWaN3PSLLLGVd/csN3MRV5BjtxxMO9g1KhrPI5uQVDhvmpE7vRTzhR13K
         ISU6RIX9/sSloKt0j5/6RzbmMboGUtvtMfAF85E2dvzGkygkQYUVU4p2veIvjUnaF2
         LDuB/b7YN1Lo6BSqKOGb1ebLu0fvdBkQiy8hptNrZk9erfG3FJNluUhzkgv+pJljQp
         lfHFjU71LCNUQ==
Subject: Re: [PATCH v2 2/3] compiler_attributes.h: cleanups for GCC 4.9+
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
 <20210621231822.2848305-3-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <b8a97953-762f-e707-c1ba-4ea25e9ad259@kernel.org>
Date:   Mon, 21 Jun 2021 16:42:09 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621231822.2848305-3-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/21/2021 4:18 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> Since
> commit 6ec4476ac825 ("Raise gcc version requirement to 4.9")
> we no longer support building the kernel with GCC 4.8; drop the
> preprocess checks for __GNUC_MINOR__ version. It's implied that if
> __GNUC_MAJOR__ is 4, then the only supported version of __GNUC_MINOR__
> left is 9.
> 
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   include/linux/compiler_attributes.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index 225511b17223..84b1c970acb3 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -27,7 +27,7 @@
>    */
>   #ifndef __has_attribute
>   # define __has_attribute(x) __GCC4_has_attribute_##x
> -# define __GCC4_has_attribute___assume_aligned__      (__GNUC_MINOR__ >= 9)
> +# define __GCC4_has_attribute___assume_aligned__      1
>   # define __GCC4_has_attribute___copy__                0
>   # define __GCC4_has_attribute___designated_init__     0
>   # define __GCC4_has_attribute___externally_visible__  1
> @@ -35,8 +35,8 @@
>   # define __GCC4_has_attribute___noclone__             1
>   # define __GCC4_has_attribute___no_profile_instrument_function__ 0
>   # define __GCC4_has_attribute___nonstring__           0
> -# define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
> -# define __GCC4_has_attribute___no_sanitize_undefined__ (__GNUC_MINOR__ >= 9)
> +# define __GCC4_has_attribute___no_sanitize_address__ 1
> +# define __GCC4_has_attribute___no_sanitize_undefined__ 1
>   # define __GCC4_has_attribute___fallthrough__         0
>   #endif
>   
> 
