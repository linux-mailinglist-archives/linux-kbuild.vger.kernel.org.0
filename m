Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECF717B5BD8
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Oct 2023 22:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjJBUKx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Oct 2023 16:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjJBUKw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2023 16:10:52 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667B7AC
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Oct 2023 13:10:49 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32329d935d4so183849f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Oct 2023 13:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696277448; x=1696882248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFOstXEQlXhjDb+N/dzpV+yhV1gDE+Z2FA2nVC44tYo=;
        b=iH6WktU4ORPZStWXkS8vPeF1zKBPYgEa7XoxJhiS/PviGe1K7TJ9J0BdhoTuhppMdb
         OBh8e5w339OWtLOEjNgmvwZO7VvAmPCAAtH/CVkVTUeEzCi4XbwD9uz0GWIwngYWbTVq
         F1TStXdhobBIMvhGwp4Y0EO/BXWTKTe1znhde026MPcD9+CiWltpCxCvTATPPUG7VYaV
         ag1g9Yr7KAnDpcK5OTLGeDv83xp6HAToKDB515QpFnFmTpIlJXiXFne6Mn7YzbSZdMvm
         ntsFKPj2Q0zKDuXcN5vRiEi/PovKcoVdGF8UBZAX9tdGIWCRqISbR1+sNV1uoj1vC9Aq
         4J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696277448; x=1696882248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFOstXEQlXhjDb+N/dzpV+yhV1gDE+Z2FA2nVC44tYo=;
        b=u+0OfYuFJtnJyXcwpVl2+DJ2TJQSEqc7s9djvjWytG63C6mL2/P3V1e6gexYySh+j/
         WIW1wTpbWJEPjT9gwoDtlEW2tBUDe+X8Y2Wp9H3+NbL1qT4hy+Lvnhp5I8aGOicKu3y7
         HpwfiFj1L1nQIsR+h8g+urMeHI/0/bhWD9UQ9pk1LKS3laGDWMKcXy/J6Dzh+EPFpgUh
         tJQnqgr7ie7q0piuwL9YSFg1D2RXPnnPaqy+pZP/oflOyYayGEVmZq7eDhmtZ4fbp5GT
         4ojlMtvivclxyHuqkURinQ62eLoslzFgznNdWGpeXjN/WT0DS+JifDqNPmSePQ3PYrAG
         kZVw==
X-Gm-Message-State: AOJu0YxQl5yYnc3KuTltoW6TqJZrEvSvDTKPFKnbNqUC9fod+sCILqQW
        ORZM3XeyIwM56ipEcgoI1JldWh0q1qFPtocbW3fOCxXCrlpM2rSgJYs=
X-Google-Smtp-Source: AGHT+IElqfgkTtUO0/BuQ+5/kFgQWb+8Ch4D3J+irZT5GSi7IJL+nl7tY7mlEpmV9MFXsVujdKNzO0SI8enMSxwms7k=
X-Received: by 2002:a5d:58e1:0:b0:31f:6524:2de1 with SMTP id
 f1-20020a5d58e1000000b0031f65242de1mr10259399wrd.32.1696277447607; Mon, 02
 Oct 2023 13:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231002-disable-wformat-truncation-overflow-non-kprintf-v1-1-35179205c8d9@kernel.org>
In-Reply-To: <20231002-disable-wformat-truncation-overflow-non-kprintf-v1-1-35179205c8d9@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 2 Oct 2023 13:10:34 -0700
Message-ID: <CAKwvOdn-NqEjfteby_9hKBcrC-24P7tRnmGiTpa4fL66eJOZ8w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable clang's -Wformat-{overflow,truncation}-non-kprintf
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
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

On Mon, Oct 2, 2023 at 12:52=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Recently, clang added support for -Wformat-overflow and
> -Wformat-truncation. When building the kernel, it was discovered that
> clang's implementation of these warnings handles the '%p' specifier,
> which differs from GCC's implementation. This results in false positive
> warnings due to the kernel's various '%p' extensions. Fortunately, the
> clang developers placed this warning difference into a separate flag,
> allowing the kernel to turn off the warning for '%p' unconditionally.
>
> This is not currently an issue for a normal build, as -Wformat-overflow
> and -Wformat-truncation are unconditionally disabled, which includes
> this sub-warning. However, ever since commit 6d4ab2e97dcf ("extrawarn:
> enable format and stringop overflow warnings in W=3D1"), these warnings
> are in W=3D1 and the goal is to enable them in the normal build once they
> are all eliminated. Disable the warnings for W=3D1 to avoid false
> positives. This block should move with -Wformat-overflow and
> -Wformat-truncation when they are enabled for a normal build.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1923
> Link: https://github.com/llvm/llvm-project/issues/64871
> Link: https://github.com/llvm/llvm-project/pull/65969
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111219
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D78512
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

This should be the final piece of the puzzle...a long arduous puzzle.
Thanks Nathan!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.extrawarn | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 2fe6f2828d37..bad1baa2cfb4 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -106,6 +106,13 @@ KBUILD_CFLAGS +=3D $(call cc-option, -Wunused-const-=
variable)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wpacked-not-aligned)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wformat-overflow)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wformat-truncation)
> +# Clang checks for overflow/truncation with '%p', while GCC does not:
> +# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D111219
> +# The kernel has many extensions to '%p' that clang does not understand,=
 so
> +# always disable these warnings when '-Wformat-truncation' and
> +# '-Wformat-overflow' are enabled.
> +KBUILD_CFLAGS +=3D $(call cc-disable-warning, format-overflow-non-kprint=
f)
> +KBUILD_CFLAGS +=3D $(call cc-disable-warning, format-truncation-non-kpri=
ntf)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-overflow)
>  KBUILD_CFLAGS +=3D $(call cc-option, -Wstringop-truncation)
>
>
> ---
> base-commit: 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa
> change-id: 20231002-disable-wformat-truncation-overflow-non-kprintf-033e8=
d8b4de8
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,
~Nick Desaulniers
