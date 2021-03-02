Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D8B32B04E
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239360AbhCCBgh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351134AbhCBWKv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 17:10:51 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 785FFC061793
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Mar 2021 14:09:16 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a17so26037978ljq.2
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Mar 2021 14:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2BdA81m+7VN+qviulnFkbFU7BcgALjMUUHbqorkGRo8=;
        b=WsYz8n3peJ7kIi0io9tCQIhEuNIC4rbZinEygyAB3gyWr2PbjWuoCnrNcL+oDCkJX4
         D/AwNIX3pC3siEGIJ/HS0jeoF7dSsAyLDYuTCVG64KzlXlo+5rdrJcfOMHhD1qW7yxQ5
         EKdPONHWw5wpyRwpUeDxA5Pp8CScLw6TA+vAepMHPU5Xxekm3bJVhrIYNj4sIZcXuzdG
         iZHEnHzlRXZnn2QhA3nW2l85nhFvGI5IPdO33i8YC4jFDbBdnsKazSPxI5N/B93Txb7C
         Jv7t/kAwK1my77JPDUuLdIXzmlKXSA6iG4nvQeMFIHJ2UIEwsh7cD5nMpjHBBbZo7UI3
         Y3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BdA81m+7VN+qviulnFkbFU7BcgALjMUUHbqorkGRo8=;
        b=gfaJ+VmVzw3q7XVWOBuckM3C51MJgAAVj1knkQXAoIc9ketIVpiHBQEIsRxc76C0YC
         kKgsPS/0Ux92LBb4YJL8p7XlkFX+ERgj2s5/N6EF5JgX0ormv8ptIKZK/U6ehiEP36Hi
         w3951Vgi/yTsFIvy0GUtLWhFlxLx+oXf6naLVHahSq1ogt7rMHczdrNwqMLmJibFjx3i
         3ZtPmYkpHhDoydXGiyjQaGtutP7jvSo9G0RN8GASx1n0imyfvBVCdTpa/J8JZ++PzXjp
         ycLtC+gvrS/A+y3T5dH63bHhjVZ0IRhDYc9NkYKVQWD4EdJdYHdcQXx/p6u6NhDdsLsx
         RS8Q==
X-Gm-Message-State: AOAM530gtxwP8MZ+QuCCtaoxD8Mdxy/f1RXNFbNFTCzsAPdNpOtKmCRc
        a6Ts44u7ZpN5Z1vVQMXObcnMqHA0QNp1VjaM/jhLyw==
X-Google-Smtp-Source: ABdhPJzOMRBxvCOCHjHJWr2gSnmjRfJPyHwrPdl/9dG/ul/C330WFSI+UtZGm/U0fn1S1kka1hJi7DGZx/ju6ztdHIw=
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr984745ljh.244.1614722953496;
 Tue, 02 Mar 2021 14:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <20210302210646.3044738-2-nathan@kernel.org>
 <20210302220252.ulvlsfyp4ordwrky@google.com>
In-Reply-To: <20210302220252.ulvlsfyp4ordwrky@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 2 Mar 2021 14:09:01 -0800
Message-ID: <CAKwvOdmR_p-zbrTUmbObmCVKBcuNLpg_V3NqLeYsEK4xNHfYOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: Only specify '--prefix=' when building with
 clang + GNU as
To:     Fangrui Song <maskray@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 2, 2021 at 2:02 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2021-03-02, Nathan Chancellor wrote:
> >When building with LLVM_IAS=1, there is no point to specifying
> >'--prefix=' because that flag is only used to find the cross assembler,
> >which is clang itself when building with LLVM_IAS=1. All of the other
> >tools are invoked directly from PATH or a full path specified via the
> >command line, which does not depend on the value of '--prefix='.
> >
> >Sharing commands to reproduce issues becomes a little bit easier without
> >a '--prefix=' value because that '--prefix=' value is specific to a
> >user's machine due to it being an absolute path.
> >
> >Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>
> Reviewed-by: Fangrui Song <maskray@google.com>
>
> clang can spawn GNU as (if -f?no-integrated-as is specified) and GNU
> objcopy (-f?no-integrated-as and -gsplit-dwarf and -g[123]).

But -g get's set via CONFIG_DEBUG_INFO and -gsplit-dwarf by
DEBUG_INFO_SPLIT.  So if we say:
$ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang LLVM_IAS=1

So cross compile, use clang, use the integrated assembler (ie. with
this change, don't set --prefix), with either of the two above
configs, which objcopy get's exec'd?

>
> With LLVM_IAS=1, these cases are ruled out.



-- 
Thanks,
~Nick Desaulniers
