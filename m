Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E271F4699
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 20:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730434AbgFISsL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 14:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgFISsL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 14:48:11 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DE91C03E97C
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2020 11:48:10 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i4so1795314pjd.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2020 11:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j2PL+pbfi1kh+J0AmLH2dyW1hfo8dchWmGFi/N5y4y0=;
        b=doetDBC8GLhAH/GPYh2nF/OZwCESJtT3x/5JwmFQppNQJr5rFhUwRcyR9FtefDzGs1
         RdTitQklosNO5HKOvlQUQJc+B3qoYVCfPRU7nKjg3lVc0+kFRfhloN8Q1BIilhESUAsl
         UifY/flT3XKb72YemuUE0ejI83VnmR69D+rOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j2PL+pbfi1kh+J0AmLH2dyW1hfo8dchWmGFi/N5y4y0=;
        b=RgvBLaTwz9ypoB9tOOI14REJlc2yjBie20yW8A6mLWFJXJAGD4LQVhNUWT+HwNHKyM
         L9khE7KWgW/dsO8YDbWIffBUKBjawZDTH3feiV4poCEZPIovurTzTPq64eYW14YQY5VV
         NP7Tv3Ie2YGW3vIk0qhdbAQNI1Fq8Yfz0rubcZ/wK0f32TSIuq30IvCtzZfTmI/SWiGF
         qXCQ84hAh1+clQHe8kGhA1nU79VQREy77v/JM670JRT4v1KcPljS1epFHnE2nqDHTGt5
         Q5eA7Llf63yCJ+6qg22FnnLYtMXabptw9aHPJhBKv1vN9fRPaJ9j/ls8urODUPSQw8U0
         /wGA==
X-Gm-Message-State: AOAM5323uTxVm7NS/5Jm6snjH9IQTuIOCOspqRuhs9VLKalmyN3S3JkM
        +ZpHIEO9zQLbrQPvAfWVAfn+mg==
X-Google-Smtp-Source: ABdhPJyddt1fAWGutCRi8Fa6NrDKr2oQjU7wdUGjNSxmmyNx0/oNHsTyK+GsePEnmx8lD9WMuMMOGA==
X-Received: by 2002:a17:90a:2647:: with SMTP id l65mr6474171pje.20.1591728489562;
        Tue, 09 Jun 2020 11:48:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j13sm3223850pje.25.2020.06.09.11.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 11:48:08 -0700 (PDT)
Date:   Tue, 9 Jun 2020 11:48:07 -0700
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
Subject: Re: [PATCH 4/5] gcc-plugins/stackleak: Don't instrument itself
Message-ID: <202006091147.1B8E3ABE@keescook>
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-5-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604134957.505389-5-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 04, 2020 at 04:49:56PM +0300, Alexander Popov wrote:
> There is no need to try instrumenting functions in kernel/stackleak.c.
> Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
> is disabled.
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
