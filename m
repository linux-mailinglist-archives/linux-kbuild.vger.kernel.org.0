Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3E025CE03
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 00:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgICWpj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 18:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729464AbgICWpe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 18:45:34 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3E5C061244
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 15:45:33 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e33so3290245pgm.0
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 15:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LpH2+c3Q5/rnXgDQMsrsJ9HiSsfoyzj1qvyyccEruIs=;
        b=Zx5KJ4dvVR2kYJ0RF1K2y79qhIcjc7yrsCRJoTz5s2zCxiKL8II6gShD3dRiuI5JuE
         CAqlIg/RCYIqxwgBTCdJCoxlCyAR33IC7dws/kSOZM0OWTmWQqku5KG5vBN3wHaXWX2J
         L3kWlvlx6YmS4Z9tOt3VwHxiD169ei5sQPoz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LpH2+c3Q5/rnXgDQMsrsJ9HiSsfoyzj1qvyyccEruIs=;
        b=b7g8KH1YQXADrQUDWWDNpA5kEk/o7p7ioPWM3J5sxyRfo/W88r2soejPSmxR5zhetT
         PQNDuVEF0IKCUU6t2XH8mxn64nX7niUAgs6cCSOqKCcnrtc4YKid4xjQdjledtbr5tkK
         f5oSJBElAiuNWHSJ6FYPC4oirMZiTdBT9ga/Zz6iLEgcQ4GrRS4o06YedEvUFdSqM+VF
         JhMD2xsbdDQX5NtiyLQAFTNwXXOuUJyhbmcBmW3WSRFJyl5Dd8/++rAy2HSoI/SMg8/5
         KR4ARqP/U6fDlTvt1cgKb8D1zf+JARdKDb/GTBwxuV3/pJpsaJZJ4FkvmngcEifuD0pe
         RsiA==
X-Gm-Message-State: AOAM531M1PiegBf8Im7ewU4WzvWwwX3pF0FRi0ElklCWk0GQ+j0ulGTe
        +kuMVEaWDjZOOLz/bXKUzsoDrj8FCUHp2w==
X-Google-Smtp-Source: ABdhPJw+gsOOUY6Clu21aqvi2zeFtbK32caDaCf93/U25KjvZIefQe4UypsHJhKhOKzenMYzI/0+7Q==
X-Received: by 2002:a17:902:82c7:: with SMTP id u7mr1398150plz.240.1599173133340;
        Thu, 03 Sep 2020 15:45:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r123sm4320262pfc.187.2020.09.03.15.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:45:32 -0700 (PDT)
Date:   Thu, 3 Sep 2020 15:45:31 -0700
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
Subject: Re: [PATCH v2 24/28] KVM: arm64: disable LTO for the nVHE directory
Message-ID: <202009031545.42ECDC8F7F@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-25-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-25-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:49PM -0700, 'Sami Tolvanen' via Clang Built Linux wrote:
> We use objcopy to manipulate ELF binaries for the nvhe code,
> which fails with LTO as the compiler produces LLVM bitcode
> instead. Disable LTO for this code to allow objcopy to be used.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
