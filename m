Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 375FA25CE6C
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 01:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728271AbgICXiY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 19:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727804AbgICXiW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 19:38:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D28C061244
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 16:38:22 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s2so2196216pjr.4
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 16:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vpMIvEwuRSqC+Z+zTJmdoPgPG+oL4Eop2jtb25EWWgk=;
        b=gvG6wFPNF0Tcin4Ap2mhko2aiVRBSXzp1p2mlklenZECv4SocSBp+jn3VNJMansFKr
         OiZX2u7WDwqU4iPvPk8YmYriiePKsJQyUZuud8Bhv0KORwFRgLPlXNkRLZ2trFWXd5Y/
         oOBfwOcv/SeeoHkG8Ef4WwrqpQReE8/Tx8zcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vpMIvEwuRSqC+Z+zTJmdoPgPG+oL4Eop2jtb25EWWgk=;
        b=LSPUsywG8N8N78iMs0Jhf1+aaG1RkfBEg07I3bm7SvhP5J87zu99iQA4ZYyAYlnbAV
         uwKzTqSz2KERqoI20olTsIJPJHA9Yfrt4O6f3d3GH5sRyArCCVhQirILoEboMpEgYpRH
         0/K+9m9Kv+5FE3dJVJ2aU5epDBx8e1v1oa32XMOJ3WlLRE/vvmSHrJ0dinFEimR50dl8
         ksfQPhvq5T5jznYAsc4RCMCasl1EBPsMxAKdxR4T/Kap6/BIGFxeHKO/uBa564M6MtZo
         nsXixXGQIjyamuzvd2vEZBMhBg+pTC7K2lofqzSIIlgHz9OWz72aIWqQacDjcmiA3vhy
         MYQw==
X-Gm-Message-State: AOAM531H0m8qYgR1iXMBd5T339ByWaBevHTs32/T5Pj9bv5hYPLnZaBc
        jHhmiScr3q+BE5LQVExLaxfKrQ==
X-Google-Smtp-Source: ABdhPJyiZpxHVqfKKsHge2peFlT0tOhsV4ucarLlAr1ffPxhOv0TOSI8XtiKBiFflmROB6YHqiVGkg==
X-Received: by 2002:a17:90a:d514:: with SMTP id t20mr5116667pju.134.1599176301506;
        Thu, 03 Sep 2020 16:38:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z66sm4420212pfb.53.2020.09.03.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 16:38:20 -0700 (PDT)
Date:   Thu, 3 Sep 2020 16:38:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 00/28] Add support for Clang LTO
Message-ID: <202009031634.876182D@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:25PM -0700, Sami Tolvanen wrote:
> This patch series adds support for building x86_64 and arm64 kernels
> with Clang's Link Time Optimization (LTO).
> [...]
> base-commit: e28f0104343d0c132fa37f479870c9e43355fee4

And if you're not a b4 user, this tree can be found at either of these places:

https://github.com/samitolvanen/linux/commits/clang-lto

git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git kspp/sami/lto/v2

-- 
Kees Cook
