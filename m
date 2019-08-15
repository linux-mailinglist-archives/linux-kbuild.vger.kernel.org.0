Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F88F8F7C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2019 01:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfHOXyN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 19:54:13 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45378 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfHOXyN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 19:54:13 -0400
Received: by mail-lf1-f66.google.com with SMTP id a30so2804399lfk.12;
        Thu, 15 Aug 2019 16:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUR8sKJAysqvgde7a/GEolWZUsjVUl8S+CBNn4ZSzd0=;
        b=H/e1PI8tnfZHbSVcmTI3ZlTz/NDKqEbLupqbUDm6SFLMikorKxQDrI8jM2bw5Cj7Wc
         TkYmvKSsRqQP2MCg8Dy7LCRf/YOmveTd+sT2G7ZSy1J6gVDwdjfM4X9bZ4M5BqdF4tyR
         fX9+0BehG9+13N6ZvdPeFLilu7xbfpNB6vQNCFsc0+qNDDTu0rPjUPmvKcKhRcoGStno
         tUWQigjrXp/5PKkO6sOwRv8TMTGG3Qq3gBU8T5y/4hHl/2zuhwB3SjhIKBQMGl04GTeJ
         kSfiG+khAqeTuWG+3Yie+lr8E8HdE5ZhSb/+gRCBl019IGJF5r+SLn1JB+ta7wGJxeGb
         AvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUR8sKJAysqvgde7a/GEolWZUsjVUl8S+CBNn4ZSzd0=;
        b=YwmDYKjBPUlYyHXTDgWJ6Ll4es+Uc8BHOdzzDdq9EBbr18bbTl22q6iOHj/0xBn5ZK
         TKQM4ybqUMpu5Wshoyru8bANN8anHyYt88MZDCobGDn+zsqgE4uGoNsOX8r2ssbMCb63
         gyWb8NdCC65M1I51/Gl2yPjqODsovwDpsMjbXcLHD4f6RX8VCfSbFg1x6bscC3CmFPAR
         p9rPSt2RXY+Xl6MtNJcvhOISPw6An+MDkRQYSI8jRGBzq8xInQ4uGlBe5r3qWBE0j8AS
         Z+9uTIhpXZnzImgy3CIboxjii/TLxnLxffIXi9dsaWy89oobEU66nXDaQelBiQuC67oi
         JfKg==
X-Gm-Message-State: APjAAAWQCFPSYTwO0QG91Fm2Xqj5FPT4ZxjckJznBfEtWtP/1X5S3A0W
        xZCoyJfEghGmZNjv2HyqkFBActAQ3axHJwzfEWc=
X-Google-Smtp-Source: APXvYqw9iMwlbGaYa9Gw4S54tbPxw0qnWHs1sXgDrojU1m0SkxO8PL1a615sX1xDGMc4IE0k1fF376dS8B7zOgup64A=
X-Received: by 2002:ac2:4157:: with SMTP id c23mr3561969lfi.173.1565913251168;
 Thu, 15 Aug 2019 16:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190815182029.197604-1-nhuck@google.com> <20190815204529.GA69414@archlinux-threadripper>
 <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com> <CAKwvOdm4Lsj1mPn3+FtPDrNVSQovsw8Fe9u6Yw3te7pD-izAog@mail.gmail.com>
In-Reply-To: <CAKwvOdm4Lsj1mPn3+FtPDrNVSQovsw8Fe9u6Yw3te7pD-izAog@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Aug 2019 01:53:59 +0200
Message-ID: <CANiq72mVSyr6zvem13v5JNR=GTDnB1fgO=9P2Qimc=GekLB-kA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 16, 2019 at 1:05 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Aug 15, 2019 at 3:59 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Thu, Aug 15, 2019 at 10:45 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > > * Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
> > > to just -Wimplicit-fallthrough for clang") for the time being and just
> > > rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.
> >
> > I would avoid applying commits that will have to be reverted just for
> > Clang, particularly since it is not fully supported yet.
>
> "not fully supported yet" you say? *drops monocle*
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS?h=v5.3-rc4#n4001

By fully supported I mean it already works and people can rely on it
out of the box using a released version of Clang/LLVM. Is that the
case already? If so, many places need updating!

  * include/linux/compiler-clang.h should check for the minimum
supported version
  * Documentation/process/programming-language.rst should be updated
  * https://github.com/ClangBuiltLinux/linux/wiki does not mention anything

etc.

Cheers,
Miguel
