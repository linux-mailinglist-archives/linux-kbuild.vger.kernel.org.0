Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F82259088C
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Aug 2022 00:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236127AbiHKWEp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Aug 2022 18:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbiHKWEo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Aug 2022 18:04:44 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49EAC95680
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 15:04:43 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id j3so13438188ljo.0
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ClZkoO2gn+DuUwd5gSUHUhC51CqF9F+Etb4xaf+Veuw=;
        b=ECo/2V/B4Jxi39vXhbgAVoVni5Tl4lyXTJNAbps09XA4bYPzvhGFjOKvONZm7PPno9
         Vm9jA1szyjrbyO/z2+hFDQDt26sb2UM5FbHYOwuWbVm7fRYl1rDxnoJeah8VdQdiNF5I
         WYn5UCPS6aaPj+h8JTcPaxzffePTgkkFV5C8rPfUBgA4aiv1Ef+Zj2+din/8of1nxhG8
         4ZsW0bjoqKS0LHrwifjKx+2dMYV19bb6d48eURgEzHM1vMgiessUYX8m+7gv7Y/1vz6c
         c9cZCB8Agjs6rqOon1Vka2Mh2nXDbuKvYgMXPQ/zbLG2VaJYHOLt/zjUuk5I6msuwlfv
         0rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ClZkoO2gn+DuUwd5gSUHUhC51CqF9F+Etb4xaf+Veuw=;
        b=LBmvutjf3KolCcK+6ZV/nPka4BqK6JDWOA+uEPol4r0w7nYfOgt6xGSWdx2Gwc/zTf
         Z14lMOSklTeJIQyjqZPFqAuQk/FVtgBL6XQn/rEU4trooSyJj2Jz8bA5Id8sfUV+0fUg
         t8Q1B6QGJR1Bd6qn66zLo7PV8hzau1r5IJQOqkeQYoMGRyNPS5QbE0BtH/yWIDk5Wso/
         xVjHZkop9ZFkB3HMKyYeqtsrH1HBQQaTclsA66/9lC3E16ZR/myOhLXXrVbAu5yLmRWi
         tQnzv09uB+7bxB/uzF+Hgu3x7U8/wmJjYeUenCfI0hov0qwmEirUx79YKarZWVDk9hAZ
         ZqWA==
X-Gm-Message-State: ACgBeo0G4ujO+7775+epu1vV/WgcA2Zj+kN2iXnJMoUdlIMuOF/IFfOu
        jIba0YMgQBvmhK9qMDGie9ehCCMpwo+nTv2mM5uFGw==
X-Google-Smtp-Source: AA6agR4vdLsL/8BbE8c/lUrun/dyty7m/tzj2+iJcItMzwC2sdqfehgEsYupuwaPy9xzYjaCyDdFP8XXiAFGjr4s3eM=
X-Received: by 2002:a05:651c:98f:b0:25f:e61c:c12 with SMTP id
 b15-20020a05651c098f00b0025fe61c0c12mr327173ljq.26.1660255481412; Thu, 11 Aug
 2022 15:04:41 -0700 (PDT)
MIME-Version: 1.0
References: <YvSxeDkmwxcJL+Z0@debian> <YvUZ+9kJ/AvUMxzO@dev-arch.thelio-3990X>
 <CAHk-=wivP4zipYnwNWCLF5cd24GLs3m8=Sp7M-CmmPva_UC+3Q@mail.gmail.com>
 <CAKwvOdnQjgtwqFXLv+QtWPfpHosM5fxE5oqbX0VUD53F8L6bRg@mail.gmail.com> <CAHk-=wgJA=e-CLcvU5LRKu0bMLeAewXtOM6as1hFVeQAVkMPbg@mail.gmail.com>
In-Reply-To: <CAHk-=wgJA=e-CLcvU5LRKu0bMLeAewXtOM6as1hFVeQAVkMPbg@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 11 Aug 2022 15:04:29 -0700
Message-ID: <CAKwvOdkUc=8DD938in5PMeGYAn3PEWp4E_W8qEHq_y7Smy8+mQ@mail.gmail.com>
Subject: Re: mainline build failure for arm64 allmodconfig with clang
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Joe Perches <joe@perches.com>,
        Nathan Chancellor <nathan@kernel.org>,
        "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux <llvm@lists.linux.dev>,
        Justin Stitt <justinstitt@google.com>
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

On Thu, Aug 11, 2022 at 12:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Aug 11, 2022 at 11:39 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Generally, printing an int with %hhu may truncate depending on the
> > value of the int.
>
> Yes.
>
> HOWEVER.
>
> That truncation is *LITERALLY THE MAIN REASON TO EVER USE %hhu IN THE
> FIRST PLACE*.
>
> See the issue?
>
> Warning about "this may truncate bits" when the main reason to use
> that format string in the first place is said bit truncation is kind
> of stupid, isn't it?

Yeah, I guess adding a truncate to the caller is kind of unnecessary
if you're still going to use %hhd anyways.  What are your thoughts on
this bug I've filed?
https://github.com/llvm/llvm-project/issues/57102

-- 
Thanks,
~Nick Desaulniers
