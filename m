Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEC76A8CE5
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Mar 2023 00:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbjCBXV0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Mar 2023 18:21:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjCBXVZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Mar 2023 18:21:25 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30BA1BDCC
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Mar 2023 15:21:24 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id u20so482599pfm.7
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Mar 2023 15:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677799283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=082LUY0d8Eopzcy4HsqQ/cvuG1sMALYt+tDo/7tRiEg=;
        b=JUxNC5dd8BzWXIMyJcLxuH+je8q4wPsjtwhI1IBXNTyz7d+1ZXu88uBCy+NzL4of80
         IG4EAqkKZt45UAW3SXWsXLfFbbicj+mipklyKhLAhJUrcH0r8PZ7DT4kAWWJd2UNhD5o
         VBk3LsSZZjIjSKHI6vgIaerbFSCPgZs3lG89/mFbN71YUv4dmk32UQOHqsaUIXnSddLx
         eI2pdYFgweQR6DpFXp0lrmUbvCOkEIeBIPUizCykVtlrOsHYPlO+HfkF7DFNcfyNblmV
         qI8od94Dns1q2uiXDaYEyOGaHiQXgCP6U+u2hK3Ok8GKcqLSUXOHfW12dewOGM/iXy/K
         pK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677799283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=082LUY0d8Eopzcy4HsqQ/cvuG1sMALYt+tDo/7tRiEg=;
        b=v7uziukhWqO07oFt2QfxvhjemQo6pKCqWsuNZ7sj5vy1L+Volx7lflzYkf/KmRIfRw
         nWNvHeprJzyaqh3sam74kgTVnjqTfu4yngdFFTmR7RKhfpYtw7Gt+B+zzHkliyq3dxbK
         m9uJRz4PMwjvkCAnGEVpRo4hcC7giLDjB8hkWNf+3hEPjYNBsqPGGRPwsnKy3NJ+nPcN
         ByYD4Ut5NO8Cf/alU/eWPOYR/wKrql5+G4L1SU4Pb41DMQLe2Cs1S8wMimpV0Quci2+E
         0Z7/uHxBmZ8Z+aYj6pfCIj5jhxheWjfMEAhB3pEnUglALI2r5JZPa5b9Fp66cGZixNu4
         rd0g==
X-Gm-Message-State: AO0yUKUinBw/YyPrOs40FcSDnA+PWr/YJazPXWtnzda2GPQ/wgPzUzMo
        VtHnHe0d+XhdYb8tmfkzB1zEzZrRyT9Ms3tJHogseg==
X-Google-Smtp-Source: AK7set8iB3KANP+kYk+SGxaYxkYPCRds4Vjh8f58Fhemsjcq4jdOxoSVFN/P9NJZTZyMLLIAKWJrPBZsssAVygHnkrQ=
X-Received: by 2002:a62:8782:0:b0:60f:b143:8e09 with SMTP id
 i124-20020a628782000000b0060fb1438e09mr81303pfe.1.1677799283268; Thu, 02 Mar
 2023 15:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20230302225808.never.375-kees@kernel.org>
In-Reply-To: <20230302225808.never.375-kees@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 2 Mar 2023 15:21:11 -0800
Message-ID: <CAKwvOdkfCQJcpx3zh0pwHfnBP2v2ieqxqTUzOUyW14s3Xsaf-w@mail.gmail.com>
Subject: Re: [PATCH] fortify: Improve buffer overflow reporting
To:     Kees Cook <keescook@chromium.org>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Mark Brown <broonie@kernel.org>, Puyou Lu <puyou.lu@gmail.com>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, linux-kernel@vger.kernel.org
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

On Thu, Mar 2, 2023 at 2:58=E2=80=AFPM Kees Cook <keescook@chromium.org> wr=
ote:
>
> diff --git a/include/linux/fortify-string.h b/include/linux/fortify-strin=
g.h
> index c9de1f59ee80..981e2838f99a 100644
> --- a/include/linux/fortify-string.h
> +++ b/include/linux/fortify-string.h
> @@ -170,11 +170,13 @@ __FORTIFY_INLINE __diagnose_as(__builtin_strcat, 1,=
 2)
>  char *strcat(char * const POS p, const char *q)
>  {
>         size_t p_size =3D __member_size(p);
> +       size_t size;
>
>         if (p_size =3D=3D SIZE_MAX)
>                 return __underlying_strcat(p, q);
> -       if (strlcat(p, q, p_size) >=3D p_size)
> -               fortify_panic(__func__);
> +       size =3D strlcat(p, q, p_size);
> +       if (p_size < size)

What happens when they're equal? I think this patch changes
behavior...? Intentional?

Did flipping this conditional drop what should be `<=3D`?

Was there an off by one, or is this version of this patch potentially
introducing one? Or am I misremembering my boolean algebra?

> +               fortify_panic(__func__, 1, p_size, size);
>         return p;
>  }
>
> @@ -205,7 +207,7 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char *=
 const POS p, __kernel_size
>         /* Do not check characters beyond the end of p. */
>         ret =3D __real_strnlen(p, maxlen < p_size ? maxlen : p_size);
>         if (p_size <=3D ret && maxlen !=3D ret)
> -               fortify_panic(__func__);
> +               fortify_panic(__func__, 1, p_size, ret);
>         return ret;
>  }
>
> @@ -241,7 +243,7 @@ __kernel_size_t __fortify_strlen(const char * const P=
OS p)
>                 return __underlying_strlen(p);
>         ret =3D strnlen(p, p_size);
>         if (p_size <=3D ret)
> -               fortify_panic(__func__);
> +               fortify_panic(__func__, 1, p_size, ret);
>         return ret;
>  }
>
> @@ -282,8 +284,8 @@ __FORTIFY_INLINE size_t strlcpy(char * const POS p, c=
onst char * const POS q, si
>                         __write_overflow();
>         }
>         if (size) {
> -               if (len >=3D p_size)
> -                       fortify_panic(__func__);
> +               if (p_size < len)

`<=3D` ? (This used to panic when they were equal)

> +                       fortify_panic(__func__, 1, p_size, len);
>                 __underlying_memcpy(p, q, len);
>                 p[len] =3D '\0';
>         }


--=20
Thanks,
~Nick Desaulniers
