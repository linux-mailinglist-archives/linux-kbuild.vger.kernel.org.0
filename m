Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E31BF207E8C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 23:30:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403941AbgFXVaX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 17:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403933AbgFXVaW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 17:30:22 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95EB1C061795
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:30:22 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 207so1646422pfu.3
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BLAueZueQmLo+U3ff1yWRTxI4RTBZr5ie/D1r3LUxVk=;
        b=UTpKVD20ozvTdWMRMhXjRuDa7E6nhyfuuFzbPsLPOJkgDHZzpnipT7xh2/Wno0v2Oq
         jdpABPkcKmrg491zzfi9zOks98eQJaOLDTz406Z4w2MgG351GRHcHMzGWpNAyEJdLecz
         ji/dnLP69LQeXVwamBUI0SmjGSavdPaLzdKRaDqcWl5xT7zXOVfMtWSCERwyPWhmuC8a
         4KDq5FM9YdU0RrraXVR/hGh5TC7cw1r0O3lilGh9m2vHjgmv1WKElLUiabdJW2m76HZC
         7iRUNTtGTKyZS7schzBZuKhvkys5qQmNg4oE6XUh6jUFgmi+eFh4EE769mR4zWRz8YdS
         PQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BLAueZueQmLo+U3ff1yWRTxI4RTBZr5ie/D1r3LUxVk=;
        b=YbRB5CPEcxCO6uhTG5b05SorUos4OxcccdrrH2uIW5K2b1x0pk8bhYhsy1Rug/3o0K
         dcRPBYnQvNYjfoVz4sYzgD5MGmDZP5jbSa6/FX6nlG07AYuWpJ/vhPJlH2YYrUgNDMKg
         kYj9OlIdKDgXBbt+pdcIXgZEds0Cmk8U6FfaT9i74BpeyW/uI4aUA299oj72QjzSGhGz
         iMW5fqF71ACm500QWHYHQRZw8yFYDvXbNX/eo5I7jbsrrTVFab7ObwUJtxdwQDcLFfOL
         +Eoi1ouvqlQml2S6EUPXBo0ruqq3AlxuY54RDjkRtuNOnFvZWEnFHYgW9MCsL8gm4z66
         Cndw==
X-Gm-Message-State: AOAM532yyxHYb7JEhVFak4L9IgKHNhwa7TgZJljMqnsRfDnHOy1JNCE5
        rVLzUa/dY8LDHRpRpQSh9cn27Q==
X-Google-Smtp-Source: ABdhPJxhxSeUIX3+whzU3DS6SVAWzNuff6r9HMO0IkuALFVi/g2AiuvayCKmK1FcYKc9xkjwmkX3MQ==
X-Received: by 2002:a65:6393:: with SMTP id h19mr6687231pgv.278.1593034221896;
        Wed, 24 Jun 2020 14:30:21 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
        by smtp.gmail.com with ESMTPSA id g17sm6052460pju.11.2020.06.24.14.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 14:30:21 -0700 (PDT)
Date:   Wed, 24 Jun 2020 14:30:14 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH 00/22] add support for Clang LTO
Message-ID: <20200624213014.GB26253@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200624211540.GS4817@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624211540.GS4817@hirez.programming.kicks-ass.net>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 11:15:40PM +0200, Peter Zijlstra wrote:
> On Wed, Jun 24, 2020 at 01:31:38PM -0700, Sami Tolvanen wrote:
> > This patch series adds support for building x86_64 and arm64 kernels
> > with Clang's Link Time Optimization (LTO).
> > 
> > In addition to performance, the primary motivation for LTO is to allow
> > Clang's Control-Flow Integrity (CFI) to be used in the kernel. Google's
> > Pixel devices have shipped with LTO+CFI kernels since 2018.
> > 
> > Most of the patches are build system changes for handling LLVM bitcode,
> > which Clang produces with LTO instead of ELF object files, postponing
> > ELF processing until a later stage, and ensuring initcall ordering.
> > 
> > Note that first objtool patch in the series is already in linux-next,
> > but as it's needed with LTO, I'm including it also here to make testing
> > easier.
> 
> I'm very sad that yet again, memory ordering isn't addressed. LTO vastly
> increases the range of the optimizer to wreck things.

I believe Will has some thoughts about this, and patches, but I'll let
him talk about it.

Sami
