Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D72A4A03EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jan 2022 23:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351436AbiA1Wte (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Jan 2022 17:49:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349922AbiA1Wt3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jan 2022 17:49:29 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBE0C06173B
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2022 14:49:28 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id x23so14756513lfc.0
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2022 14:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ga12vASgQepzopTf7itk5qo6jciiWvEYo54yaueBv/k=;
        b=ocuHiLSMSPTflZxrNNESvCIQ9i+7KDA5CgbR62QaQKXXDLgjYsHYlv8V7w7m89YSBv
         uqDFU8pu0wkTuGojbwMOm4xC4j81ouCZqMQUv4ylul1TzqWYa5Ej6sz/dpO4Xx6Tk5av
         UXItrbB9Ml1gsjXRDAWJ85uAnmftgLgl+I/3ZPdhD7ISL1Rx/oofWx6I5gZvy0O+ebnd
         CCtov4e6Wjt3VZbONDqtD2zgyJK7ekvkOfRukUUMmiEIf1WPwG/vQtQg51YleVk2+yru
         vtbMsL+rLA3DMH7e2gqooF1lNdWj9PV5SMlT604dQ55IYytTAWSziScWu9bvSVp9McF6
         OPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ga12vASgQepzopTf7itk5qo6jciiWvEYo54yaueBv/k=;
        b=n4+d34w66eYuWf0t/lL+myYVXbChh2jDW7WKlLE7aZbksqlvpbs2xR6W+/SdyQcD8l
         Jxklhtqzvh63wOmLhbXgL3meoWSSo896+ykgfl1/ysunTUIx/MJmUVHOQ/3ZM5aXZ1RQ
         de2Y0PeGwJgm+h5ylv7fj0o3/ttGfnsgRxm2Q4o4TU+Pnzqh+JRki2bXM6yVwafJx/gF
         AUCts6SUH1sGWjKWJMvhRXS0EnjUBeVxe60WFzlrUY9m1SaOaCEBR7on4Kds8BpOI1Js
         hJsXUdBKmp/LcXXHUPH/DKQp3npKMnzXajP9msLrqfdxwonHfvRYLontouPC3Wkhalw1
         Qn0Q==
X-Gm-Message-State: AOAM531MdtTVXdYD/AVemrnngJjsepUGronoKKeY/GCxnKW+7EK3v6xL
        +3eYIpFxNE7alNKUOlrgGPJxVaS5vzwZuTm9aBKtkg==
X-Google-Smtp-Source: ABdhPJzaJFI+R0ILoPy/Efjd+HHvfSdGQyGuwezXUpAsCFmnl8paU8d50L8ZlP2AF/lXoKPXGH4nExxQp3vxfXwFFHg=
X-Received: by 2002:a05:6512:3ba5:: with SMTP id g37mr7601124lfv.651.1643410166929;
 Fri, 28 Jan 2022 14:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20220112224342.958358-1-quic_eberman@quicinc.com>
 <20220128220841.3222637-1-quic_eberman@quicinc.com> <20220128224528.f7ejzw55t6kfefmm@google.com>
In-Reply-To: <20220128224528.f7ejzw55t6kfefmm@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 28 Jan 2022 14:49:15 -0800
Message-ID: <CAKwvOd=Ab+GWNzSC6eaDWTVDF6gJQ9fDDMT3hep-DzhrEA6DpQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add environment variables for userprogs flags
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

 On Fri, Jan 28, 2022 at 2:45 PM Fangrui Song <maskray@google.com> wrote:
>
> On 2022-01-28, Elliot Berman wrote:
> >Allow additional arguments be passed to userprogs compilation.
> >Reproducible clang builds need to provide a sysroot and gcc path to
> >ensure same toolchain is used across hosts. KCFLAGS is not currently
> >used for any user programs compilation, so add new USERCFLAGS and
> >USERLDFLAGS which serves similar purpose as HOSTCFLAGS/HOSTLDFLAGS.
> >
> >Specifically, I'm trying to force CC_CAN_LINK to consistently fail in
> >an environment where a user sysroot is not specifically available.
> >Currently, Clang might automatically detect GCC installation on hosts
> >which have it installed to a default location in /. With addition of
> >these environment variables, you can specify flags such as:
> >
> >$ make USERCFLAGS=--sysroot=/dev/null USERLDFLAGS=-Wl,--sysroot=/dev/null
> >
> >to force sysroot detection to fail.
>
> -Wl,--sysroot=/dev/null => --sysroot
>
> As I mentioned in
> https://lore.kernel.org/all/20220128031549.w5a4bilxbkppagfu@google.com/
> -Wl,--sysroot=/dev/null does not suppress search paths like -L/lib .

In that case, Elliot, can you please test whether USERLDFLAGS is
necessary to be specified AT ALL? Maybe we can drop that addition from
this patch if so?
-- 
Thanks,
~Nick Desaulniers
