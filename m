Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C5F7BA93D
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Oct 2023 20:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjJESi5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Oct 2023 14:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjJESi4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2023 14:38:56 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C4D90
        for <linux-kbuild@vger.kernel.org>; Thu,  5 Oct 2023 11:38:55 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7b0a16f0338so555624241.0
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Oct 2023 11:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696531134; x=1697135934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bW/UNmvenx38n72xyxTklCxWrHzjkVxYi7U2YpzzmQY=;
        b=S5rmT0u+s4G8/mDpNDTYeOMkhMXkgZhogmfoIiLsAPxc6JGo6XensQFU1OnR0mkuMI
         oaq75TejAS0ILyrdBE/Zzu9zMqpskFuqUlwUx9lBRhCQI7/SOYQVlrMy0pS+pP7NYVsn
         R37td+VZ2xkU6FQpf+l3Hu+vlJv0crL4U6rzMNrGhhDfhNyXr2Px2mwmX5eKEZ63y/B9
         6Cg+HrCN/j4QwEwDE48kzHYoQLgZJ2wOtGFtuIXwCysxOuTPXHkFNwBKJMinhA92yjVQ
         6EiWLj/9g505Hjrq4sAV1tKDvQS85fBMNU2zem4tPDQ4oEUnua56suwVZiGyqLSx4dUS
         CXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696531134; x=1697135934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bW/UNmvenx38n72xyxTklCxWrHzjkVxYi7U2YpzzmQY=;
        b=kc5WcCVpLi24p4q9SgoGDaByP2n9/FT5XXm1G77rpeBY37TyiPgJxB1fbeOxcUH05L
         +RgCuvBZVjO7NVciARZpxSsFNnxO5uFnpH2Rr28qvnKFqVv0A2zXkbmtCItlOWLglf9X
         0Ew/pZsJxWCFy823skUntiorfqgtBji9uJf9rG4M3KuPZ09kVM5Rj7g9UJIL61oVOERD
         ZzmZiMEvPrhc/kudr0LpGlaASylkEs0lO27Aqe37WYIXTa8db9hVYZYG0CIDLhJavXET
         4uXQ7Z0jUz33miWoxUrkIbf3RI/SoW2ydBNkc8gm1enbrNlaFZSTz7/bb9N5e3miemqs
         qR9A==
X-Gm-Message-State: AOJu0Ywgq5ImdXTOF6lQBkjA6ZeuJmzWSRK6+7Wi/2RDHT7VxwMsnF1F
        2SfSlBqj4h17zu78if/8fXmD0yOsLAlZj6VhK2w63w==
X-Google-Smtp-Source: AGHT+IGbtsrcT2R0dV38C5J3+TVlCDTcINV+rHWPusOlKA8A6u1+y5KQlTfRnDHABYpAO2ulZxXdaWCMpFibP/AByIc=
X-Received: by 2002:a67:b107:0:b0:452:6465:4a35 with SMTP id
 w7-20020a67b107000000b0045264654a35mr5658104vsl.11.1696531133911; Thu, 05 Oct
 2023 11:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d@kernel.org>
In-Reply-To: <20231002-enable-wincompatible-function-pointer-types-strict-w-1-v1-1-808ab955d42d@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 5 Oct 2023 11:38:41 -0700
Message-ID: <CAKwvOdnzi9g1sz6C_CBFfaqRu7HQ4ZfBphpyBrgV1C=bviR_Uw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wincompatible-function-pointer-types-strict
 in W=1
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, keescook@chromium.org,
        samitolvanen@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 2, 2023 at 3:20=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> -Wincompatible-function-pointer-types-strict aims to catch clang kernel
> Control Flow Integrity (kCFI) violations at build time (rather than run
> time) by validating function pointer assignments against the expected
> prototype, similar to the existing -Wincompatible-function-pointer-types
> that is considered a hard error in the kernel. The -strict variant
> requires the types to match exactly, as opposed to just matching in
> terms of ABI compatibility. This is primarily visible with int/unsigned
> int in lieu of enum types or vice versa.
>
> The tree is not completely clean, so this warning cannot currently be
> enabled unconditionally. However, there are only warnings in one
> subsystem ('drivers/counter'), so it is really close. In order to
> benefit from CI infrastructure that tests with W=3D1, enable this warning
> at that level, so that new instances have a chance of being caught and
> fixed during development.
>
> This should eventually be a hard error in a similar manner as
> Wincompatible-function-pointer-types but some subsystems test
> with W=3D1 + CONFIG_WERROR=3Dn, so it would be rude to break their builds
> when they do not care about warnings outside of their subsystem.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Sounds like we're pretty close to just enabling this by default.
Getting it on in W=3D1 for a cycle will help prevent any backslide.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 2fe6f2828d37..9662f7fd6e39 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -108,6 +108,7 @@ KBUILD_CFLAGS +=3D $(call cc-option, -Wformat-overflo=
w)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wformat-truncation)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-overflow)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-truncation)
> +KBUILD_CFLAGS +=3D $(call cc-option, -Wincompatible-function-pointer-typ=
es-strict)
>
>  KBUILD_CPPFLAGS +=3D -Wundef
>  KBUILD_CPPFLAGS +=3D -DKBUILD_EXTRA_WARN1
>
> ---
> base-commit: ce9ecca0238b140b88f43859b211c9fdfd8e5b70
> change-id: 20231002-enable-wincompatible-function-pointer-types-strict-w-=
1-4a56b99b8c6f
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>


--=20
Thanks,
~Nick Desaulniers
