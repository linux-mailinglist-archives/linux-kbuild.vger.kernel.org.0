Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC4F77A09CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Sep 2023 17:55:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241233AbjINPzX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Sep 2023 11:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241180AbjINPzX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Sep 2023 11:55:23 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231201BDD
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Sep 2023 08:55:19 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-76e09202322so77314285a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Sep 2023 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694706918; x=1695311718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed6kMFIrr+f+xn9dsqgZ7eRcJZoA4HQQQ41J7y4ud6w=;
        b=pEXchg2u8svKoSQNz0fHbMPNsgy6dlftmrtNZlrrIeIQc4EHM7MNlefMH7xLXMhPOU
         DHakgv8FLYp2O8FEjo4DtDZwixQEgUEHicwmf1agy3XSH68Y3nwrYZHckJfHRA09jYxE
         BJsHqusZreI7iCLDWLTfSylUJmIGT0OsVNHmKZgw1g6e6fYzgORAMVX5ccopSCPF8Agn
         MtVqpgLSTW1cubGzNN9qlpLK069+5Xlq5Fdp0ScRgdyHu9WzbKjA3qHt6viGwEOJsZLk
         AvGiTGjvGH0O5poS+nxzxfEcIq/6pKSiYZEnCfWm7CUx1hR1UYiP+MTwdMxh6yZNArZU
         iAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694706918; x=1695311718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ed6kMFIrr+f+xn9dsqgZ7eRcJZoA4HQQQ41J7y4ud6w=;
        b=f1+LIrNK+mT2wCKmj24YigXhxYs9pV17rgvSUUn0u6sqpj9766OviIoiWcdg31uE2d
         GPnNVy7SJ49sULvZybR6FaAJUNGOf2HpZssZV0+1Kjsi2XkEkA5dG37d6JHt7ufDA/Y8
         27JPgLgo4+1eBAM/fInEgZCPay8MM5Hc2djn9YDzB24bfB2ckFXxebJfWahXGYupnQiC
         i8ZOo3HFNKLDAl9JHXG5cBv7dJ78LbiuTwGf2zGgzSZ/hB5qLl1bnOYhjzKtYFmLT13W
         WrA+Rx/3DLLKQulSD3ANBpwzEA5uMSmRCOUocS5OWtud2qHxNR+ktegG5i4NWMH2m0Ht
         vn3w==
X-Gm-Message-State: AOJu0YwjH0eyjrOTgN8w24WDoJskgsBeXl5In/ljwBprtozx6nA2sIHt
        Az4Gs8zN4LHePITVrM5pRTpPmzsmP5YCHQN6FSMzAg==
X-Google-Smtp-Source: AGHT+IGeUfpfIHksy/bSpNhD0SpKxU/8ki6nZfCPY8OfuV8JRGkANdn9lKVe20GsF1utajayE7ecn4avCnOFbJp7XDI=
X-Received: by 2002:a0c:c212:0:b0:649:869c:8dfc with SMTP id
 l18-20020a0cc212000000b00649869c8dfcmr6543602qvh.50.1694706918155; Thu, 14
 Sep 2023 08:55:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131225.13415-1-will@kernel.org> <20230914131225.13415-3-will@kernel.org>
In-Reply-To: <20230914131225.13415-3-will@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 14 Sep 2023 08:55:03 -0700
Message-ID: <CAKwvOd=z5pjr2Y=jxYU=Y10EKniWd4w8YV_yhZRvVBoon8TRLQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] scripts/faddr2line: Use LLVM addr2line and readelf
 if LLVM=1
To:     Will Deacon <will@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        John Stultz <jstultz@google.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 14, 2023 at 6:12=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> GNU utilities cannot necessarily parse objects built by LLVM, which can
> result in confusing errors when using 'faddr2line':
>
> $ CROSS_COMPILE=3Daarch64-linux-gnu- ./scripts/faddr2line vmlinux do_one_=
initcall+0xf4/0x260
> aarch64-linux-gnu-addr2line: vmlinux: unknown type [0x13] section `.relr.=
dyn'
> aarch64-linux-gnu-addr2line: DWARF error: invalid or unhandled FORM value=
: 0x25
> do_one_initcall+0xf4/0x260:
> aarch64-linux-gnu-addr2line: vmlinux: unknown type [0x13] section `.relr.=
dyn'
> aarch64-linux-gnu-addr2line: DWARF error: invalid or unhandled FORM value=
: 0x25
> $x.73 at main.c:?
>
> Although this can be worked around by setting CROSS_COMPILE to "llvm=3D-"=
,
> it's cleaner to follow the same syntax as the top-level Makefile and
> accept LLVM=3D as an indication to use the llvm- tools, optionally
> specifying their location or specific version number.
>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: John Stultz <jstultz@google.com>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>

Thanks for the patch series!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/faddr2line | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/faddr2line b/scripts/faddr2line
> index a35a420d0f26..6b8206802157 100755
> --- a/scripts/faddr2line
> +++ b/scripts/faddr2line
> @@ -58,8 +58,21 @@ die() {
>         exit 1
>  }
>
> -READELF=3D"${CROSS_COMPILE:-}readelf"
> -ADDR2LINE=3D"${CROSS_COMPILE:-}addr2line"
> +UTIL_SUFFIX=3D""
> +if [[ "${LLVM:-}" =3D=3D "" ]]; then
> +       UTIL_PREFIX=3D${CROSS_COMPILE:-}
> +else
> +       UTIL_PREFIX=3Dllvm-
> +
> +       if [[ "${LLVM}" =3D=3D *"/" ]]; then
> +               UTIL_PREFIX=3D${LLVM}${UTIL_PREFIX}
> +       elif [[ "${LLVM}" =3D=3D "-"* ]]; then
> +               UTIL_SUFFIX=3D${LLVM}
> +       fi
> +fi
> +
> +READELF=3D"${UTIL_PREFIX}readelf${UTIL_SUFFIX}"
> +ADDR2LINE=3D"${UTIL_PREFIX}addr2line${UTIL_SUFFIX}"
>  AWK=3D"awk"
>  GREP=3D"grep"
>
> --
> 2.42.0.283.g2d96d420d3-goog
>


--=20
Thanks,
~Nick Desaulniers
