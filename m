Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2DB22126D
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 05:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfEQDOi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 May 2019 23:14:38 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35243 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbfEQDOh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 May 2019 23:14:37 -0400
Received: by mail-qt1-f193.google.com with SMTP id a39so6502634qtk.2
        for <linux-kbuild@vger.kernel.org>; Thu, 16 May 2019 20:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rKxEaaNHIV6JsHY3ht5oSGzbtWVjHarjvsskL7zAQu8=;
        b=Hcu0KCKbzK/sRRVVgD1EfbjOj2ONoQFhG9B5LizhK6UNMJfPder82blvHI36tqvXmQ
         DdkLTu9uydvQoChzn7CCe+9usejYltN71BWqI/5m+MJFPtI3X5BTtAIdln5pwcnU+MtS
         +pqTTP0wFeyVkMwZ0A0z4vZ3LXuF72HznwsP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rKxEaaNHIV6JsHY3ht5oSGzbtWVjHarjvsskL7zAQu8=;
        b=ekk2zzHastISnfWB00q+M22frsP1CFZ8vCJBli4iLBI1Sj5XuNexFVtWXkoW5VHdI2
         5giSF8EET3FpIwbOtzBdPMgCpeoqzgqSxgilJ3EDku/zBsc8lTIJQHX0cYhVacgJ6ShV
         ZHFwxYjeO58UMtjJMKsdnv8+GbniLDQjr/E3cEG+SeT8ZURIq3zeAMQTVRSWocs4YGAX
         QnwU4EN0Peq+enqzSgrLGKf5Hic95j7d7gAmye+mTBMYi9d5hPiUOvbeA+Y6u1rJFAoK
         OHNBXAhHyRxL9ndTSVGzKXlvJ1E6QokasX9KUe70HACtuqyLOqlYDycHmNp2sJBvEr1D
         xZfg==
X-Gm-Message-State: APjAAAWYC/ntNfSemGKYDdlKzBsNkeELv/FSnSJ7gYm5jeWj+6Y58GKw
        O7PPzhIDfwmQHLC4khMW3GgIA5fxIpsufvwiSM/9dA==
X-Google-Smtp-Source: APXvYqzOWz36fTK06wwiFIuYg95qsggEx19E8Ej8Lf5TmxRHoryNz2jZfMMn0QfC2FD3F02pGeeMwYRv6eOSw0T1lTA=
X-Received: by 2002:ac8:875:: with SMTP id x50mr44529748qth.345.1558062876675;
 Thu, 16 May 2019 20:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com> <20190516225013.nvhwqi5tfwtby6qb@treble>
In-Reply-To: <20190516225013.nvhwqi5tfwtby6qb@treble>
From:   Ivan Babrou <ivan@cloudflare.com>
Date:   Thu, 16 May 2019 20:14:25 -0700
Message-ID: <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

We are building the upstream kernel. There are a few patches, but
nothing related to objtool.

Unless you mean mainline/stable by upstream, I haven't tried that. We
stick to LTS.

On Thu, May 16, 2019 at 7:04 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, May 16, 2019 at 11:20:54PM +0200, Miguel Ojeda wrote:
> > > mm/slub.o: warning: objtool: init_cache_random_seq()+0x36: sibling
> > > call from callable instruction with modified stack frame
> > > mm/slub.o: warning: objtool: slab_out_of_memory()+0x3b: sibling call
> > > from callable instruction with modified stack frame
> > > mm/slub.o: warning: objtool: slab_pad_check.part.0()+0x7c: sibling
> > > call from callable instruction with modified stack frame
> > > mm/slub.o: warning: objtool: check_slab()+0x1c: sibling call from
> > > callable instruction with modified stack frame
> >
> > AFAIK those are non-critical, i.e. stack traces may be wrong (or not),
> > but it does not mean the generated kernel itself is wrong. CC'ing the
> > objtool maintainers too.
>
> I don't think I recognize those warnings.  Do you also see them in the
> upstream kernel?
>
> --
> Josh
