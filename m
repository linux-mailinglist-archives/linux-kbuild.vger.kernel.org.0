Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED30124C85D
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Aug 2020 01:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728586AbgHTXRU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Aug 2020 19:17:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728498AbgHTXRS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Aug 2020 19:17:18 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E41C061385;
        Thu, 20 Aug 2020 16:17:18 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id c12so69914qtn.9;
        Thu, 20 Aug 2020 16:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OCCpDD1HGnRewk/D7AycR8ruwL1UMpf01dn4nf+tC3E=;
        b=L0A6twPCTdmvAtTC8jE3H1DkqKunPYR8+xrywZ8SqzG1qvcS9J7CjXb8FNDMz8sZUm
         Bgiv6V3B4Ep59c7HQf//u8UvlIypWa9pdme78orN1gGNM+LL7mfaMWrSlezA5zoRR9zS
         czz7DMFJOrf4Tb4Pr1Y79wu0f+NEoAp7jJ/mKFW7BjsDZHXqZuGvKcH6SW1tg1pdHn95
         H6Di/orGPZN27K3esMqisV8WeeR1vD8pUyUnF3YG/FfZSPadYTO/09GSiFoKuKfZM7/R
         qm7kucaDq6GUZKaaqQQaCwdl31LCWfdMIXlq73dLK6kJMZ0t6OkbrwJAoHl2hM8WAlRi
         cGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=OCCpDD1HGnRewk/D7AycR8ruwL1UMpf01dn4nf+tC3E=;
        b=EuySCfmW1ou6MzHsC2+eWp5JYxJ9YvRDeOxi+H+oZYty+/YyRlBororkHSdR7FpVw4
         ssrLwVJESRnRVRvO/Hg886bOfMlSnQOkaRNYHNyyv7sXF/94pNd0KyrjuwDW8ihwlt6m
         xlFFl63VlOIOpsijB/i8+H0xSC9MGZDzsPBAK3pD7VolJlmoLbQT67rLQjTCjzM4lXWD
         Y+Q6nD+gllEXqTn+KmJUdysclzkfqDQ8vWn8as2751zTzyAnJLMcEvNpTSxHZi+O4LSl
         wojOdeV8rSH34NuE+a0o/tZCUtLMKhze+WnIvtrhbzPf6lSkQoSAWsDNoc3xzpyRub3M
         5ymg==
X-Gm-Message-State: AOAM53160cmPuaDHN4liWDU33GhTNYiRv/KNEU22iOZ11K0Rt+H84DcL
        xXb19H9T130p8AnaL43VUFs=
X-Google-Smtp-Source: ABdhPJx9S6pVwUcHMYx7wa3nZ15C4jJfn68ZoBQaM25+Ou3TObLMS+45HfCRndXGXkNXJPI6YYn+lA==
X-Received: by 2002:ac8:3a26:: with SMTP id w35mr223130qte.124.1597965437155;
        Thu, 20 Aug 2020 16:17:17 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id 128sm3584451qkk.101.2020.08.20.16.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 16:17:16 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Thu, 20 Aug 2020 19:17:13 -0400
To:     "H. Peter Anvin" <hpa@zytor.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200820231713.GA829411@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <fae91af3-4e08-a929-e5c3-25271ad7324b@zytor.com>
 <CAKwvOdk6A4AqTtOsD34WNwxRjyTvXP8KCNj2xfNWYdPT+sLHwQ@mail.gmail.com>
 <76071c24-ec6f-7f7a-4172-082bd574d581@zytor.com>
 <CAHk-=wiPeRQU_5JXCN0TLoW-xHZHp7dmrhx0wyXUSKxiCxE02Q@mail.gmail.com>
 <20200818202407.GA3143683@rani.riverdale.lan>
 <CAKwvOdnfh9nWwu1xV=WDbETGiabwDxXxQDRCAfpa-+kSZijb9w@mail.gmail.com>
 <CAKwvOdkA4SC==vGZ4e7xqFG3Zo=fnhU=FgnSazmWkkVWhkaSYw@mail.gmail.com>
 <edd38955-dad1-ca6c-d783-6cb529d8dd3a@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <edd38955-dad1-ca6c-d783-6cb529d8dd3a@zytor.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 20, 2020 at 03:41:33PM -0700, H. Peter Anvin wrote:
> 
> I would prefer this to be a #pragma for a header file, rather than
> having a very long command line for everything...
> 
> 	-hpa
> 

There is @option_file, though.
