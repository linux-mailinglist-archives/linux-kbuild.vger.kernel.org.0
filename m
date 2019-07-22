Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB03370B18
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 23:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730342AbfGVVPo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jul 2019 17:15:44 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44167 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729697AbfGVVPo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 17:15:44 -0400
Received: by mail-wr1-f67.google.com with SMTP id p17so40830286wrf.11;
        Mon, 22 Jul 2019 14:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=crKMdXKm0yhfd6kgwLJaqoMEk1zISLXs4pt7dLx4DM4=;
        b=QsBronzycOTGBRlgTUJewFHEs0Q6Hp3JmMAuhkKCDYigtQJ7U9CnEfU28gydAvRW7/
         xURrnwVKU6Qy2ej28Up9iAXXJUZRDzeBw0d3j7f0BOsCS2zWPwSuaeVtFljFpruZi3r3
         /3+A9jbi5l0noRSr1MqproZV+dXUMd4W0FlfKftgieeTeq9eYreiL5+jLBwRycJFD7bC
         sgrPUFXq6Jf9S3bZ5Vko1liRJVeNmVxCASGdNrzug54oMrtoSgL4LOPWzikmgj/XT5eH
         9G7Kb4VsQid9mtr1NYDP5tkqpGwhb3FYZotKSVt6buQeZrrgJ4/nZLJMj3trUnwJtGsG
         BOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=crKMdXKm0yhfd6kgwLJaqoMEk1zISLXs4pt7dLx4DM4=;
        b=H0ALL2j6Yc9lj8V5uimMxL5uk0lUfaPeIsm/vMm4vJzH4B/9l0fbhHAfXex34BGTKz
         +vdUVLSlhjxURZtZZfjTb5a3lqO/I2bz6ShzTyRYTucoiczCkskXoW0ksdq1JWizaYMT
         wwGo0euNvRtDQvJE0r4Aty6YiE+k5NdrI/Q6pOwr2AeOBDs30aJddsNf6xflXuG46lvB
         nCDhY/xhB8V1sqG3lt2YVpsjmtGN5NLzX9Bd6o77IQRGirM2EUmVMgNDRcCkL2PQKLYF
         AwvwhoQe9Wtzq4sWSjoJ+SPL1Iu805kGjLT0dG2g9zEJn3+bBScJJ3f4Aw4kuw4v4NTr
         Qq+A==
X-Gm-Message-State: APjAAAW23HktA2H9DrtDzOMmCCbdUr3SD4uMXivAZhODOrd3IjK2ycWM
        5GiBEzFrViXpSLh19kmVXw==
X-Google-Smtp-Source: APXvYqzdSBAMYwgWOibr6gFIJRcXsHprVu4TGfJ2odnSTDeies63zALht889LLUpzA+xIACrrZCivw==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr57089753wrv.146.1563830142580;
        Mon, 22 Jul 2019 14:15:42 -0700 (PDT)
Received: from avx2 ([46.53.253.254])
        by smtp.gmail.com with ESMTPSA id i66sm67233628wmi.11.2019.07.22.14.15.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 14:15:42 -0700 (PDT)
Date:   Tue, 23 Jul 2019 00:15:39 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: Re: [PATCH 2/5] x86_64, -march=native: POPCNT support
Message-ID: <20190722211539.GA29979@avx2>
References: <20190722202723.13408-1-adobriyan@gmail.com>
 <20190722202723.13408-2-adobriyan@gmail.com>
 <20190722211210.GN6698@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190722211210.GN6698@worktop.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 22, 2019 at 11:12:10PM +0200, Peter Zijlstra wrote:
> On Mon, Jul 22, 2019 at 11:27:20PM +0300, Alexey Dobriyan wrote:
> > Detect POPCNT instruction support and inline hweigth*() functions
> > if it is supported by CPU.
> > 
> > Detect POPCNT at boot time and conditionally refuse to boot.
> > 
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> > ---
> >  arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
> >  arch/x86/include/asm/segment.h                |  1 +
> >  arch/x86/kernel/verify_cpu.S                  |  8 +++++++
> >  arch/x86/lib/Makefile                         |  5 +++-
> >  .../drm/i915/display/intel_display_power.c    |  2 +-
> >  drivers/misc/sgi-gru/grumain.c                |  2 +-
> >  fs/btrfs/tree-checker.c                       |  4 ++--
> >  include/linux/bitops.h                        |  2 ++
> >  lib/Makefile                                  |  2 ++
> >  scripts/kconfig/cpuid.c                       |  7 ++++++
> >  scripts/march-native.sh                       |  2 ++
> >  11 files changed, 54 insertions(+), 5 deletions(-)
> 
> *WHY* ?
> 
> AFAICT this just adds lines and complexity and wins aboslutely nothing.

If CPU is know to have POPCNT, it doesn't make sense to go through RDI.
Additionally some CPUs (still?) have fake dependency on the destination,
so "popcnt rax, rdi" is suboptimal.
