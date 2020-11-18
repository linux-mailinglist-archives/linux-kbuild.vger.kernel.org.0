Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB5F2B749A
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Nov 2020 04:15:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgKRDNA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 22:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725613AbgKRDNA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 22:13:00 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBEBC0613D4;
        Tue, 17 Nov 2020 19:13:00 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id t5so673126qtp.2;
        Tue, 17 Nov 2020 19:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HgvttKSz6Ny3sSVlQN/E9G/7G2kWLjw/Bo0sdK0fdRk=;
        b=CWX89Bo+RFqfV61MMdOpdtn/KsRiAv0G0nWF2X55CWUA3vxzkGmwgNiYrMRFCHUiB/
         o0l8A6oe7FDsV+fo36st+m1IqF34qmR/K5FK0pDOVozjatjBMqp+aiaYhnVO0JMvUfmW
         97CpMbMaCSWeQsTkCc7Y5BqlIGPIRHqIJ8MMyLx0f2BZz29e282yoOJyhPQM7GjwI+0B
         XFIC5yRLu6obhArZoDhs4yD0XZ1ZfH5DHBWQytkK5H1wp0zeG5ZF5Fud9EKQk8dX9LqT
         PSdC1hq90vaC4bpCLuG0I8nY+S/q1MaNGb/xdIbbSpX8361oQ6V/d1/NUfKzZ9vwAtDU
         82Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HgvttKSz6Ny3sSVlQN/E9G/7G2kWLjw/Bo0sdK0fdRk=;
        b=rw828WykykCXs00F256H96zNgS8EXdNOnPID9lc18zYLEEeiF7ZxMVwOrubiO3bcWd
         xPjQHryXonyBGB7s9SwzDI9LB2KX+3Z5/nqA+FxxdaaoWdEI04KvJwuxFX/2rTuxH/i1
         +lyDv8rU6TgyQlVvxDjtCZyN0SecZwFWe4HRFYMlmya1m8O7U1PJ6AwmfdgUJE+SnP6X
         RwmRYTAZB/crSsPin4Lppb5DbEjg2dP8XFISjXp97eycNGop8N1PvnBRH+dr2trD2nXL
         a6q8JtnsdNSIhpD6pdOHrm5RCcvl/y+Ntwkzs+4TZ1ica9WYZLH+UKcyWvyZXtIlaj3o
         ZssA==
X-Gm-Message-State: AOAM530hthwsdJsWZHmXtj3Uaq8nZC1TqEsDR3ryysngA5lEMUdcD0Kx
        8698Qjf2nfwXaPd2oLG5rQc=
X-Google-Smtp-Source: ABdhPJzuIDnMCVG5Tuz116cq6Z1nlyfDBVH+eUiGr+rwEJQdkH3cFq7bPI+slF+97TRva76BZFWfMA==
X-Received: by 2002:aed:2051:: with SMTP id 75mr2388981qta.332.1605669179405;
        Tue, 17 Nov 2020 19:12:59 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id h11sm15438617qtr.13.2020.11.17.19.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 19:12:58 -0800 (PST)
Date:   Tue, 17 Nov 2020 20:12:57 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <20201118031257.GB1001457@ubuntu-m3-large-x86>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201113195553.1487659-2-natechancellor@gmail.com>
 <202011171350.F95127F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202011171350.F95127F@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 17, 2020 at 01:51:43PM -0800, Kees Cook wrote:
> On Fri, Nov 13, 2020 at 12:55:53PM -0700, Nathan Chancellor wrote:
> >  config LD_ORPHAN_WARN
> > -	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
> > +	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)
> 
> Readability nit-pick... I prefer separate "depends" lines to make things
> a little easier to parse, change, etc:
> 
> config LD_ORPHAN_WARN
> 	def_bool y
> 	depends on ARCH_WANT_LD_ORPHAN_WARN
> 	depends on !LD_IS_LLD || LLD_VERSION >= 110000
> 	depends on $(ld-option,--orphan-handling=warn)
> 
> Otherwise, yeah, looks good to me. With this and the other suggestions,
> please consider it:
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thank you, I have updated it locally for v2!

Cheers,
Nathan
