Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 799847A4DA7
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Sep 2023 17:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjIRP5C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Sep 2023 11:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjIRP5B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Sep 2023 11:57:01 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27F92721
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Sep 2023 08:55:09 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-65641c171cbso12495816d6.3
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Sep 2023 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695052284; x=1695657084; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npyytzb/8fGfFOzFWav6JIpKQnixl0/mUAWigmTXJoE=;
        b=pwG63Xk23VdqZ7u9D2/IWBTeABvxM5ciAeSxi1rfBQpOn5ucFfYdFOmKTCwneWV+Qd
         NKteIAQw70u6cb+NaG+aGuvmnGbdixQYXP8hNb/O6QNQwNSQxYHRI0oqRdT9NtmkSqhe
         jklnyTeS16nLMXn397JLt3fZKw3Fe1pm49ek7R1SEQxwOx1yOObn1XWGjFI+XzH3zRs/
         V0ym0pSR+yzOhr631juER/y2C626qiz7zEok0+Dxnb5JW6i8SjG6zKVhInERdCYoQWbw
         lFuz79wnIjizUNfLTetwYZq/sLiHYPEHT7HMnbD0BlfWbQry3R1ELJ2syRjLD6mlu2hI
         lUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695052284; x=1695657084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=npyytzb/8fGfFOzFWav6JIpKQnixl0/mUAWigmTXJoE=;
        b=bK0dEM6xcI9M0EYyx0oze8zYbN5BWCo8aHZIBvnxYeMqZiiZlJGZxoeJTlMp6RLOVC
         qpKUknH60DHz7tkL2RCYUHgAd9g/VOpxpijaO3/X1qqPV3OJ3z+/adU9kDFmA4JzaGq5
         CU/8JqwaB8+3Wo0qkU97OQuF36/9yQo37Ul4l6Vh5HZXU3alR7HdHIAloJ2ZMJxb4HsM
         bGP/D3DX7txI9W5p/+xAD+saYKvbmbYpQzedmqdx4+zVXp9k/asWSG71Kc30N/mIaJX8
         MQxbiB6VQGwuTbNspbMQb+jk57lb3HhS/VhpLTEqIww2ZA9mUwO+oWwbeme0PrG2b0Jw
         QqQQ==
X-Gm-Message-State: AOJu0YxFJtc9BX8yUFhutfjaM+cCaAP+A64h5xVJ2qusmSvDd6KieLJm
        5RNn/ASkrTUHnt4ZfO8gtDJhMOkwMpKdclgMx6e8FQ==
X-Google-Smtp-Source: AGHT+IHPaIO4FZQQUgcCagLrdno/prKFPjefmt9O/XHrjrH4UUIZ2xFroktRxa6d4bksnAf1hANZGczmFQi2ZOdIueE=
X-Received: by 2002:a0c:f547:0:b0:63c:fbd0:6361 with SMTP id
 p7-20020a0cf547000000b0063cfbd06361mr9120163qvm.37.1695052283895; Mon, 18 Sep
 2023 08:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230914131225.13415-1-will@kernel.org> <20230914131225.13415-2-will@kernel.org>
In-Reply-To: <20230914131225.13415-2-will@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 18 Sep 2023 08:51:13 -0700
Message-ID: <CAKwvOdmJa5WFLw=YZWAEu=o+3dkUgVNrwNWDZLC=k2Be=Bcy3Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] scripts/faddr2line: Don't filter out non-function
 symbols from readelf
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
> As Josh points out in 20230724234734.zy67gm674vl3p3wv@treble:

Perhaps a suggested-by tag would be appropriate then? Next time.

>
> > Problem is, I think the kernel's symbol printing code prints the
> > nearest kallsyms symbol, and there are some valid non-FUNC code
> > symbols.  For example, syscall_return_via_sysret.
>
> so we shouldn't be considering only 'FUNC'-type symbols in the output
> from readelf.
>
> Drop the function symbol type filtering from the faddr2line outer loop.
>
> Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> Cc: John Stultz <jstultz@google.com>
> Link: https://lore.kernel.org/r/20230724234734.zy67gm674vl3p3wv@treble
> Signed-off-by: Will Deacon <will@kernel.org>

LGTM; thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/faddr2line | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/faddr2line b/scripts/faddr2line
> index 0e73aca4f908..a35a420d0f26 100755
> --- a/scripts/faddr2line
> +++ b/scripts/faddr2line
> @@ -260,7 +260,7 @@ __faddr2line() {
>
>                 DONE=3D1
>
> -       done < <(${READELF} --symbols --wide $objfile | sed 's/\[.*\]//' =
| ${AWK} -v fn=3D$sym_name '$4 =3D=3D "FUNC" && $8 =3D=3D fn')
> +       done < <(${READELF} --symbols --wide $objfile | sed 's/\[.*\]//' =
| ${AWK} -v fn=3D$sym_name '$8 =3D=3D fn')
>  }
>
>  [[ $# -lt 2 ]] && usage
> --
> 2.42.0.283.g2d96d420d3-goog
>


--=20
Thanks,
~Nick Desaulniers
