Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07D70FD069
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Nov 2019 22:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfKNVib (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Nov 2019 16:38:31 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41419 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfKNVib (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Nov 2019 16:38:31 -0500
Received: by mail-wr1-f65.google.com with SMTP id b18so7021417wrj.8
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Nov 2019 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NJ5AXjvvGN3rmW3ly7bYsvI92wsOVyTwzutsVT4lLNU=;
        b=KkzxVX4KS4qUbANz1HTGSsWZdZzlQgYcP4L+xwokL21HbQezyUbqQ6EfS+GIrEojKW
         qolcEzO7f8J4GuMkwtVM0Vw+OWs6C/FquGDsmPYKp5GCBvQPLk0Ai2pgMo/yRGZSsW0R
         Hxp34epB4D9Xm5l9AZILC/g195nful0nHEODuXbTEtzsf4C/RqAjYi5YpZ+IhP+zk9co
         ExYstrLDd6SmytbC8Da/c+AzupNT/O3AYjIykxQuG5MKh2tKvXcznWVAlAjinThl7yDS
         egF7XKBOLWeLu+VGVtUXRHHTxS8g9JEHTPLmpcyqy1+P5UtKkk3/KEIcSe29aQas68ki
         HOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NJ5AXjvvGN3rmW3ly7bYsvI92wsOVyTwzutsVT4lLNU=;
        b=hQYfLP3IGRKHKStoFFVQ9CxTckNNFMPVrGrAeg8CYU1mO/iDaZay0QF0USNiKGOJxf
         kuw/pX/W0osS858W/uxFXFGbB47WOERSgZ9oTzbHp9RpcSOeSkaVfO1SWJzObrpKkfh6
         La2WLUmgkl0Nf1Kow+hPXgnOy5EztJOph7prtc/iJlXNDeexfxfo1IwO9a/LxXA7E49R
         P+vo1qz7FlccPJsHbLRRmTn5+Kd/PT/4B/LaKOAUEw9+cPuFRs5g5J9ESwBPUCM3NPNq
         4PysnuNtP+tjdtidnLmz4Y0sC6AiGlX9oTPpsYKBQkAFUkpPZY/Tv6xK9zlhtUgVoPIe
         NW7w==
X-Gm-Message-State: APjAAAV90Zq3DGLRSBE9GxgIndnkfvbzOyAkjWmpUH6yFbBYSRQDGzpv
        6uPQMjcm3bqC5wg2t9LyXoW+CA==
X-Google-Smtp-Source: APXvYqxkzPUiAzHpYfIdHWdk2kJMpAHkpms7E0w+/ME72VBfjNCIjRRJ9EpFjTlEbgwComBDbaQnbw==
X-Received: by 2002:adf:ef91:: with SMTP id d17mr10599325wro.145.1573767190754;
        Thu, 14 Nov 2019 13:33:10 -0800 (PST)
Received: from google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id i13sm8361956wrp.12.2019.11.14.13.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 13:33:09 -0800 (PST)
Date:   Thu, 14 Nov 2019 22:33:03 +0100
From:   Marco Elver <elver@google.com>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     akiyks@gmail.com, stern@rowland.harvard.edu, glider@google.com,
        parri.andrea@gmail.com, andreyknvl@google.com, luto@kernel.org,
        ard.biesheuvel@linaro.org, arnd@arndb.de, boqun.feng@gmail.com,
        bp@alien8.de, dja@axtens.net, dlustig@nvidia.com,
        dave.hansen@linux.intel.com, dhowells@redhat.com,
        dvyukov@google.com, hpa@zytor.com, mingo@redhat.com,
        j.alglave@ucl.ac.uk, joel@joelfernandes.org, corbet@lwn.net,
        jpoimboe@redhat.com, luc.maranget@inria.fr, mark.rutland@arm.com,
        npiggin@gmail.com, peterz@infradead.org, tglx@linutronix.de,
        will@kernel.org, edumazet@google.com, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 00/10] Add Kernel Concurrency Sanitizer (KCSAN)
Message-ID: <20191114213303.GA237245@google.com>
References: <20191114180303.66955-1-elver@google.com>
 <20191114195046.GP2865@paulmck-ThinkPad-P72>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114195046.GP2865@paulmck-ThinkPad-P72>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 14 Nov 2019, Paul E. McKenney wrote:

> On Thu, Nov 14, 2019 at 07:02:53PM +0100, Marco Elver wrote:
> > This is the patch-series for the Kernel Concurrency Sanitizer (KCSAN).
> > KCSAN is a sampling watchpoint-based *data race detector*. More details
> > are included in **Documentation/dev-tools/kcsan.rst**. This patch-series
> > only enables KCSAN for x86, but we expect adding support for other
> > architectures is relatively straightforward (we are aware of
> > experimental ARM64 and POWER support).
> > 
> > To gather early feedback, we announced KCSAN back in September, and have
> > integrated the feedback where possible:
> > http://lkml.kernel.org/r/CANpmjNPJ_bHjfLZCAPV23AXFfiPiyXXqqu72n6TgWzb2Gnu1eA@mail.gmail.com
> > 
> > The current list of known upstream fixes for data races found by KCSAN
> > can be found here:
> > https://github.com/google/ktsan/wiki/KCSAN#upstream-fixes-of-data-races-found-by-kcsan
> > 
> > We want to point out and acknowledge the work surrounding the LKMM,
> > including several articles that motivate why data races are dangerous
> > [1, 2], justifying a data race detector such as KCSAN.
> > 
> > [1] https://lwn.net/Articles/793253/
> > [2] https://lwn.net/Articles/799218/
> 
> I queued this and ran a quick rcutorture on it, which completed
> successfully with quite a few reports.

Great. Many thanks for queuing this in -rcu. And regarding merge window
you mentioned, we're fine with your assumption to targeting the next
(v5.6) merge window.

I've just had a look at linux-next to check what a future rebase
requires:

- There is a change in lib/Kconfig.debug and moving KCSAN to the
  "Generic Kernel Debugging Instruments" section seems appropriate.
- bitops-instrumented.h was removed and split into 3 files, and needs
  re-inserting the instrumentation into the right places.

Otherwise there are no issues. Let me know what you recommend.

Thanks,
-- Marco
