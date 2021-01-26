Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C16304CF7
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 00:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731268AbhAZXAU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392154AbhAZR67 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 12:58:59 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3D3FC061788
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jan 2021 09:56:12 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id 11so10876917pfu.4
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jan 2021 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=49OfVhE6yUIYau/W+C0A+f0GHRQbjZMk200/UCnt3K8=;
        b=lm6Av3vx6keX17wsHI34YsUFn71zlQOVF/k29/xxOcx0wQNEBZBAJYjbXDsmult15O
         qEhk7RMn4rXh2Fwdha3zUWYBySxiLah6gS11Yoz+L6X61BLabG6+mrsn/fFmyNJW7VSW
         8W3kEOxyfsPXkINt/HGjvHIMOai4+4x9gIWUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=49OfVhE6yUIYau/W+C0A+f0GHRQbjZMk200/UCnt3K8=;
        b=RJU0KCDiQD53ZaQKaRfw8iFuQilt1BH9SlVuz5lTdmxZ/m4Ib1OgJWMRqlyoP3cFFX
         GMdrxCQ0bxB1I4/gsfBHup/xC/0MEwOiuvGovezmo28xeifp6bCT2KwpxOsoNnjBVkQI
         S6HE6gc8sdwmxKJWIGqfUDCENcF/6Maf5hmsrp2FvNAbrCDHzyAXIIyQs6s7tcXjbKbz
         6eZlEKgAbubq1p990tEl+vMxpJRuZ84vT2eUVVqi7QUvDiYUqPNAjFg5P574yUOkZJy1
         m7W/tzRDTOZaOf/Fny/vc/KFKXpY7CapsKuDfe4UEgXJnGbj8RXORhdy5IvdWDaW4MU0
         zf3A==
X-Gm-Message-State: AOAM530DQDpbb52LCCnITWPefJwOBW2OJ4pPzynNORSzCUyLRVuBLfhk
        cYpdJCOh+8r/vjBX0IVkeWqffQ==
X-Google-Smtp-Source: ABdhPJw4hSgbw4HDAJRlyJdZcMFq3MdSNUNHP0bouDMZZWMFMNRrbouvqLSWcwnQkUMvsOmc+Joy1A==
X-Received: by 2002:a63:db0d:: with SMTP id e13mr6714733pgg.343.1611683772344;
        Tue, 26 Jan 2021 09:56:12 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x14sm20060251pfj.15.2021.01.26.09.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 09:56:11 -0800 (PST)
Date:   Tue, 26 Jan 2021 09:56:10 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <202101260955.F83D191B@keescook>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <202101251401.F18409FDD1@keescook>
 <20210125221953.wng3gk3qc32eahil@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125221953.wng3gk3qc32eahil@treble>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 25, 2021 at 04:19:53PM -0600, Josh Poimboeuf wrote:
> On Mon, Jan 25, 2021 at 02:03:07PM -0800, Kees Cook wrote:
> > On Mon, Jan 25, 2021 at 02:42:10PM -0600, Josh Poimboeuf wrote:
> > > When a GCC version mismatch is detected, print a warning and disable the
> > > plugin.  The only exception is the RANDSTRUCT plugin which needs all
> > > code to see the same struct layouts.  In that case print an error.
> > 
> > I prefer this patch as-is: only randstruct needs a hard failure. The
> > others likely work (in fact, randstruct likely works too).
> 
> I'm curious about this last statement, why would randstruct likely work?
> 
> Even struct module has '__randomize_layout', wouldn't basic module init
> go splat?

No; the seed is part of the generate includes -- you'll get the same
layout with the same seed.

-- 
Kees Cook
