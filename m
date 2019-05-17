Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1453221A74
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 17:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbfEQPWG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 11:22:06 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:37402 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728749AbfEQPWG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 11:22:06 -0400
Received: by mail-qt1-f193.google.com with SMTP id o7so8433928qtp.4;
        Fri, 17 May 2019 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tVu9EkldM3onnvk8BPzbzIwspJMsVrSFyKHg7EYG2tA=;
        b=qy0bVwePhtQ9I7p12Ufs0t1LtV47n7M6OOXey7QmvOHmkhU1FOd7DK9DU1gy5VhAIt
         8zv3Am1MJNtddZexuwUyDbvTpPINHvWrA1S0pO8PTPNt3EjC4k5Ecm85q2bgnoPWCSH5
         qZFgCMAFiVB/Dn65U7qDV6NyouMSAY7ntW+aFOrjKZB63eCzp27OSOgJN5X7y1S5MiqM
         CwAQyONH0sSmt2doRrE+UYSGPQu6+6EBoLD/S4XCHHbaMTuaYV5TsK9V95Zfoy9fYv79
         plPeNJAAtPkQm+JtcYS8F2p5ScPhVxwkegXp2O8ihmWZ7fajdDy7+Uw090ZPhlm6MNyf
         41xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tVu9EkldM3onnvk8BPzbzIwspJMsVrSFyKHg7EYG2tA=;
        b=UWIrOoI0/i0CbGMjaHtyVAu1a+gSkkg4SewSK5aPdILE2e61tyZF0lwSqKV+/WLhs8
         TmV3niJI+QV4SWv5/EYxlxRra3kW36dBzarhOfEQiQRwNTFAZkAGTBwOHex4B1wWkhOi
         rD6adwu5UGU/Y/qRD3YCeSNBXxvw8lrls+hes4lBtSJrK7oc+iPIC0TncbtEAK2NBOWw
         5hXU/9eLAFn4J3iS+m7MKv4jHAFv5hXo7d8ZUVffl4wcniNdEVecDhwbbEUcoZaSfRMS
         Qh4WhIfSvLbn02vOaZLLtVTbxtcme3ZtCceuJycakZrk/8/IlXvSWNGMmuWipaHnU1rr
         fpBQ==
X-Gm-Message-State: APjAAAXn3LC6zJsX8bhp2iaB478GoBoJ721XhL90b3Mkk9nO0FtzAijV
        jkv4/R7I/7Bifj5vkGx1p88=
X-Google-Smtp-Source: APXvYqz0Hl1IYJlqcHlwcyahYtK5SEW/55qvDt4wBQckSvdhrSXx6zCeJEp/bUrgKrHh5ssple74PA==
X-Received: by 2002:a0c:e64f:: with SMTP id c15mr40321600qvn.239.1558106525270;
        Fri, 17 May 2019 08:22:05 -0700 (PDT)
Received: from quaco.ghostprotocols.net ([177.195.211.69])
        by smtp.gmail.com with ESMTPSA id v22sm6089750qtj.29.2019.05.17.08.22.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 17 May 2019 08:22:04 -0700 (PDT)
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 6ECEB404A1; Fri, 17 May 2019 12:22:00 -0300 (-03)
Date:   Fri, 17 May 2019 12:22:00 -0300
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ivan Babrou <ivan@cloudflare.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190517152200.GI8945@kernel.org>
References: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble>
 <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda escreveu:
> On Fri, May 17, 2019 at 10:51 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
> > > On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > Right; if there is anything you can reproduce on linus.git I'll happily
> > > > have a look. If it doesn't reproduce all you have to do is find the
> > > > patches that make it work and ask Greg.
> > >
> > > Just to clarify: Linus' master is clean of these issues with GCC 9.1.1.
> >
> > Great!  Care to find the patches that did that work and send me the git
> > commit ids so that I can queue them up?  I don't have gcc9 here yet on
> > my systems, so I can not test for this.
> 
> I am unsure about the perf and the objtools parts (Peter/Josh?), but

I'm not noticing these while building upstream perf with gcc 9.1.1 on at
least fedora:30.

    33	fedora:30                     : Ok   gcc (GCC) 9.1.1 20190503 (Red Hat 9.1.1-1)

> about the -Wmissing-attributes I cleaned, they were these:
 
> a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> init/cleanup_module")
> c0d9782f5b6d ("Compiler Attributes: add support for __copy (gcc >= 9)")
> ff98e20ef208 ("lib/crc32.c: mark crc32_le_base/__crc32c_le_base
> aliases as __pure")
> 
> Cheers,
> Miguel

-- 

- Arnaldo
