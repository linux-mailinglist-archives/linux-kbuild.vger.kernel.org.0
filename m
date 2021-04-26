Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6576036B8CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 20:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234192AbhDZSTN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 14:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234304AbhDZSTN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 14:19:13 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EAD1C061574;
        Mon, 26 Apr 2021 11:18:31 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id i4so28479264ybe.2;
        Mon, 26 Apr 2021 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F7v36cla8caxpSLJhOMdKWfComHLfYG2gbSrAEkLrOw=;
        b=A1AFfE+2fVystHL7B+p4dhFFNrnZRzFxxOsH2x/tAB1afo1nksfGMvGLn1CzpLOhw7
         19f/dgMkIRmUHi3WS8dkILKMSRG+qdG31sqbBDqyBwZG1qaCKY5peThW0OKBOnXi7TJH
         WH1X6CPUDOZ+Bxax1/I9FC8i61tBZ4AshhRhe6n6HLl5yoyo4VWOQiQZosSrzbQRcPTd
         32G4FpKQ+WBP5lmdO8pZiF432W2/5wLwLNH7UwCt+dvOvQZi4WATaGbm736K8+7PRPuS
         FBAPB0vtCUhsjHsm0BN4WeiPWwcqg56XUG0sd7/wG6A98/Gu3ZkKPjI+zQvbmw9B7ab9
         qYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F7v36cla8caxpSLJhOMdKWfComHLfYG2gbSrAEkLrOw=;
        b=VjGnC53kr4tORdxtYCKL6v1GeX09+s3J6wp9Gnftd64juvIDAYd4L4a2ab3X7nnFr0
         2lujqePoKySS+5JTx8bZ9CgFZUlAz4qSEzVyG1Le2Bf49V/MvOa+YewXfBynLRv984E1
         L07yLkEvBRh/ZcZR+ynbEoHHul8JRMLzP4py0HCWnRyS+vDHwZloWuGdz+1cfUAWVOpL
         dZ5drcSygKn1KtqiEP7Pt1BAA3PPRJJW7/OYs5dJZPoYzTKay1MoNHqbl0+TlQmk/yhl
         1mEmSaFP+Y4dflMT8QhZadLYrWTOeYfnT0v/XvMakoslba48McU+5OdTG34D+6Bugb7o
         qEAg==
X-Gm-Message-State: AOAM530qi3wAbwWekk/zbk60vbmaFayoVtqICPKRC33PsK5TkEBS3B+7
        wlvRpt29+x2HkXBFW+oXX3TXcPyBA2emBmc0ZOE=
X-Google-Smtp-Source: ABdhPJwA9XaKpU2FfRTf3EhmwLejH/FxBtccngRqJlzoiX2mOvpdI80qCUc5w+8GSCrLHIisaBXYdcoD7eqCChWN91I=
X-Received: by 2002:a25:7909:: with SMTP id u9mr25819339ybc.22.1619461110782;
 Mon, 26 Apr 2021 11:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com> <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
In-Reply-To: <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 26 Apr 2021 20:18:19 +0200
Message-ID: <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 26, 2021 at 2:31 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> I think the Rust proponents should be open to the fact that their
> work will eventually depend on themselves or someone else
> fixing a working compiler for the maintained architectures in
> the Linux kernel one way or the other, so they will be able to
> work with Rust project anywhere in the kernel.
>
> For example m68k is not going away. Avoiding this question
> of compiler support, just waiting and hoping that these old
> architectures will disappear is the wrong idea. The right idea
> is to recognize that LLVM and/or GCC Rust needs to
> support all these architectures so they can all use Rust.
> Someone needs to put in the effort.

The RFC does not avoid the question -- please note it explicitly
mentions the architecture/platform support issue and the current
dependency on LLVM, as well as the possible ways to solve it.

We would love to not have that issue, of course, because that would
enable Rust to be used in other parts of the kernel where it is likely
to be quite useful too.

But even if we did not have the issue today, it seems like starting
with drivers and other "leaf" modules is a better approach. There are
several reasons:

  - If for reason reason we wanted to remove Rust from the kernel,
then it would be easier to do so if only "leaf" bits had been written.

  - We cannot compile the Rust support without nightly features yet,
so it does not seem wise to make it a hard requirement right away.

  - Kernel developers need time to learn a bit of Rust, thus writing
subsystems or core pieces of the kernel in Rust would mean less people
can understand them.

Given that drivers are a big part of the new code introduced every
release, that they are "leaf" modules and that in some cases they are
only intended to be used with a given architecture, they seem like a
good starting point.

Cheers,
Miguel
