Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A212C92F4
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 00:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388087AbgK3XpZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Nov 2020 18:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388074AbgK3XpZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Nov 2020 18:45:25 -0500
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 078ABC0613D6
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Nov 2020 15:44:44 -0800 (PST)
Received: by mail-ua1-x942.google.com with SMTP id g23so2125uan.2
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Nov 2020 15:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ja5iGBqziMZwVeGBVGC3tNT2ITsfFSrpoAOQrYPIRMQ=;
        b=eIXhFNYrQLrGwHzLPxYGVzWJa/DjXZ3+RK17U4inbSIH8/cLDO1KD8N72OM/zUzB53
         8yZIeDx97sYjz1uuAvgXJWY765o7D+jPAp3RstXWhEiYWpp6ZfWnqW3rRJRO93eLdG7N
         2D9TsLZvw7lNns1x8kWHXquH6wydBNpMO2aUV+NR7F+6FAuRbZwFPyrw1V0DxEKSqnp1
         vdA7qZ099dTy0qixQPzpa9880t8pAmy3P49uy+98kt3oenJTnRXEAx2MWqQdTsTmzPcS
         FKM8rzdiYWV3COU/X3eovPeyZKHokoQStzQObR4NRJfYg5/2ZfrRz9fPrSbgCSdilzFy
         91tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ja5iGBqziMZwVeGBVGC3tNT2ITsfFSrpoAOQrYPIRMQ=;
        b=D5pDgFCdBEIlYGDMWfmcelcOB6x4V0ojmcUvRd7ztuif+sjDgnFk6bzmfapTcz1tut
         9/HQQ/fArV6uj9dE+X+5a+cV6fAzMciP5ioVDpaSDfjf/eBzQJnm2p7sLHz9dswEtmb2
         Gx6UV6u59+w2pZox9s7GVutE3lHiHNOMTK1WzpBcfOXu+xgs/1lPSoP2aIH0aURz5VWB
         GVnk2p9u1K8oHqHAS4aRTmavGszNnBPogOrIBRv9Ac5IY1fVhvT2DW0e9NjJa0nuBALG
         nAn/ayhXT5eNelQBa6YG0ZmAahI/ku+efBdZNGlQK1l+E6m/L9EplaGnWPqsREQK4498
         wK6A==
X-Gm-Message-State: AOAM532+t34Ymn/QZtx7Y/XZLN1DmG/3ns1dZLV9ec7tiqbwMxGKTO5Y
        qOk814xpeJsWT54EhP6Gva9wpaYdWmcKVuoyNxRddg==
X-Google-Smtp-Source: ABdhPJwCzKcJqz39IP46Bo7yz6o/13jgHbjOX0vtta6vuRLC/rbSBznCfSrqxtOCA/emfEwjuB/DVNaoOwhY3XJ9gtU=
X-Received: by 2002:a9f:2595:: with SMTP id 21mr286471uaf.33.1606779883895;
 Mon, 30 Nov 2020 15:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20201118220731.925424-1-samitolvanen@google.com>
 <20201118220731.925424-15-samitolvanen@google.com> <20201130115222.GC24563@willie-the-truck>
In-Reply-To: <20201130115222.GC24563@willie-the-truck>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 30 Nov 2020 15:44:32 -0800
Message-ID: <CABCJKueSjSdpztOsDExCaLyQ+Pip+r6bY=Y1hR=VTOODmoSZMQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/17] arm64: vdso: disable LTO
To:     Will Deacon <will@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 30, 2020 at 3:52 AM Will Deacon <will@kernel.org> wrote:
>
> On Wed, Nov 18, 2020 at 02:07:28PM -0800, Sami Tolvanen wrote:
> > Disable LTO for the vDSO by filtering out CC_FLAGS_LTO, as there's no
> > point in using link-time optimization for the small about of C code.
>
> "about" => "amount" ?

Oops, I'll fix that in v8. Thanks!

Sami
