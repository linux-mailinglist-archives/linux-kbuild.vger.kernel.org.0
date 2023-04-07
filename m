Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46AE96DB52F
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Apr 2023 22:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjDGU0K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Apr 2023 16:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbjDGU0J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 16:26:09 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55A361BA
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 13:26:05 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id q2so4758867pll.7
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 13:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680899165; x=1683491165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Qml57ez/12DBtRR0XUBgkJY5NbIgppt8GcAw2X+wm0=;
        b=jlgKUkeNPYv1Sx63l6pSLH05wzmw2SWFRyWDkpSerSMRZzUnhFrk8FOzW6ty1OTs6L
         aXSBgLux/7ZwSrneXsDFZbbiYQiPP7OI6g6m/MGb2unwyuEkTzzkg2QAUr6ogIjeJ7Lp
         Cjl59RvTqPlFUCfxWUu4a2KyiSqwC7yD8tkQlaGOgCeHily1ZCjmq5zx2dFUtkAQkyt2
         ofNSaKqyJH9oQKNCgW2JfziuzJmVEo0BaqKZSLKnhzVMBPgVXX6aNSNhnj+tnBF9Zl4x
         L4vMjrmtrsI5lWBuKo+P48RflUkXdUbdnIEVuPhiUHdfNt4HZo/63R5Kglb1f75B6G8T
         wG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680899165; x=1683491165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Qml57ez/12DBtRR0XUBgkJY5NbIgppt8GcAw2X+wm0=;
        b=X7bMYh6o2IimLxY4irpHG4YK1o4B9ZfGXVe6kFVonxI6S5Oa10pbrXr3Bj1vFyC5iW
         99GH4CeVcg7uy1VCDDir2zqWvKmV9jGEaK984wNgjNYnoUDY07wchR22rJ16Qw/KYMJq
         eaqWVuhimeZKDMGVGwX+hMXfbYAewbHUwLOlKT1phZ3YHRcEePfwgOYjFRAmbh+ZtA7n
         H6bW1tDAnvRYE4EpP3reWJUPNCFijDjl6Itzlg5EV+dYP8wljtNyGHlqRHDTTy6FpepE
         SULT5yGjeX0O/tMWCqarHv0Ic/e8FmaXoTYcHitK4blQ8sRFFF90BgKRfmsxnBYhFxcW
         X7/A==
X-Gm-Message-State: AAQBX9c9BWQjjqkFiFCO1vLp7ZMDddhsdoJW+Wl2Z3psYRY5qaVkLqhM
        HKwA0tpt68+fTSovN4f8+Cbnu9G4Hb3NBTP0obIjpA==
X-Google-Smtp-Source: AKy350aM6xwPlVLA5rPYKoB5RhjF3PEYNPlYrCd4ZkeeIS0YPdjjoUxwDWIT0Z1yKwTOSaz5gJVMKt7qI9B2Hn4F8Ks=
X-Received: by 2002:a17:902:a50b:b0:1a2:6e31:73cb with SMTP id
 s11-20020a170902a50b00b001a26e3173cbmr1247076plq.2.1680899164994; Fri, 07 Apr
 2023 13:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230308115243.82592-1-masahiroy@kernel.org> <20230308115243.82592-8-masahiroy@kernel.org>
In-Reply-To: <20230308115243.82592-8-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 13:25:53 -0700
Message-ID: <CAKwvOdmdKo-ZtUZH=4R1G9DgxoRaWa_peyx_uHHKYqFXbuKeBw@mail.gmail.com>
Subject: Re: [PATCH 8/8] scripts/kallsyms: update the usage in the comment block
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Luis Chamberlain <mcgrof@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 8, 2023 at 3:53=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> Commit 010a0aad39fc ("kallsyms: Correctly sequence symbols when
> CONFIG_LTO_CLANG=3Dy") added --lto-clang, and updated the usage()
> function, but not the comment. Update it in the same way.

I'm surprised to not recall that commit.  Was our mailing list cc'ed?
Looking at https://lore.kernel.org/lkml/20221102084921.1615-4-thunder.leizh=
en@huawei.com/,
it looks like "no."

Zhen, Luis, please make sure to use scripts/get_maintainer.pl when
sending patches.  You can put Cc: below the fold of the commit message
in the patch file even when sending a series and git send-email will
use those just for that commit.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kallsyms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 937900823fa8..0d2db41177b2 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -6,7 +6,7 @@
>   * of the GNU General Public License, incorporated herein by reference.
>   *
>   * Usage: kallsyms [--all-symbols] [--absolute-percpu]
> - *                         [--base-relative] in.map > out.S
> + *                         [--base-relative] [--lto-clang] in.map > out.=
S
>   *
>   *      Table compression uses all the unused char codes on the symbols =
and
>   *  maps these to the most used substrings (tokens). For instance, it mi=
ght
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
