Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD874192047
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 05:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgCYE7s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 00:59:48 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45995 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgCYE7r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 00:59:47 -0400
Received: by mail-wr1-f68.google.com with SMTP id t7so1225604wrw.12;
        Tue, 24 Mar 2020 21:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=h4KOauMe4v1I9pCuRQdOG97Qu/heRc/6J7SU7o8yNwE=;
        b=eym7r4h8AfIsMrgo04iccRS6vIxpRq/GGv4kov4LTgdKGrwEQ7NH5p96msOECxq/Km
         PFH2vIUzNv06GEqB6wtynYt0kuEoT8qZihcaMl24tj6Tk2AOfzlAwPrvl42qfw4f+4BA
         mwcxhRe6qd2i16ficvpLPTPPUAmI6dbtwnpkduuMnFQJMWXpnkJIG2YpPdAjQzG+7JD2
         /LEVW3fOt4bpK1vkzUH2I7xJO0pGRlO83VAENk6A01kvSi5QthsmEOPPw1IAF2Pn84tP
         Nn4vjTJJXt8B1LyLl6/HuK93OxneZMzcfL27zwzGfymxQnQYiRkIQ5350pLXWmGqam49
         sR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=h4KOauMe4v1I9pCuRQdOG97Qu/heRc/6J7SU7o8yNwE=;
        b=M9403Qg7/9u+WJ0e36iclVCRaE/wtgRqwkpwC5N1FgkC9FdqsP0Gv4JrHHGgoFJ+/h
         vdcY8fXznlCSR939a65fVCwvX4PVFL42PXnzD79ge37sx+F5xK/0UT06DLEA138LNqDa
         gGdvxI3JJSG9UWezvXts3TdqJtS0BQBUpNWRLiY4Wt680XUaQkc+mBfx+AIajSpxolRS
         +OVJrhOjTkij9WjNoqqGzrkU3mlEoWvFyvbmSvCegFYWW5rMxCZ2El4WB0THwRC7IM9A
         2lGBTPoXAdIIp4I7225+wydWEx9aPwZbH/6zEyZQl6X6z3nm+zW4gMzZ0+rRoGANVqR+
         ctQQ==
X-Gm-Message-State: ANhLgQ3zxtqAF+vn5GLpxl5IlsJUs6pyFdMCtanvD/+lfAiS5Iy6/O2i
        jnIxdJAHr6HlyVdjkhDAoq4=
X-Google-Smtp-Source: ADFU+vsMr8RTd3Hle0zy0eB1BsZBBUecnZChYZPKh6yx0k9aeumjW3wG1yR68IBbypixPwr4XlixZw==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr1225073wrs.4.1585112383933;
        Tue, 24 Mar 2020 21:59:43 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id p16sm7149295wmi.40.2020.03.24.21.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 21:59:43 -0700 (PDT)
Date:   Wed, 25 Mar 2020 05:59:40 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux@googlegroups.com,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: [PATCH 00/16] x86, crypto: remove always-defined CONFIG_AS_* and
 cosolidate Kconfig/Makefiles
Message-ID: <20200325045940.GA24974@gmail.com>
References: <20200324084821.29944-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Masahiro Yamada <masahiroy@kernel.org> wrote:

> This series of cleanups was prompted by Linus:
> https://lkml.org/lkml/2020/3/12/726
> 
> First, this series drop always-on CONFIG_AS_* options.
> Some of those options were introduced in old days.
> For example, the check for CONFIG_AS_CFI dates back to 2006.
> 
> We raise the minimal tool versions from time to time.
> Currently, we require binutils 2.21
> (and we plan to bump it to 2.23 for v5.7-rc1).
> 
> After cleaning away the old checks,
> as-instr calls are moved to Kconfig from Makefiles.
> (patch 11)
> 
> This allows more Kconfig / Makefile cleanups.
> Patch 12 is complex, but I double-checked it does the equivalent.
> 
> Patch 14 bumps the binutils version to 2.23,
> and patch 15 removes more CONFIG_AS_* options.
> 
> I folded all relevanet patches into this series,
> as suggested by Jason A. Donenfeld.
> 
> If x86 maintainers take care of this series, that's good.
> 
> If it is OK to queue this up to Kbuild tree,
> I will send a pull request to Linus.
> 
> Thank you.

LGTM. I've got these four from Jason A. Donenfeld queued up in 
tip:WIP.x86/asm:

 bd5b1283e41c: ("crypto: Curve25519 - do not pollute dispatcher based on assembler")
 829f32d78588: ("crypto: X86 - rework configuration, based on Kconfig")
 95ef9f80ed63: ("x86/build: Probe assembler from Kconfig instead of Kbuild")
 1651e700664b: ("x86: Fix bitops.h warning with a moved cast")

I suppose these might interact (maybe even conflict), and are topically 
related.

Would you like to pull these into the kbuild tree? You can find them in:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/asm

Thanks,

	Ingo
