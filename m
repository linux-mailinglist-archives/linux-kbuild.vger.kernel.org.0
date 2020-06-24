Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5A6207E81
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 23:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403789AbgFXV3K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 17:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403837AbgFXV3J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 17:29:09 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA67DC0613ED
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:29:09 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t6so2095490pgq.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8S7wdQVFSvGinNDpzeGeM5bOvAIHO3+dn7qtS4xKvV8=;
        b=QSb2yx30HozPwbE3cmDUoYnn/m54tkj1kAjJCdgJUPE9p9hcmMPBKaVPQ8nq6Bc1WJ
         qB9goQOthKh59QOfHEOB0pjBNCmP4PYV/LKAx2CJEjeYgcYLuigmtDK1rd0z3GBirbjf
         QT7+7vbSd+q2ZOzjXvTocpYNfGsOGa/P0watDoU+3ObHezue05cXmufnhVEm5Q3ZZmTa
         XCjrJbaX5IO0+0GeI80gfIvjmkaMIwYTVrZh2tjnwzLuU1tncROVGCLiilpUzqVPfzKM
         RIHYMVRhw56vrkubCQ6vuKEMInx200lTXE2eT3cyIagXjOxlrxuHoW9NFhenw6ZcgEPv
         QI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8S7wdQVFSvGinNDpzeGeM5bOvAIHO3+dn7qtS4xKvV8=;
        b=iN+KmS3okUHdHqo+UCqbG/nl2WIibelUtJ5PxdD4aJ/fqDUFJDPP97D+0eUwB3Y/MA
         NT/M+3YQH3cW7ygaZG2yqT7xSlmrtB/67N/E8C3ZtU8p9YFDTItnROrZ/e7x6UGQXVWV
         Fss+bygUh97hUfk4Gywrrso4cQIXrTavxne9WoRWWvrwwbDpn54d9wjSJ+H6FhVuBhxz
         U85Cn7MFlzXXbT6KqhXvtGl64RssId+Qr5XG8g/REW1TjznGSnllckmePUA+pEiCzId1
         Fc4cVZGnesr8MFFEe04kpx+W6vJf025V3odJQpRD3odIHI+6MuyofQ/k3h4Z+d8aws75
         Kscg==
X-Gm-Message-State: AOAM530SO4lHln03Ez1VMDergrBU4THf+hRz1U7K1us6triN1ROtVvqn
        IeTvgCOEUzJrWpxkYaEvN9/P0A==
X-Google-Smtp-Source: ABdhPJzNztQf4xK5/Zlp8kovh17ym7/QBwLnR6UiKFeUru/SjadRA2bRjfkD85Hht24sZeCqpm8n5Q==
X-Received: by 2002:a63:79c2:: with SMTP id u185mr6299836pgc.84.1593034148817;
        Wed, 24 Jun 2020 14:29:08 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
        by smtp.gmail.com with ESMTPSA id q1sm22211040pfk.132.2020.06.24.14.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 14:29:08 -0700 (PDT)
Date:   Wed, 24 Jun 2020 14:29:02 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: [PATCH 02/22] kbuild: add support for Clang LTO
Message-ID: <20200624212902.GA26253@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200624203200.78870-3-samitolvanen@google.com>
 <CAKwvOdm=sDLVvwOAc34Q8O85SCHL-NWFjkMeAeLZ4gYRr4aE9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdm=sDLVvwOAc34Q8O85SCHL-NWFjkMeAeLZ4gYRr4aE9A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 01:53:52PM -0700, Nick Desaulniers wrote:
> On Wed, Jun 24, 2020 at 1:32 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > diff --git a/Makefile b/Makefile
> > index ac2c61c37a73..0c7fe6fb2143 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -886,6 +886,22 @@ KBUILD_CFLAGS      += $(CC_FLAGS_SCS)
> >  export CC_FLAGS_SCS
> >  endif
> >
> > +ifdef CONFIG_LTO_CLANG
> > +ifdef CONFIG_THINLTO
> > +CC_FLAGS_LTO_CLANG := -flto=thin $(call cc-option, -fsplit-lto-unit)
> 
> The kconfig change gates this on clang-11; do we still need the
> cc-option check here, or can we hardcode the use of -fsplit-lto-unit?
> Playing with the flag in godbolt, it looks like clang-8 had support
> for this flag.

True, we don't need cc-option here anymore. I'll remove it, thanks.

> > +KBUILD_LDFLAGS += --thinlto-cache-dir=.thinlto-cache
> 
> It might be nice to have `make distclean` or even `make clean` scrub
> the .thinlto-cache?  Also, I verified that the `.gitignore` rule for
> `.*` properly ignores this dir.

Sure, distclean sounds appropriate to me.

Sami
