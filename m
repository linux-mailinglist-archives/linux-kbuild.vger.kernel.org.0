Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70DA7520735
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 May 2022 23:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbiEIV7U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 May 2022 17:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbiEIV7F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 May 2022 17:59:05 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D294F2725D7
        for <linux-kbuild@vger.kernel.org>; Mon,  9 May 2022 14:52:57 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f16645872fso159932107b3.4
        for <linux-kbuild@vger.kernel.org>; Mon, 09 May 2022 14:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LglPYsJyh/Qh1FDu94XGq/MV3fomSZvl10mHqijKUDo=;
        b=Mmprp3lzuQ9S3U5gBRl4SSYLlSOiIHLBvkcz5iOM/dqvawddalywuHly3fYkYSta8a
         /wHH97/JwQuaJpGbSbc8YAh/70zYOA45R/uKi8HnO1a2FSGw1hEO80O8h+7YS8CvTNy/
         Euq2/8lKMsPIykCcaR4MuOWPN6ENvIUCu3LU2TT18vptardX8ldDEZoc6ReZ3taS3hlH
         ppaK1jD3PGKIDopg2Ag16lSA/ACo6BplIpJZzarADCnbXO9GoV38XDz5xn7QDtvn169K
         iMBMjnNR/3DlG0wrr7uwC6BKfn+gNjtsaTLfXV1sdAvCLbMqgxZewCokViv9D/I9eVdh
         91qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LglPYsJyh/Qh1FDu94XGq/MV3fomSZvl10mHqijKUDo=;
        b=DNTFmAqTEXsd6MgQrV/1wST3veGmTnKbFvBLC3/Uqde1awDZ2SSM8jtOgYsuwUag6u
         xSOj7wgUFpFaKSeoroTogI0UtLDKC5BKI3KedU3LcjdJn7L9opApT3iGnQ2xbZvAuAGq
         UV46eAWUWoNfCJ5V12mWwTTBM98MWp6M3bleSTDx/U/xSkWLZd7YskWV/q/DqOYf3DmC
         iINbUCMZb1GjXQ+P1G3H81g1qVUwXOQ0oi/ZUG8HcljTR1tL0fpm8Ccz9Q2S4Kb+obnU
         vT0iB2ZZOHHCwYjvZQAIT7Y2TToCquXL9GuQTdPUZ3Ke4JOt6vQPSNgDdBE92mbH+2Wb
         17Gg==
X-Gm-Message-State: AOAM531W56mN7eqTRPIJg/OBpoDfKelTz32kc2n2XfKNk1xfnyCfnh43
        kCz1EXw+teAXS5NYV7yzQtaXO01KyUISrGhruHveJA==
X-Google-Smtp-Source: ABdhPJxS9tOjdEtMe9p7ieQ7qesYkE+zdDxRJCQOrQnBBXsYJfCE0f7NGG8AtIWCus/riFP6yEy8E50WALQb9P5JyvY=
X-Received: by 2002:a05:690c:13:b0:2e4:da22:27d9 with SMTP id
 bc19-20020a05690c001300b002e4da2227d9mr17078815ywb.298.1652133176908; Mon, 09
 May 2022 14:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org> <20220508190631.2386038-6-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-6-masahiroy@kernel.org>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 9 May 2022 14:52:21 -0700
Message-ID: <CABCJKucG4dOLm9pPWrACc+YReBXG4GNM9V0djsy0YTp8pRGmaw@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] modpost: extract symbol versions from *.cmd files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules@vger.kernel.org, linux-s390@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 8, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Currently, CONFIG_MODVERSIONS needs extra link to embed the symbol
> versions into ELF objects. Then, modpost extracts the version CRCs
> from them.
>
> The following figures show how it currently works, and how I am trying
> to change it.
>
> Current implementation
> ======================
>                                                            |----------|
>                  embed CRC      -------------------------->| final    |
>        $(CC)       $(LD)       /  |---------|              | link for |
>        -----> *.o -------> *.o -->| modpost |              | vmlinux  |
>       /              /            |         |-- *.mod.c -->| or       |
>      / genksyms     /             |---------|              | module   |
>   *.c ------> *.symversions                                |----------|
>
> Genksyms outputs the calculated CRCs in the form of linker script
> (*.symversions), which is used by $(LD) to update the object.
>
> If CONFIG_LTO_CLANG=y, the build process is much more complex. Embedding
> the CRCs is postponed until the LLVM bitcode is converted into ELF,
> creating another intermediate *.prelink.o.
>
> However, this complexity is unneeded. There is no reason why we must
> embed version CRCs in objects so early.
>
> There is final link stage for vmlinux (scripts/link-vmlinux.sh) and
> modules (scripts/Makefile.modfinal). We can link CRCs at the very last
> moment.
>
> New implementation
> ==================
>                                                            |----------|
>                    --------------------------------------->| final    |
>        $(CC)      /    |---------|                         | link for |
>        -----> *.o ---->|         |                         | vmlinux  |
>       /                | modpost |--- .vmlinux.export.c -->| or       |
>      / genksyms        |         |--- *.mod.c ------------>| module   |
>   *.c ------> *.cmd -->|---------|                         |----------|
>
> Pass the symbol versions to modpost as separate text data, which are
> available in *.cmd files.
>
> This commit changes modpost to extract CRCs from *.cmd files instead of
> from ELF objects.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

This looks good to me, it's great to get rid of the .symversions files!

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
