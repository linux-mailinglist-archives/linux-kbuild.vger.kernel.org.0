Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC7C70C482
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 May 2023 19:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjEVRmm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 May 2023 13:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbjEVRmk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 May 2023 13:42:40 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBF9FF
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 10:42:39 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-623feecfa42so12177286d6.0
        for <linux-kbuild@vger.kernel.org>; Mon, 22 May 2023 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684777358; x=1687369358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdzk2mLaYweHny4kbgA1ybBxwb1zKecZUEGKs5h+c5w=;
        b=ii0zfTBjzE33bSPWSg94a4FvOHVwWsMhE0h2TKZBBjZgkqM7A4TlGuPiMjc/pI9MtF
         2Hn08s4x87iUhyksZfb4PpVLEraNJ2GCObBaEsQVcIRed5TWZmS8UbCoT6tXJa8EImYv
         6Ma9U2qpc4M3yeoTBkuUBqRdIIuZnUPQ75peqA4XUCvKy5o82VmmVBKcKB70grN4o54z
         NH/PfyTrl0r2WSGy0EsBkO1YrVBgsEIO8e8MglXMej9f0msBJq+SQHBRZ6/RkhbVVPDY
         /H+8oU2dw9f2V9zX2a+cwAug5K0knOk5RQHAjzlJ3Bb/mWKUlDb/AA78R51eMeOmPx3U
         4eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684777358; x=1687369358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdzk2mLaYweHny4kbgA1ybBxwb1zKecZUEGKs5h+c5w=;
        b=UR42n0aoZObxNaw3ttP+PTP4DVVJJgr6tG7AKRnlCm+09j4Y7w8UW3IS0QLVx9JIRJ
         W0+SzxJ8qND4YB/1IYnrYjzb+nfsnD9G98MkyIS7272cihPkv5f7x7xxea/F2eEo4tgt
         z4OkkYEulhmRFOj1gUdsEHupaQlU5krDMntAEPGMENdRjbFCjw5SsJ0qpT/IyzLI6oOm
         Ni705L1GtKfPefSWkzXGFCcppiCqEPzWxMAYaC9P8Qxk+5Jz/A1rp1DRxvvOi85d53/j
         EsHHk43xyubTj8WB94PXq2eufK44N0jiu7CnicCFO5SgDrun9WQss20ROOCGVRUaUM4k
         9OPA==
X-Gm-Message-State: AC+VfDyBUscVgmwmYJODbCN5rijupy5swassJMz3yWPvXbAcJyQXGTH5
        7E2+pY/hmCOCf2HpdpV+YHcyvHSkIcOIoBgX+jPpWw==
X-Google-Smtp-Source: ACHHUZ67oRnbqx/ITVOD6VZp8CKV27v4/PAiFpvBnvcsO98ZSCjqS5aj+O53L8RqtQHU5uY3DL7N9rzX/BZJumMSXmU=
X-Received: by 2002:a05:6214:d0c:b0:625:536f:4f01 with SMTP id
 12-20020a0562140d0c00b00625536f4f01mr11238353qvh.11.1684777358321; Mon, 22
 May 2023 10:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230521160426.1881124-1-masahiroy@kernel.org> <20230521160426.1881124-2-masahiroy@kernel.org>
In-Reply-To: <20230521160426.1881124-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 22 May 2023 10:42:27 -0700
Message-ID: <CAKwvOd=Bq2j4-t9VXvNLodcZEM3P_m=z-NSkegR-gbHSr1=qnA@mail.gmail.com>
Subject: Re: [PATCH v6 01/20] Revert "modpost: skip ELF local symbols during
 section mismatch check"
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 21, 2023 at 9:05=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> This reverts commit a4d26f1a0958bb1c2b60c6f1e67c6f5d43e2647b.

a4d26f1a0958 mentions -fsection-anchors which I see used in:
arch/arc/Makefile
41:cflags-y +=3D -fsection-anchors

Though based on the below, it looks like is_mapping_symbol() will
catch this case.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> The variable 'fromsym' never starts with ".L" since commit 87e5b1e8f257
> ("module: Sync code of is_arm_mapping_symbol()").
>
> In other words, Pattern 6 is now dead code.
>
> Previously, the .LANCHOR1 hid the symbols listed in Pattern 2, but
> a4d26f1a0958 was a cheesy workaround.
>
> 87e5b1e8f257 addressed the issue in a much better way.

is_arm_mapping_symbol is gone from scripts/mod/modpost.c. It was moved
then renamed to is_mapping_symbol.  Maybe not relevant for the commit
message, but maybe helpful to other reviewers.

commit 987d2e0aaa55 ("module: Move is_arm_mapping_symbol() to module_symbol=
.h")
commit 0a3bf86092c3 ("module: Ignore L0 and rename is_arm_mapping_symbol()"=
)


>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 0d2c2aff2c03..71de14544432 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1034,14 +1034,6 @@ static const struct sectioncheck *section_mismatch=
(
>   *   fromsec =3D text section
>   *   refsymname =3D *.constprop.*
>   *
> - * Pattern 6:
> - *   Hide section mismatch warnings for ELF local symbols.  The goal
> - *   is to eliminate false positive modpost warnings caused by
> - *   compiler-generated ELF local symbol names such as ".LANCHOR1".
> - *   Autogenerated symbol names bypass modpost's "Pattern 2"
> - *   whitelisting, which relies on pattern-matching against symbol
> - *   names to work.  (One situation where gcc can autogenerate ELF
> - *   local symbols is when "-fsection-anchors" is used.)
>   **/
>  static int secref_whitelist(const struct sectioncheck *mismatch,
>                             const char *fromsec, const char *fromsym,
> @@ -1092,10 +1084,6 @@ static int secref_whitelist(const struct sectionch=
eck *mismatch,
>             match(fromsym, optim_symbols))
>                 return 0;
>
> -       /* Check for pattern 6 */
> -       if (strstarts(fromsym, ".L"))
> -               return 0;
> -
>         return 1;
>  }
>
> --
> 2.39.2
>


--=20
Thanks,
~Nick Desaulniers
