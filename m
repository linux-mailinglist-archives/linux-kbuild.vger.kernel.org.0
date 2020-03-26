Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E103193BA2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 10:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgCZJU1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 05:20:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50987 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgCZJU0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 05:20:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id d198so5664251wmd.0;
        Thu, 26 Mar 2020 02:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QMCowoi/JCe2v265QDbm4p0VWyPtNcTvLQEymboWLVk=;
        b=RX5mdPiGXyfiPKfLphcwrDBi/peU3SRPc7ZGMrTb/Lqfw5UgtRSTdH91h+70066QSC
         pP/ZHueo0A+c2VE90+X8dHKj3RlwOXug4g/YAbDWlmKY39FtPZUup4CBm3d3ZB4WSKjR
         0Huosrm//+PuSEoUBMz87vDYm1X12Mc+oGDi7+6T1B67NT8uWqaZaiJ3FcOHvTmVvv6S
         eZ2W1Tvhym1i2jFVx2NsZrf7q1CPuiwf72Cu0d8tW+Puw87y8oVvdM83FKXgxpa9mT7b
         af7m9ubE+9gkC/qaffhOvx4OugsY5bB0Kao9ZPWQ8vc6qWAwB58n97v5dvbVrwPS6VaA
         bR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=QMCowoi/JCe2v265QDbm4p0VWyPtNcTvLQEymboWLVk=;
        b=Mjqdzk9LlAj1wGKzOqFY2GMcEuCixWD4ZsMofPQRf1DzzErhIlDmeANYE47K5CWtmy
         py7ncbwl5foNWDLzzUcoq/gXUSoEjlOjzzHUK+UVN7w+Q7MjvWnwcyf4/UVOkjwNEZgD
         5I7PnpMitZhcxD4g/qlAQskDZ9WYGN4SPU/5jvttwmmLMFTACh0lfDcihdS4fFRMtcUD
         Y+uxTA6ygk5jVTrta8yOYJj6OnkOWkDFcaSbC1ugRyHrE8N1mZ6M7e3ayDt3US1nC5YF
         La/thjW9jqPcvuYkPvfvGrCQ6kBRS+Nvlv51AtxmWjL40D9jPOJiaxFuwzx4vDJhG7GG
         Agmw==
X-Gm-Message-State: ANhLgQ3JNh8buySiUi/LjCAno+VR4rQnNWQCNtxSOzPqZM/yZFTjz3z7
        o3R+XSyyJkjx/C2VkwVzKMo=
X-Google-Smtp-Source: ADFU+vuo5kkY6YJNmSthEGmulf1OSYWdFlZ4mkUhgBR28ala97SVa+B34f0Sizj5koNYygjLIKM3Ew==
X-Received: by 2002:a1c:a950:: with SMTP id s77mr2082562wme.176.1585214422984;
        Thu, 26 Mar 2020 02:20:22 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id v26sm2742597wra.7.2020.03.26.02.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 02:20:22 -0700 (PDT)
Date:   Thu, 26 Mar 2020 10:20:19 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
Message-ID: <20200326092019.GA100058@gmail.com>
References: <20200324084821.29944-1-masahiroy@kernel.org>
 <20200325045940.GA24974@gmail.com>
 <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQvgT=OWVuBVrvgdZ7AAkoaV_K_Y+w9bOFxRPw_1TOSUA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Masahiro Yamada <masahiroy@kernel.org> wrote:

> > LGTM. I've got these four from Jason A. Donenfeld queued up in
> > tip:WIP.x86/asm:
> >
> >  bd5b1283e41c: ("crypto: Curve25519 - do not pollute dispatcher based on assembler")
> >  829f32d78588: ("crypto: X86 - rework configuration, based on Kconfig")
> >  95ef9f80ed63: ("x86/build: Probe assembler from Kconfig instead of Kbuild")
> >  1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
> >
> > I suppose these might interact (maybe even conflict), and are topically
> > related.
> >
> > Would you like to pull these into the kbuild tree? You can find them in:
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/asm
> >
> > Thanks,
> >
> >         Ingo
> 
> 
> I did not know that these had already landed in tip tree.
> 
> They are immature version.
> (In fact CONFIG_AS_CFI and AS_ADX are false-negative
> if GCC that defaults to 32-bit is used.)
> 
> Can you simply discard the WIP.x86/asm branch,
> and only reapply
> 1651e700664b: ("x86: Fix bitops.h warning with a moved cast")
> 
> ?

Sure, done!

In case you need any x86 maintainer acks for your series:

  Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
