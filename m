Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A78D4CAE7F
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Mar 2022 20:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbiCBTTJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Mar 2022 14:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234958AbiCBTTH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Mar 2022 14:19:07 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AF812AD7
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Mar 2022 11:18:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id w27so4511004lfa.5
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Mar 2022 11:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VeHPbYUmDQhwRvLDR7SEcUbulwlYPwQ9kvkyCVmk6Cw=;
        b=Rz6tM8IHWtmgttApx6BQXB7nieWceAqjNI2q3DfeSvnaQJSxpDT0ODHPnt+x613KVn
         sNrtExKe2lavT0wn5a0zIgIXpCH2KtVD64NdWQ6FYfu/AZDQc03Doz/F9aIOw9GibMYE
         bndEBVlQUsbr3AmnJE01ivzb96YDeKZk3/xbs9wPClplCgN2INNCA7VRfb0lIWcUQTMu
         IhmZ1TjSkUz2MxAaXkP2QHUBhw7PtukHeUuez09hAnjFlppbanVdfKHHi7GM9bIFHuTa
         ZmFkzkQFF8L0u8PePaQ/oHLdEYdscE21liiS64teesMBTmkzOtnzryx7isr1vS8o4BCu
         89tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VeHPbYUmDQhwRvLDR7SEcUbulwlYPwQ9kvkyCVmk6Cw=;
        b=dT+PRHWYvwZOS6euMUKzmyqtWj6BpVQnyAHKFSDFtfmySJwEPDngnnKF5gH7TBEKzv
         jQxDCSIUp5No815/BE02mJBY6U6SJMxP5hd/1uwAxi9VvMhx1YNCYK0UuF1jKz/zt0DH
         RurJpblyzjjE9tNMpn/8fmtSryMFJJG/asusNIg3C0kdg3/bSs30WyiZ1iJPiIx46fZl
         db0t3b14bjz9mXuX/1dozIXsVqw+Qb7Osnbjg/KKC96x/I27iMcHcRZp8+i7q46C0dMa
         hyMhZMclIygxD+HA1dapJaBHhyOHyc+SlWXkJ/PtWx9sBFSBYAvZBlYjAf49H/r14+NI
         ZHtg==
X-Gm-Message-State: AOAM5339mmNbBnVqGBWTQHmlVdBeYLN0dVnorCAygHVG6BMw1zg8itLu
        z3py0CURtrlg+6eSE5RYXq1O71EMS+HUl9XQKJ54FA==
X-Google-Smtp-Source: ABdhPJzRvLSkr1+M7JPctvNy8x2Fc5YVU61qF2BkXtYbK0MwUxxB/LYCV47mAc7jqfVU0UlWeSGdxXi79ClgbxfgeZU=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr18699297lfd.190.1646248699637; Wed, 02
 Mar 2022 11:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20220224145138.952963315@infradead.org> <20220224151322.072632223@infradead.org>
 <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com> <Yh+dMJsH+ZMPfqwD@thelio-3990X>
In-Reply-To: <Yh+dMJsH+ZMPfqwD@thelio-3990X>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 2 Mar 2022 11:18:07 -0800
Message-ID: <CAKwvOdmouBTe5pH3JoP6EEfwNT5=6WvX3oCEZRxO0Dkf38S14w@mail.gmail.com>
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
To:     Nathan Chancellor <nathan@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, keescook@chromium.org
Cc:     x86@kernel.org, joao@overdrivepizza.com, hjl.tools@gmail.com,
        jpoimboe@redhat.com, andrew.cooper3@citrix.com,
        linux-kernel@vger.kernel.org, samitolvanen@google.com,
        mark.rutland@arm.com, alyssa.milburn@intel.com, mbenes@suse.cz,
        rostedt@goodmis.org, mhiramat@kernel.org,
        alexei.starovoitov@gmail.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-18.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 2, 2022 at 8:37 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Mar 01, 2022 at 01:16:04PM -0800, Nick Desaulniers wrote:
> > As per our previous discussion
> > https://lore.kernel.org/linux-kbuild/CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com/
> > I'm still of the opionion that this should be solved by modifications
> > (permanent or one off) to one's $PATH.
>
> However, I think we could still address Peter's complaint of "there
> should be an easier way for me to use the tools that are already in my
> PATH" with his first iteration of this patch [1], which I feel is
> totally reasonable:
>
> $ make LLVM=-14
>
> It is still easy to use (in fact, it is shorter than 'CC=clang-14') and
> it does not change anything else about how we build with LLVM. We would
> just have to add something along the lines of
>
> "If your LLVM tools have a suffix like Debian's (clang-14, ld.lld-14,
> etc.), use LLVM=<suffix>.

"If your LLVM tools have a suffix and you prefer to test an explicit
version rather than the unsuffixed executables ..."

>
> $ make LLVM=-14"
>
> to Documentation/kbuild/llvm.rst.
>
> I might change the patch not to be so clever though:
>
> ifneq ($(LLVM),)
> ifneq ($(LLVM),1)
> LLVM_SFX := $(LLVM)
> endif
> endif
>
> [1]: https://lore.kernel.org/r/YXqpFHeY26sEbort@hirez.programming.kicks-ass.net/

I'd be much more amenable to that approach.
-- 
Thanks,
~Nick Desaulniers
