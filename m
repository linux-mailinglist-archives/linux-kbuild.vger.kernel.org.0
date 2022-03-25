Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A414E7DDB
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Mar 2022 01:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiCYRaM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Mar 2022 13:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239565AbiCYR2t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Mar 2022 13:28:49 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944C8FD6E4
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Mar 2022 10:27:11 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id a1so11777666wrh.10
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Mar 2022 10:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nTY6GWR33LHIYWWg3yO+Y770hJAr0sFM8vC8Hv97/Ho=;
        b=GTDYFnJ644kX2MgLtEY12KufCCj4yd/pS8r3hmYl3rs0CyI13At6qv069iToU8EJCn
         SuaIaEQOqSO+6hJN9H72YJVHpZ14Vi6pCeucZweYUhIsb3243hF3vwcX84SXcCZDGsCO
         5ZHnaXRtLKQgaTtZv/R8DB79i1EpD7Opusb1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nTY6GWR33LHIYWWg3yO+Y770hJAr0sFM8vC8Hv97/Ho=;
        b=Vlv6bf8J16cTZpoZvdyqweYq8wLgtxFpRUXhwQjXqO/nWuX4N/34ukKgxbp9n5zQgC
         MnEPHtIssewdKMzUNwNM0REBTMnZpXkIpFtnLzdBKRyAYcp7MSmiJNAGtWWSrwdrsqvz
         G09oBPxKQMgQhc2IpWT/z0epXanixKUPfK0bN27wwFGpb2216wCa/4/BzDJVtR25svoc
         bl3QI1XP0uBGGBspklLmaHKX83FKufT5VcQ12qTm0qiJnbDSkgMcboPQvmL3tuvaPKf1
         dXEFUq1TqvCAYNyHpMNQwRqtNatrjvyfN+ghPy2OJAAnCFLl0d5fOtDBRZqV/My5syJs
         b5ew==
X-Gm-Message-State: AOAM5332r4rEcuLBgMRcXAdtkmji5LRdsEENCFVbWCCPEOa82nqLQfqg
        ZgN1teNPPlSGuUvhRpWSczNjrUHWGEmqrPLVJFw=
X-Google-Smtp-Source: ABdhPJxnuAUz23jPtkANWipXf6CrX55dfRvTBRhq1Vy/CIOG5XF9nL5+yuaYBAHpKkueLJDG1ii1Kw==
X-Received: by 2002:a2e:b534:0:b0:247:f015:ad5f with SMTP id z20-20020a2eb534000000b00247f015ad5fmr9027119ljm.309.1648228703824;
        Fri, 25 Mar 2022 10:18:23 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id p2-20020a056512328200b0044a2d3f889fsm763671lfe.293.2022.03.25.10.18.22
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 10:18:23 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id q14so11138467ljc.12
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Mar 2022 10:18:22 -0700 (PDT)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr8705328lji.152.1648228702287; Fri, 25
 Mar 2022 10:18:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220325131348.3995-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220325131348.3995-1-andriy.shevchenko@linux.intel.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Mar 2022 10:18:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLZC4d-JjoDyJ-0_JNX+nOnkTQdTGKvOE3fBVNvAq-xw@mail.gmail.com>
Message-ID: <CAHk-=wgLZC4d-JjoDyJ-0_JNX+nOnkTQdTGKvOE3fBVNvAq-xw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] Makefile.extrawarn: Turn off -Werror when extra
 warnings are enabled
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 25, 2022 at 6:13 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> +#
> +# Turn off -Werror when extra warnings are enabled
> +#
> +ifneq ($(KBUILD_EXTRA_WARN),)
> +       KBUILD_CFLAGS += -Wno-error
> +endif

NAK.

If you enabled CONFIG_WERROR, then you get CONFIG_WERROR.

If you enabled W=1, then you get extra warnings.

If you enabled both, then you get extra warnings and they are errors.

This patch is just stupid.

              Linus
