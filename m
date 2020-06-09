Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9A61F4693
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 20:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388763AbgFISre (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 14:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733165AbgFISrc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 14:47:32 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4277C03E97C
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2020 11:47:30 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id q24so1795259pjd.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2020 11:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uJfu7VCoabwyy7XV4REVbfqvINHE8jJHSSQxXyuHXd8=;
        b=RRs1XpvKUrWcGC9rIH96xpb3pTK7Sz9Y478qOvPHNO4RLX043gSI9fVBKTbIjskAsD
         NYVbHiStuO9ZNyJZjm0N/3IRfTEgzEFthkAy/Nt63yzoJ0aFhLDWR5b0DOgY+O1mRVuG
         TpNIJcS9r6syyH23xPO0c25GxRl4Du26VqrsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uJfu7VCoabwyy7XV4REVbfqvINHE8jJHSSQxXyuHXd8=;
        b=P/2dfGxkBmDiEwXVacL5ESiDy9dnuvGbATyT/ff+/H30QCqF3oTaxM6DYCfehW4tP/
         b57ixeROHl3B5vuHMfubj1oxsEup9ea1fkwmENjdyANvg1N9S0DeHhLr7Zus8sRaVLN+
         NA7JSY/iLN4uWv5YH4q08sExZV9TxeWuLHNRVGjsoKSJX7EAM0ITMY5W1LVcWfmcPcOg
         Ytak+dWoTFteMbwOwQzgXa+hCGIQtg1wea2ONJ6c+OVs1ctzvPggnUe8RWJal7vqSbFW
         U1ONXv+5N9M89xGSIC8gh5VNwyT9cvgg0ImrtRp3RVL+SYXX7/nUpGmaYFs1IePNRwjE
         4vbA==
X-Gm-Message-State: AOAM532hSebRVgbl0OIkKLr0vX63EYZSHLLGQzwedVGp5XGcNP7bUHEx
        sGwcBqtM/4sLFp4xFPii4AKZIQ==
X-Google-Smtp-Source: ABdhPJx/4VVBlneDG36Q/SLWPtFp+CtxwJnOIUCT1u2jRalyMTmf8uve0S/G2MJuu/H/na/+h9PhSA==
X-Received: by 2002:a17:90a:30a5:: with SMTP id h34mr6603724pjb.36.1591728450330;
        Tue, 09 Jun 2020 11:47:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f3sm3388976pjw.57.2020.06.09.11.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 11:47:29 -0700 (PDT)
Date:   Tue, 9 Jun 2020 11:47:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
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
Subject: Re: [PATCH 3/5] gcc-plugins/stackleak: Add 'verbose' plugin parameter
Message-ID: <202006091147.193047096C@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-4-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604134957.505389-4-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 04, 2020 at 04:49:55PM +0300, Alexander Popov wrote:
> Add 'verbose' plugin parameter for stackleak gcc plugin.
> It can be used for printing additional info about the kernel code
> instrumentation.
> 
> For using it add the following to scripts/Makefile.gcc-plugins:
>   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
>     += -fplugin-arg-stackleak_plugin-verbose
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
