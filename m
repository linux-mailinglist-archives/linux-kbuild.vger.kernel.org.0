Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD8F3611B3
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 20:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbhDOSI7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 14:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbhDOSI7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 14:08:59 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60A5C061756
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 11:08:35 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id t22so12207427ply.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZmIKFqUHduSAESy/4PeOU4GLOIssUo9k0MhB+rtUuxQ=;
        b=PAAA1ea9mxCTLUm8rMnTT5Bz5uVDe7aIm2+CS58Eq71KP7XnCrvhijNuLJxuEe90BQ
         gv101TXrm7o+GZO8H1bHUb13ljxphmsan9DDXjQ0mfKtiflDz8G3FoWYhAmlLYtJamNC
         AfRa4VoecAaE7wasorSg+6yvy22JlDtKF7w/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZmIKFqUHduSAESy/4PeOU4GLOIssUo9k0MhB+rtUuxQ=;
        b=EMWZRnfPHe7maip4qBrlz+6Mf36OCefrv0phj6TcJNql2BcAB689ny7960wceYzIiW
         rZheoL7HW8JyWK/+jfvjOFX7ZyZYghAesyDFrEIYiTmne56B052iBTcItaydeBCHgtSd
         xZInPGajCwR9kjyTfBLFIYP9j8PahlhjdvQWYUhSJD2Lf81ZGBNL/oiOzsq/4gwyI7GH
         mG0WmANaYOU+2Fn+097f8T+G4IsNRQbJNfzthnZfPaj4zkzAYnFNyZNeEJUJ/7gZtErL
         gS8GCiB1E5fpoUrhc5j+fSjU05yjgcEzySinxwZ2VRlax1AHWoOMexfXjGk3dU0KewlS
         8bFQ==
X-Gm-Message-State: AOAM533Xf/cnDVXIm9h7+0+ZVEfgoGfxKw9PvQ6E5Iv8+Nsj//qvcOHP
        Iv8cIN94eOctkeuv/ZNJUED4IxjKEpXkhQ==
X-Google-Smtp-Source: ABdhPJwV/iOPwRirOtIF2WPN0bS+rgljCqrBIoMJMtQGrpGIZKfWvo2Q4gixIqblVzkxGsqtn16B8g==
X-Received: by 2002:a17:902:eec5:b029:ea:bffe:2b06 with SMTP id h5-20020a170902eec5b02900eabffe2b06mr5413492plb.8.1618510115438;
        Thu, 15 Apr 2021 11:08:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x194sm2993217pfc.18.2021.04.15.11.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 11:08:34 -0700 (PDT)
Date:   Thu, 15 Apr 2021 11:08:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <202104151107.8E3D919@keescook>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
 <CANiq72mSMtfdRFPGJKuoqCBFdsa_xHvx9ATjcB7QSunQdDHBuw@mail.gmail.com>
 <202104141820.7DDE15A30@keescook>
 <8eaa65020c0d44ed9122fed5acf945a0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eaa65020c0d44ed9122fed5acf945a0@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 08:26:21AM +0000, David Laight wrote:
> ...
> > Besides just FP, 128-bit, etc, I remain concerned about just basic
> > math operations. C has no way to describe the intent of integer
> > overflow, so the kernel was left with the only "predictable" result:
> > wrap around. Unfortunately, this is wrong in most cases, and we're left
> > with entire classes of vulnerability related to such overflows.
> 
> I'm not sure any of the alternatives (except perhaps panic)
> are much better.
> Many years ago I used a COBOL system that skipped the assignment
> if ADD X to Y (y += x) would overflow.
> That gave a very hard to spot error when the sump of a long list
> way a little too large.
> If it had wrapped the error would be obvious.
> 
> There are certainly places where saturate is good.
> Mostly when dealing with analogue samples.
> 
> I guess the problematic code is stuff that checks:
> 	if (foo->size + constant > limit) goto error;
> instead of:
> 	if (foo->size > limit - constant) goto error;

Right. This and alloc(size * count) are the primary offenders. :)

-- 
Kees Cook
