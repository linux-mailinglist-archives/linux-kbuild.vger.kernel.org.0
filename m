Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B1B226C72
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jul 2020 18:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729024AbgGTQwv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jul 2020 12:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgGTQwu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jul 2020 12:52:50 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EADB5C061794
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 09:52:49 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id y10so18811970eje.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 09:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WjwIKDNMRO86HLiza3ekP7Z4qpEbwmULQ/L4/V4YUtE=;
        b=aKi09317EgbufEHdPz6ybPx9SBQ3iXd5Qr1oxjOv5QrJguwLfk+bp9TvU+POgEqNC8
         E9WJUEpjgUVnd4A6HMqkPY1IIekaq1PzTfjnSMhOysWqSQHFxU2VpsbyaAfBSvi55tCf
         OsQMetqysDIjWPonv8j8aSyT8PHbE2MY4MEap62x4hEwJiTGeKO4UE/AqW6CYkuqHJFK
         +jNk4cgc5ueo3XySM27EJlzHTQmL7o1dFCUGkubIzjmwWtHygQSqOr7J4KrirT0N5ii5
         6jmz3r9OZwZaSF0lhj6qB061kySusc6q4saf79ctFwnqDim1fh9xHMNQHSN4aeXTLI+e
         WmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WjwIKDNMRO86HLiza3ekP7Z4qpEbwmULQ/L4/V4YUtE=;
        b=qiG10V42R5b5RBbZ01eUhuKUBDHnmevbxs/xsfrNgUmR2+e070MSlyWauvLd/uQHcX
         2bjJuYKBY53xWtejLmPXEr5Xvj4VmdpMaFXxDtOusiVWbgGX6r76oQcXzPd38AhXw2tn
         ddc6111ncl1KEBrLcAEucUdciEJ7h1r14K5JIyeA/eixrNiDQRJOucDANR56WlmVFQEb
         fTB/Z+9y/AGbwGmd0Zjde7BrWEGIq/iA4Nzw+jiTxUgIUCRwITIN9ZL2m4FCJZ9yopPt
         7RMu0pIue2tnbIVT+cl0oDJyLYP/8ErxStaB/7364ajxisPRIUDYi+RBYLNJYX2SnlBK
         JEpQ==
X-Gm-Message-State: AOAM532O9guhHzETylyQMcA/+v3gxkW0TO3Esxxu7c2nqpyGuadcyJU7
        uXtPR+yIjNSpIru/1a+NIxV0GWlYVr4gxOou+LCimA==
X-Google-Smtp-Source: ABdhPJwXfmksCBX85u+pwB/9F5hgtRX4ZE8Dkw8qbJ6G2uTpNqzPbNioN4uT7/TWkHbxi+iplWhAeGWkg23vKqV2cIc=
X-Received: by 2002:a17:906:6959:: with SMTP id c25mr21009671ejs.375.1595263968366;
 Mon, 20 Jul 2020 09:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200624203200.78870-5-samitolvanen@google.com> <20200624212737.GV4817@hirez.programming.kicks-ass.net>
 <20200624214530.GA120457@google.com> <20200625074530.GW4817@hirez.programming.kicks-ass.net>
 <20200625161503.GB173089@google.com> <20200625200235.GQ4781@hirez.programming.kicks-ass.net>
 <20200625224042.GA169781@google.com> <20200626112931.GF4817@hirez.programming.kicks-ass.net>
 <CABCJKucSM7gqWmUtiBPbr208wB0pc25afJXc6yBQzJDZf4LSWA@mail.gmail.com>
 <20200717133645.7816c0b6@oasis.local.home> <CABCJKuda0AFCZ-1J2NTLc-M0xax007a9u-fzOoxmU2z60jvzbA@mail.gmail.com>
 <20200717140545.6f008208@oasis.local.home>
In-Reply-To: <20200717140545.6f008208@oasis.local.home>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 20 Jul 2020 09:52:37 -0700
Message-ID: <CABCJKucDrS9wNZLjtmN5qMbZBTHLvB1Z7WqTwT3b11-K4kNcyg@mail.gmail.com>
Subject: Re: [RFC][PATCH] objtool,x86_64: Replace recordmcount with objtool
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        X86 ML <x86@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
        Matt Helsley <mhelsley@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 17, 2020 at 11:05 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Fri, 17 Jul 2020 10:47:51 -0700
> Sami Tolvanen <samitolvanen@google.com> wrote:
>
> > > Someone just submitted a patch for arm64 for this:
> > >
> > > https://lore.kernel.org/r/20200717143338.19302-1-gregory.herrero@oracle.com
> > >
> > > Is that what you want?
> >
> > That looks like the same issue, but we need to fix this on x86 instead.
>
> Does x86 have a way to differentiate between the two that record mcount
> can check?

I'm not sure if looking at the relocation alone is sufficient on x86,
we might also have to decode the instruction, which is what objtool
does. Did you have any thoughts on Peter's patch, or my initial
suggestion, which adds a __nomcount attribute to affected functions?

Sami
