Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352782075DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 16:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390423AbgFXOlU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 10:41:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388652AbgFXOlT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 10:41:19 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 101E0C061573
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:41:19 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k6so1129509pll.9
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fbp7umasnXh+ke7N+beUAyOfPReUM2Tp6A+dzgB7eMs=;
        b=LdqUQaQQ73lvg2EH4zB5b0fAHY6pDsTgO5VkTlBIIFPTWFDt6KEfeGjsb0w6+bZ9Ow
         NITWE6F0NiNBcydTH1X5G5v/4LVNjJl2xkptnKSgFVRZwIBSdg7/4DIa9E/LMGsAb6fD
         enidR4CvnWPaAtnjb4zwOOo4tT4QsgRPZnifk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fbp7umasnXh+ke7N+beUAyOfPReUM2Tp6A+dzgB7eMs=;
        b=bHQLARdP45V5CAa5mEvul8vAZeVV7jYO3lyhvyRE/YyjtW8Z+YxvhGSbg/ulitmO/V
         3+J2CE2rLLqX8//6SxzPB7HIdvo5hiRz8evD840wgWtbU5g0Ysje54BwO8HDbri8Wivx
         s/ZRy/hbFtxD2Yz81QW71Tdnfu0w9jXVT/xBZTr2WxNKygn5jRMTR3/J/MnjhfUec1X+
         0gWlgDFacdHenq6ZGn17pU3qGyRudXoyIGoEMJkc4CSohX4y+Q8eHHVx9Mk9Wtn5KYFA
         FkefY+SbHZrddlVXCxJv/OWb2/Hq0mXWra6YWQrkn8t888K8muHOftVP59t/SJjZJACI
         OD5Q==
X-Gm-Message-State: AOAM533bnDm93Q0Qc2vYSfOdmutLuTGt8onhYGJrHl/8K7kmgDvs7Qxy
        breThNRvUM2P79rYepaSA/uBFQ==
X-Google-Smtp-Source: ABdhPJyLzb6qwq/8MBqHXf8uzinIy/tV8mWrOCrHPE7Fwn5qlWt9b5nzHsWE+x0soPiCSmy2JH0LLA==
X-Received: by 2002:a17:90a:7185:: with SMTP id i5mr2257473pjk.175.1593009678562;
        Wed, 24 Jun 2020 07:41:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s23sm15899769pfs.157.2020.06.24.07.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:41:17 -0700 (PDT)
Date:   Wed, 24 Jun 2020 07:41:16 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>, Jann Horn <jannh@google.com>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org
Subject: Re: [PATCH v2 5/5] gcc-plugins/stackleak: Add 'verbose' plugin
 parameter
Message-ID: <202006240740.5AF6369E53@keescook>
References: <20200624123330.83226-1-alex.popov@linux.com>
 <20200624123330.83226-6-alex.popov@linux.com>
 <20200624125305.GG4332@42.do-not-panic.com>
 <d7b118c1-0369-9aef-bd34-afc9bafc7e7b@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7b118c1-0369-9aef-bd34-afc9bafc7e7b@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 04:09:20PM +0300, Alexander Popov wrote:
> On 24.06.2020 15:53, Luis Chamberlain wrote:
> > On Wed, Jun 24, 2020 at 03:33:30PM +0300, Alexander Popov wrote:
> >> Add 'verbose' plugin parameter for stackleak gcc plugin.
> >> It can be used for printing additional info about the kernel code
> >> instrumentation.
> >>
> >> For using it add the following to scripts/Makefile.gcc-plugins:
> >>   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
> >>     += -fplugin-arg-stackleak_plugin-verbose
> > 
> > Would be nice if we instead could pass an argument to make which lets
> > us enable this.
> 
> This feature is useful only for debugging stackleak gcc plugin.
> 
> The cflag that enables it is similar to -fplugin-arg-structleak_plugin-verbose,
> which is used for debugging the structleak plugin.
> 
> This debugging feature clutters the kernel build output, I don't think that many
> people will use it. So IMO creating a separate argument for make is not really
> needed.

Yup, agreed. The precedent for plugin verbosity is via CONFIGs. They're
not really general purpose enough to justify a "make" argument.

-- 
Kees Cook
