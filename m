Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F4C34655A
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 17:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbhCWQgb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 12:36:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233384AbhCWQg0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 12:36:26 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AACC061574
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 09:36:26 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so1301670pjb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jr5FYe+pG7gGnI4NPChSWjNH7YK3vC58byQZ9zBCWWU=;
        b=caAT+/Y9z99z7OziYrIiQW7A6ptvfmUjhEbqmQZe0FcRaY9XV/8gPNXGbDmAG1rdvA
         9k+70Y8IfxUHr/jvMlz6wPkyBvuV4G6m1LjGUy+aa5fK8oIKIkmlV3KU4XomXsbFkrhu
         Ztvi7Dajdxgx7c/Rz4jV6AuQV7gbrSM4hTOVp5MwX0hzujzuDozddcuO5jFXPwQZRk8T
         MYQCceXDwzEPlHdUy6DbvCAl6a/O7zH8RROqeSK+pmTQjkqkDalt9iYfaHusQ4f/F2sm
         QUtsQ+tuk7q5kaRpucPhtRY3PsiKVOnB62/6LJLARPX4iQYQoP45G/AUWUH3JS0Y3T3J
         S+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jr5FYe+pG7gGnI4NPChSWjNH7YK3vC58byQZ9zBCWWU=;
        b=qFdQyPorXkUw9NhF/xZHzrk3/fBFAKRrTT2Q2hECVSDEn2UAYwETbaRNKAaoH3eD9S
         ypB55QaWybGz+bOdA8j4EIOtTWLQVifSMheUec/rY5eiuQ8zdTz4F6F4VMsmMXwU2/DV
         RZL1Oz9w6MfOp/bPjT/ddWQW/r6VamIaHZrfGkuicudtd8EJVOm1BxAi2IPuEETCcVc6
         JWTa4mplJWV0uBKjHyu5YuoMdQ9xslM/k1DykiEGr+Uk8C81HEypV26LBfisIRJAYp3l
         LqiMkCtLs4FuGp82C7uju9uLuC98w6tNY5OOKhwp8gMg62SfQxs2j84Puqt/Nv+83DSr
         MPeQ==
X-Gm-Message-State: AOAM532YowhZSXm1A3L7QvSmH9u/xZ1IKTTcsp768RVS9ooxjSzw+9yF
        Y8NFVAZUFaQF35noNo8Rbxb8Eg==
X-Google-Smtp-Source: ABdhPJwLzUDt5195FT4M+X2qSUsLAl+MyqeKnk4dGBkDB29Fvu6e0osZ5t6H5L1RRVyf9Lteh2azzQ==
X-Received: by 2002:a17:90a:c087:: with SMTP id o7mr5353039pjs.38.1616517385469;
        Tue, 23 Mar 2021 09:36:25 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id c24sm17595799pfi.193.2021.03.23.09.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:36:24 -0700 (PDT)
Date:   Tue, 23 Mar 2021 16:36:21 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: Merge module sections if and only if
 CONFIG_LTO_CLANG is enabled
Message-ID: <YFoZBY1SqilWAmx4@google.com>
References: <20210322234438.502582-1-seanjc@google.com>
 <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> On Mon, Mar 22, 2021 at 4:44 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > Merge module sections only when using Clang LTO.  With gcc-10, merging
> > sections does not appear to update the symbol tables for the module,
> > e.g. 'readelf -s' shows the value that a symbol would have had, if
> > sections were not merged.
> 
> I'm fine with limiting this to LTO only, but it would be helpful to
> understand which sections are actually getting merged here.

It doesn't appear to matter which sections get merged, the tables only show the
correct data if there is no merging whatsoever, e.g. allowing merging for any
one of the four types (.bss, .data, .rodata and .text) results in breakage.
AFAICT, merging any sections causes the layout to change and throw off the
symbol tables. 

> Are you compiling the kernel with -ffunction-sections and/or -fdata-sections?

I tried both.  Default off, and forcing those flags by hacking the Makefile had
no effect.

> Does this issue only happen with gcc 10?

gcc-7 shows the same behavior, I haven't checked anything older or anything in
between.
