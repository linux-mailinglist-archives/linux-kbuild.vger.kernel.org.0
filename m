Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F373B76BAF6
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Aug 2023 19:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjHARSS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Aug 2023 13:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbjHARSR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Aug 2023 13:18:17 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903FC211E
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Aug 2023 10:18:16 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6bca7d82d54so1666085a34.3
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Aug 2023 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690910296; x=1691515096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lVeKq7FzrA8zpaWVb8WBRY41fSXAU8sM5RKZuACP/E=;
        b=oZV13r92MVDAp5Le6pcqZhs+Cx194TWvATG0jqNsJiWAlOebdfvMW8qY7WqsSVUKhr
         bA5iwvXzaO3M0RJIoREZKCqGpaebvOWUoqXgGtNmOFLRfXv4TYpdt6IEdO+ooAZgHa8R
         +Rh+R5OLgya8ckaTfj3i5Y+SzJybZJ/XCa6CR+s2h/j9VzgSmyLdrFlFc59pjjXIRrbB
         LtE6gt3NgxzXXP9KYKML+RjAoJ383eDOO/K6bb1m9V0oP01UduJjkdnxIlzm/8hQr5jG
         ok1TFOOrzIbCqXwi8/XPZFg1d5LbDGWh+ZhWeHN/HINI5Xsm4lq+WX8POytOFQ9/3Obp
         P5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690910296; x=1691515096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lVeKq7FzrA8zpaWVb8WBRY41fSXAU8sM5RKZuACP/E=;
        b=BU3Rl8FEqI+pcrRdYDE1Gfw0xEeRHBojARv7wmQja7thuRgUrft8xCXLGh7XRoW7av
         M/1p4Z3fHMOGRRc5xqYxaLKICGL7pPNTRWAfxO+UzJKVBoZVPVCeFqPs/eQjOoW6O7Ak
         zSGI4QbNnkff2JnTADYhCSw2UrmFTd/mWKgYxsKVkEv25QtBQQdttB0DW1ahvATEMche
         BSiyizJbHbTR9/UQ9ShsG6cZgawXve/alND+CmSbCW8XpUI0t5grDtC6ntmq0oJZjVoh
         W5d5Fsz+DiSvU/4VcPFom2h5GuGAkClxgQfIa+DYFgU0I/OCQc883XAiRCLeV3PRABSE
         4Zhg==
X-Gm-Message-State: ABy/qLZc0JybwSadBQzU03Oi2ZO6psPt3Uq6beUI/NGMlfDcvoFc6N1z
        u2I8alfEQtmb+INmePHvzYbcrTK9G3h8oUWpRNu7lQ==
X-Google-Smtp-Source: APBJJlH28E/XfL7JZrm7ZeIynJrP1Sh3tHyJVBOaUxj3H5FfAq1biNm4w1Wy+tLu2K6GHIXmKjv3/UZtWZDl1raA7Yg=
X-Received: by 2002:a05:6358:60c7:b0:139:d5d5:7a8f with SMTP id
 i7-20020a05635860c700b00139d5d57a8fmr3371801rwi.30.1690910295394; Tue, 01 Aug
 2023 10:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230728113415.21067-1-will@kernel.org> <20230728113415.21067-4-will@kernel.org>
 <CAKwvOdnPWL7ts0PC_NxqxZZRgaT=WLZGQQ-3cVii-jG5GCNjfw@mail.gmail.com>
In-Reply-To: <CAKwvOdnPWL7ts0PC_NxqxZZRgaT=WLZGQQ-3cVii-jG5GCNjfw@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 1 Aug 2023 10:17:38 -0700
Message-ID: <CABCJKueCWThVG9sBhWppHTUiuxinXf0MO6-MsMnmMTG6tv_j0Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] scripts/faddr2line: Constrain readelf output to
 symbols from System.map
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kernel@vger.kernel.org, kernel-team@android.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        John Stultz <jstultz@google.com>, linux-kbuild@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 1, 2023 at 9:42=E2=80=AFAM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Fri, Jul 28, 2023 at 4:34=E2=80=AFAM Will Deacon <will@kernel.org> wro=
te:
> >
> > Some symbols emitted in the readelf output but filtered from System.map
> > can confuse the 'faddr2line' symbol size calculation, resulting in the
> > erroneous rejection of valid offsets. This is especially prevalent when
> > building an arm64 kernel with CONFIG_CFI_CLANG=3Dy, where most function=
s
> > are prefixed with a 32-bit data value in a '$d.n' section. For example:
> >
> > 447538: ffff800080014b80   548 FUNC    GLOBAL DEFAULT    2 do_one_initc=
all
> >    104: ffff800080014c74     0 NOTYPE  LOCAL  DEFAULT    2 $x.73
> >    106: ffff800080014d30     0 NOTYPE  LOCAL  DEFAULT    2 $x.75
> >    111: ffff800080014da4     0 NOTYPE  LOCAL  DEFAULT    2 $d.78
> >    112: ffff800080014da8     0 NOTYPE  LOCAL  DEFAULT    2 $x.79
> >     36: ffff800080014de0   200 FUNC    LOCAL  DEFAULT    2 run_init_pro=
cess
>
> Sami,
> Should we change the llvm-ir linkage type for these symbols from
> `internal` to `private`?
> https://llvm.org/docs/LangRef.html#linkage-types
>
> Then they would not appear in the symbol table.
>
> At first, I thought other modules might need to directly reference
> this data, but with the local binding, I don't think they can.

For arm64, we don't explicitly emit symbols for type prefixes (see
AsmPrinter::emitKCFITypeId). These mapping symbols are emitted by
AArch64ELFStreamer to mark data and code regions. According to the
AArch64 ELF specification, "All mapping symbols have type STT_NOTYPE
and binding STB_LOCAL," so I assume changing the linkage type isn't an
option:

https://github.com/ARM-software/abi-aa/blob/main/aaelf64/aaelf64.rst#mappin=
g-symbols

Sami
