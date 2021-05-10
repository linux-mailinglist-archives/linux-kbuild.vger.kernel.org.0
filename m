Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519C737998C
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 May 2021 00:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhEJWC4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 May 2021 18:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232969AbhEJWCz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 May 2021 18:02:55 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DF1C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 10 May 2021 15:01:50 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id g24so10560860pji.4
        for <linux-kbuild@vger.kernel.org>; Mon, 10 May 2021 15:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BAGXbgtOInVvsHZpVuAqMybD0uRLdM/JqMALasSOnAc=;
        b=VZkVqOZUOnMCFIdqMEc/Kysr+ADmyjsmb1us3d3Ef1XziLCLG/OdsyjIp2I/g4xWll
         eeGor7fhXg2N3UOSZ1HMm4vG8Ire2L3EDXyKIu0DnXgoaNA9rJ4xOojyPlwUd92vITjA
         Fvip0FrRWnQE4GfkJhhVN4cMIgLy5HoSQTf5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BAGXbgtOInVvsHZpVuAqMybD0uRLdM/JqMALasSOnAc=;
        b=Tk/5Bt4mrBJqOAuWSljfKT/kj6bYZAKl7cQOnlIjE8+xw6i5BHIQqPS+9ONuGi1bmn
         fvTuMXrgpx4r7r5I7NPeyyBj7gwcU1SfmFH/u+9kPL7KbU4pX/daXxJwg1Cg2FReedls
         OR6FL8TH3KKbcOTVIzVR0CYB89mODi+Lrqxzjjkmzr9KGjn2B1A7Hc3T1efGGhqRGMBT
         DhuJqhzP6w4Nn1mpLPuowebkSUkuhJHVccEBu59WLx8VNWtZLPCvPBzhRapgSu5WhWyN
         fyCOPgOMkBIhLrf+lWoRZ3LLxtbcb33yh9pAby5o7Z4bQVjohBW4hPQhYuuwnAHgvekm
         eqAg==
X-Gm-Message-State: AOAM5318lYG38oMbIuY7vcSYBgSYIjixidEvEMX3DobU5KCa4ge19MiY
        Qo5NksR07/FJETzjphGgEFRyQw==
X-Google-Smtp-Source: ABdhPJwoMMjFMvL0opX9raJe5uGRuq7KFgGPbwdNAr58huQ+4qEPlK567D49oe7QzlaTT1LJpyARwQ==
X-Received: by 2002:a17:90a:7e8f:: with SMTP id j15mr30844655pjl.19.1620684109887;
        Mon, 10 May 2021 15:01:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s64sm7848831pfs.3.2021.05.10.15.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:01:49 -0700 (PDT)
Date:   Mon, 10 May 2021 15:01:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     linux-hardening@vger.kernel.org, Qing Zhao <qing.zhao@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] Makefile: Introduce CONFIG_ZERO_CALL_USED_REGS
Message-ID: <202105101458.EC466299@keescook>
References: <20210505191804.4015873-1-keescook@chromium.org>
 <20210506125457.GA34956@C02TD0UTHF1T.local>
 <202105061416.3CB40BE5@keescook>
 <20210510134503.GA88495@C02TD0UTHF1T.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510134503.GA88495@C02TD0UTHF1T.local>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 10, 2021 at 02:45:03PM +0100, Mark Rutland wrote:
> About 31% of this seems to be due to GCC (almost) always clearing x16
> and x17 (see further down for numbers). I suspect that's because GCC has
> to assume that any (non-static) functions might be reached via a PLT
> which would clobber x16 and x17 with specific values.

Wheee.

> We also have a bunch of small functions with multiple returns, where
> each return path gets the full complement of zeroing instructions, e.g.
> 
> Stock:
> 
> | <fpsimd_sync_to_sve>:
> |        d503245f        bti     c
> |        f9400001        ldr     x1, [x0]
> |        7209003f        tst     w1, #0x800000
> |        54000040        b.eq    ffff800010014cc4 <fpsimd_sync_to_sve+0x14>  // b.none
> |        d65f03c0        ret
> |        d503233f        paciasp
> |        a9bf7bfd        stp     x29, x30, [sp, #-16]!
> |        910003fd        mov     x29, sp
> |        97fffdac        bl      ffff800010014380 <fpsimd_to_sve>
> |        a8c17bfd        ldp     x29, x30, [sp], #16
> |        d50323bf        autiasp
> |        d65f03c0        ret
> 
> With zero-call-regs:
> 
> | <fpsimd_sync_to_sve>:
> |        d503245f        bti     c
> |        f9400001        ldr     x1, [x0]
> |        7209003f        tst     w1, #0x800000
> |        540000c0        b.eq    ffff8000100152a8 <fpsimd_sync_to_sve+0x24>  // b.none
> |        d2800000        mov     x0, #0x0                        // #0
> |        d2800001        mov     x1, #0x0                        // #0
> |        d2800010        mov     x16, #0x0                       // #0
> |        d2800011        mov     x17, #0x0                       // #0
> |        d65f03c0        ret
> |        d503233f        paciasp
> |        a9bf7bfd        stp     x29, x30, [sp, #-16]!
> |        910003fd        mov     x29, sp
> |        97fffd17        bl      ffff800010014710 <fpsimd_to_sve>
> |        a8c17bfd        ldp     x29, x30, [sp], #16
> |        d50323bf        autiasp
> |        d2800000        mov     x0, #0x0                        // #0
> |        d2800001        mov     x1, #0x0                        // #0
> |        d2800010        mov     x16, #0x0                       // #0
> |        d2800011        mov     x17, #0x0                       // #0
> |        d65f03c0        ret
> 
> ... where we go from 12 instructions to 20, which is a ~67% bloat.

Yikes. Yeah, so that is likely a good example of missed optimization
opportunity.

> We have a bunch of cases like the above. Also note that per the AAPCS a
> function can clobber x0-17 (and x18 if it's not reserved for something
> like SCS), and I see a few places that clobber x1-x17.

Ah, gotcha. I wasn't quite sure which registers might qualify.

> [...]
> That's 441301 new MOVs, and the equivalent of 442511 new instructions
> overall. There are 135728 new MOVs to x16 and x17 specifically, which
> account for ~31% of that.

I assume the x16/x17 case could be addressed by the compiler if it
examined the need for PLTs, or is that too late (in the sense that the
linker is doing that phase)?

Regardless, I will update the documentation on this feature. :)

-- 
Kees Cook
