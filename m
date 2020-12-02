Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8649C2CC607
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 19:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389691AbgLBS5g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 13:57:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387784AbgLBS5d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 13:57:33 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67EC4C0613CF
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 10:56:47 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id n10so1486540pgv.8
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 10:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2df0cgPfG2SAK1g7NT0O8N+0jOgAdMPH5rFcEcsmtzM=;
        b=Cu7Xt7Qn/3aPgdAkS2syTqxV41qdValgrBZYQqryrysoVtGdgBLW1Umm+ymeWh5B7+
         kZqrtKf1iwCkHCjz0PqySSBrzAlqEGJUcEnELClsLXBywkDw+tIHAGkRJUpSf4r5si2X
         U71QWOp65achEjowERhc1Pgww2DGhtmolmAck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2df0cgPfG2SAK1g7NT0O8N+0jOgAdMPH5rFcEcsmtzM=;
        b=tOJKEFpcsgy8BB2AiIpwVVFuMqkkkAat80nykBTZ5/zpLLEuTCgjQIWKuDOK+7Xz2/
         gs9lD7wF83AH+gjHq8GYmP61soHCYd3pPZHzk2vnWNc0d1xFs9cEDQkdrqI4puNjli0k
         smMJCGKhsJ3LnrnoLyN4rtWzFp55Fge4uKYPil9DmNe5HHMgnoFuvxL2CqUyU6HtwUJx
         KXKk3f+JTFM95wQVCp+q/KQYYrBVojdr56qi/O4/F8q6ExDMKBes3rDRU+97Tguh+Q9C
         AizSqwk/2jQRfz57kxOFYAHWY5Wv8b0djLco3JHZ1MVQ3Z8RoufImD//xN9oAlAdk7Hw
         NH2Q==
X-Gm-Message-State: AOAM533T499FXWHXGaUgbSvrUTqwBrlUgNzrSmFIQQojAFYYGBx6yi6Z
        LkEpw8aPPN83qR9DrNSv6DWocA==
X-Google-Smtp-Source: ABdhPJwDihIdf9Kj1zww9pUzlRPKReVIPkPu886DIRfJAubQGRXMJaWo5MU1jtqDrgcMhi9+DatHIQ==
X-Received: by 2002:a63:f308:: with SMTP id l8mr1179038pgh.68.1606935406993;
        Wed, 02 Dec 2020 10:56:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u3sm512394pfu.47.2020.12.02.10.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 10:56:45 -0800 (PST)
Date:   Wed, 2 Dec 2020 10:56:44 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <202012021056.3EA0BBFDD@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
 <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
 <202011241421.A2F3062A70@keescook>
 <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
 <202012011255.9D677ED3@keescook>
 <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 02, 2020 at 11:37:38AM +0900, Masahiro Yamada wrote:
> On Wed, Dec 2, 2020 at 5:56 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Dec 01, 2020 at 10:31:37PM +0900, Masahiro Yamada wrote:
> > > On Wed, Nov 25, 2020 at 7:22 AM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> > > > > On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> > > > > <natechancellor@gmail.com> wrote:
> > > > > >
> > > > > > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > > > > > along with a few others. Newer versions of ld.lld do not have these
> > > > > > warnings. As a result, do not add '--orphan-handling=warn' to
> > > > > > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> > > > > >
> > > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > > > > > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > > > > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > > > > Reported-by: Mark Brown <broonie@kernel.org>
> > > > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > >
> > > > > Thanks for the additions in v2.
> > > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > >
> > > > I'm going to carry this for a few days in -next, and if no one screams,
> > > > ask Linus to pull it for v5.10-rc6.
> > > >
> > > > Thanks!
> > > >
> > > > --
> > > > Kees Cook
> > >
> > >
> > > Sorry for the delay.
> > > Applied to linux-kbuild.
> >
> > Great, thanks!
> >
> > > But, I already see this in linux-next.
> > > Please let me know if I should drop it from my tree.
> >
> > My intention was to get this to Linus this week. Do you want to do that
> > yourself, or Ack the patches in my tree and I'll send it?
> 
> I will send a kbuild pull request myself this week.

Okay, thanks! I've removed it from my -next tree now.

-- 
Kees Cook
