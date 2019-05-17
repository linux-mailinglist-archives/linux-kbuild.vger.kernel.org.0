Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3162156B
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 10:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbfEQIfo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 04:35:44 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40727 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbfEQIfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 04:35:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id d15so5522651ljc.7;
        Fri, 17 May 2019 01:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ihhw5ox45JGgFt4PN7kc9f57bh4mc9j6kPyQqbFsIX4=;
        b=pYv2sJLnz86KwGDIUYhtqlU5J8oQRXxMjGC13Ik/NPUVAg7KXl9SpPfDLhY4uH0h5y
         hU3uGifo2P7JTv/erhzIwD3LqG5xCwd8kgtaRhqk466lZ5cFY9IeAjkm7Ws5FejL3Gh1
         Qu/DjUu+ZSdLhufF0E+vzBBCzB1F2IM14uT2dx6LBjbHNlzg6M97Mzn3vVtthTn9VkHy
         ntjqVX8lAy/Q8ex87nbGu86BwsmgUjhzRJ/R4+u4ppAoFB/XRA+OQUBeqs/wxe7TYAxt
         rwPKadYzzOAbMJoe8nZW45KHvZZp8JV3A8ll+3VYoeHIO1jr41NFYBaFB0VMOFkrRv9N
         fc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ihhw5ox45JGgFt4PN7kc9f57bh4mc9j6kPyQqbFsIX4=;
        b=q/0UCp5IB6gvEcDJWpPPf7zNT9b/aWkQZYdfDpaZvCMfac3upPoMIMCqFP6CocH0i9
         jEK+oM1ZRMus9cx4Re7yY/ptbX7g57dd83OCTEI1YomRIFo5oMrWXWYxtO3vHlrGCD8R
         TkeQr1Vae2V0zG4/4azYZzrt6x3NMEJI74He8kEHFW+Dl4tjSI9sTUNzeyuzP663Jhbq
         FhG3xxALQMA4K5pqaIycIY2tQ3kEfsXaIWIcADvdpGEHFsG1CLm7xQIRwXxIM4MvDW9a
         KgHdBHf00FTrDwGHsrwK1NNZMPxS4kg5Z4WayritLlam9GPVbLEPtNWEZttUZr/3a7wx
         Lbgg==
X-Gm-Message-State: APjAAAXuIQErZsCXfxpapFzj7a60vb2YaWxNs4MTp2Q2yOyGGSI5XaY2
        4NIhxMDnr3YkMHEq2fe1WhrzSNQLZB7P0GZOcv0=
X-Google-Smtp-Source: APXvYqz7g/tYbSyASwhoBvx3+kcnS8YgJe1z40ldbHzpGG7L7EVmsDvGQt6P35xz4gydwxz7zizTz7D06UhEAZcHShU=
X-Received: by 2002:a2e:2b58:: with SMTP id q85mr27358851lje.179.1558082140831;
 Fri, 17 May 2019 01:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble> <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com> <20190517073813.GB2589@hirez.programming.kicks-ass.net>
In-Reply-To: <20190517073813.GB2589@hirez.programming.kicks-ass.net>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 17 May 2019 10:35:29 +0200
Message-ID: <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
Subject: Re: Linux 4.19 and GCC 9
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Ivan Babrou <ivan@cloudflare.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
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

On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, May 17, 2019 at 07:09:31AM +0200, Greg KH wrote:
> > On Thu, May 16, 2019 at 08:14:25PM -0700, Ivan Babrou wrote:
> > > We are building the upstream kernel. There are a few patches, but
> > > nothing related to objtool.
> > >
> > > Unless you mean mainline/stable by upstream, I haven't tried that. We
> > > stick to LTS.
> >
> > Please work and all of these issues fixed up in Linus's tree and then I
> > will be glad to take the fixed into the stable releases.
>
> Right; if there is anything you can reproduce on linus.git I'll happily
> have a look. If it doesn't reproduce all you have to do is find the
> patches that make it work and ask Greg.

Just to clarify: Linus' master is clean of these issues with GCC 9.1.1.

Cheers,
Miguel
