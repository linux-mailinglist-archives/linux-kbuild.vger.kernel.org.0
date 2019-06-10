Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D231A3B79F
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2019 16:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389643AbfFJOml (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Jun 2019 10:42:41 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39701 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389178AbfFJOmk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Jun 2019 10:42:40 -0400
Received: by mail-lf1-f66.google.com with SMTP id p24so6832292lfo.6;
        Mon, 10 Jun 2019 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFLtzn7p454HGGXIQlkjvG2CLSCPWdMp9Paqkm4rM+k=;
        b=tbFGRQUKd+khQV9eVwEStu+IxlVOTskxdCU7u3s3t9S8zzYm3MQdycUje21pVH/Uxl
         L9o/kjt+XnvRXrLp99GVzzEJ8Y8a7Xv0tZR6Hvlc/6O8wCyGMLdz672oU3QkAwtcRFBA
         r9hLL1QEpvn7JuNRyuAZ/f2Ljpns3AvRv+m2+j6mspw0X16YsYpOH+B7rpU1m8OL6HHA
         F6FElcSS4PUi36scC6+Ckhjj9ykDTXIZEbLNGMW3aAW7olNGwXYobx68NfFFRYSH5fOW
         3nc1JSwOgkcbopKE7Oq239q9gZnGApijkge8jPa5+Dj98Da+3cDYz3GOW7xrxmqeJYNV
         rAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFLtzn7p454HGGXIQlkjvG2CLSCPWdMp9Paqkm4rM+k=;
        b=qq9zO3pTJ/ZXMLlvrn6vtrge06pr0po+aHhozmhjH4mK6VvMTpSTznxmZTd/2icje2
         EzDs+be+gs0I8pAPvvSOP22cDuDh7/yAcsyeIe/ekFU4heS3+ck3J5nNwRQwk4GkHim8
         Vb8UsRIadR9fbbJSD9waRLAIhaSYCgzuWFJcEEJ/+cnglyoNE+emSQYZ7UoeGhUNSX1l
         O1IslxWD1fJvBNU+VbMZwge5Rmj//mmBNRZJAx+RQW5yd58LgfA/J5NAL9o9zOgWwx/5
         x2Htgo3AfVwAF9JXkHGo+st9Mxvuiko3Q2P/ddnz0mzuY4wCvKrujVFmNSn/0eKNC1+c
         KAjg==
X-Gm-Message-State: APjAAAUiU3eEuMNT4jNI6K/K9UFUAklV/aJi+ZfUwJQ9OoLi6emCoW+z
        pzvLTCTOPk6HZN3wz6jLrTKne+ChcBaC7nhuq2Q=
X-Google-Smtp-Source: APXvYqzS2XUDhCf3s3+GEUEe55OtH9zPXFNBU/AxsMsFncMeihyVsCqMSF54jEMyMDjEA5jze5a/E2+M3HJYdcKePeI=
X-Received: by 2002:ac2:46d5:: with SMTP id p21mr1068566lfo.133.1560177758821;
 Mon, 10 Jun 2019 07:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com> <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org> <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org> <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610074510.GA24746@kroah.com> <CALrw=nEp=hUUaKtuU3Q1c_zKO3zYC3uP_s_Dyz_zhkxW7K+4mQ@mail.gmail.com>
 <20190610142145.GC5937@kroah.com>
In-Reply-To: <20190610142145.GC5937@kroah.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 10 Jun 2019 16:42:27 +0200
Message-ID: <CANiq72kxyKV1z+dGmMtuq=gUWOYS=Y0EsNFqLKoFXWx6+n=J1g@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Ignat Korchagin <ignat@cloudflare.com>,
        Ivan Babrou <ivan@cloudflare.com>,
        Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 10, 2019 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > I also checked that 4.19.49 compiles fine with GCC 9, although with a
> > lot of warnings, mostly from objtool, like "warning: objtool:
> > sock_register()+0xd: sibling call from callable instruction with
> > modified stack frame". But it's a start.

I think Josh Poimboeuf added support for a few related things in GCC 8
(e.g. 13810435b9a7 ("objtool: Support GCC 8's cold subfunctions")).

> I'll look into these after the next round of kernels are released.  I
> guess I'll go find a distro that has gcc9 on it to actually test
> things...

I typically compile a bare-bones GCC for those things, it is quite quick.

Cheers,
Miguel
