Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A85D397CC8
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 00:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234981AbhFAW5R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Jun 2021 18:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234908AbhFAW5Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Jun 2021 18:57:16 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5E4EC061574
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Jun 2021 15:55:33 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id f22so722197pfn.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jun 2021 15:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q4W+RK/UiZcP5P0EH3Iqdu3xr4J+8uHojy7d0BiHPOs=;
        b=K4sAZIjojCaVRqT19cKzjJjekM/E2k55Fz+Lx+6O2Gj8Bhhtk4dxz+77Ls/pahp8nc
         C5FG0KnJGCq/A2tw3323CuxbBIAsfE0CvdIMyUQLWCBovrSpK8DGHD4IEH0ERo6JZnY5
         H3EWjFP5YcYR1aicQH6gMgF2spNmUHE+rvSMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q4W+RK/UiZcP5P0EH3Iqdu3xr4J+8uHojy7d0BiHPOs=;
        b=s5IZY92gEsLRs89d6+sAgjwal/8+OLHm2CfuSpUn4elZDeLKQ8LMSkU1z24K67Ri14
         1XMiiIqqJv8UAP0x+ftUYXN3U8NZDWNLqb3PCYs7CkSTmqtCclNt1sxbCpCiydzoA2pC
         rMEtEzGRD9nrlpW9va5DZLb1xQ4/eF/VoFPDWms/dconIypMh03HGGmQBvwj/9/ZSxac
         0sBT4q4RtNKC+oYomxmtyauG3uTebP5JjQNfDl+fhnNEE8yASxmylHwlJ8eIWfH8HOds
         oghjbjNGBi8h50IU+ZMoXt2b+QZYM7435HFisfuVIGQOYCIxndWnA1XA+cAZJ/C7AVQz
         v5NQ==
X-Gm-Message-State: AOAM532DFPPNaPZ4kUV6VVIqMuTDX40ahTRNBDum/NaPIoRLqyMO/dqw
        5LcVKvcgHxJgCiefCf9I7/ldvA==
X-Google-Smtp-Source: ABdhPJx8FpHqSYgzol9QT15ojGrsHfNzwUaj1kBbAcwXHulg3MUjckG3puKaVYgVqxrnbR60BRtUSg==
X-Received: by 2002:a62:5285:0:b029:2e9:e0d5:67dc with SMTP id g127-20020a6252850000b02902e9e0d567dcmr9839597pfb.79.1622588133205;
        Tue, 01 Jun 2021 15:55:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g11sm2784904pgh.24.2021.06.01.15.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 15:55:32 -0700 (PDT)
Date:   Tue, 1 Jun 2021 15:55:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     jarmo.tiitto@gmail.com
Cc:     Bill Wendling <morbo@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
Message-ID: <202106011555.A7E9BE38@keescook>
References: <20210531202044.426578-1-morbo@google.com>
 <CAGG=3QVdXxLf0T9+n9FidrRcfdWY36m-i=4kPRJjOojWhjiywg@mail.gmail.com>
 <202106011210.B5A8881214@keescook>
 <5615959.Mqr2uNrfH2@hyperiorarchmachine>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5615959.Mqr2uNrfH2@hyperiorarchmachine>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 02, 2021 at 12:40:25AM +0300, jarmo.tiitto@gmail.com wrote:
> Yes, my future intention is that there will be one *.profraw file per module.
> And curiously I would also have renamed the current profile data file to 
> "vmlinux.profraw" to disambiguate it from what part of kernel generated it.
> 
> I already wrote an small fix up that I think should be part of the upstream 
> code so that profiling the vmlinux works better.
> It filters out any module originated content from vmlinux.profraw.
> 
> Above will be probably a good exercise for me.
> 
> Next, my future v2 module profiling machinery
> would probably follow on top of your work.

Okay, great; thanks for digging into it! :)

-- 
Kees Cook
