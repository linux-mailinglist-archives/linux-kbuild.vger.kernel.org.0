Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D0F261A83
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Sep 2020 20:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731373AbgIHSgs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 8 Sep 2020 14:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731682AbgIHScm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 8 Sep 2020 14:32:42 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7E2C061756
        for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2020 11:23:15 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d9so5379383pfd.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2020 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mfB0S2TmcGDxX8xZkZ/chTU0dmPHOOO8nuKSmYrB2mM=;
        b=Oo/DQrZCB0KIovn2oIQvAUWTptWqamehVi+n9pOLZRf1yPmAlsDgequytTa8T71Hfc
         MnZ8qfVQW2q6h/Gb3s3xMzJv0ALrHyHScJJ+WdbP6brRxtmNudTvVWKGbUjfoC5KHF4b
         uGSGjTSSevWadA70wvgbB72exIK9HnLgQdo9pBIgjKkAOXHzO50M1u7BZGl1okDbUiqz
         czRJlEsh6kR0+ujAUZ5GoU2okMRHEd7MJeAWIce5U7hvYLvI/36yTxGrED/UXTfJN1Pp
         +8kHwWJ0fqPNtnwRBmLuZUKXP2wEoOXwXAgDcmvidR+BlAhYV4QFIECLoW9snCOd1lTW
         zkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mfB0S2TmcGDxX8xZkZ/chTU0dmPHOOO8nuKSmYrB2mM=;
        b=nla/UWrZBjwjhWgCvEWSMwprQ6Fo6MK5Yr0MqfHI6kxUAauIWZpcS0HpEpmOEJFPWt
         YzS2YkPtEfvrotD9SipPYdzU/dZ2aXGwuNKeeFHx+AIPAJlmW9mhIaRH9vcSst6OxzHT
         mWpYXtOyMcJXayAfhMGisehKACu2YKDimBNz1q7AJvNHA9gFzs0gIe38T75ZANQ5sN8y
         0WnSHOI1IEj7F64MCzDYhnZccO/Tcr5VbSzBKeCh0GuJVtBS+6+mHxoRgB46creP2k29
         NMb47IAjSS+wOdH6PSISf+yNgrJ0k97GMC/yvfTKY884mUhcXwnAwXMfuZuvmy+6XK7I
         LtSA==
X-Gm-Message-State: AOAM532n6IGrLI7XAxqECtjTcL9PBWDLdU9djP4RxVODHM18WM8OBj/q
        ym6ajBW4NjA2IKUEI/7OMncBQw==
X-Google-Smtp-Source: ABdhPJwprY99iDi73Le2vnSOxXHnK9OCb6eXlfe519dNjZDsp0xdQH72w/MWOHjt+KXl9278n5yCtw==
X-Received: by 2002:a17:902:10f:: with SMTP id 15mr24890192plb.121.1599589394447;
        Tue, 08 Sep 2020 11:23:14 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
        by smtp.gmail.com with ESMTPSA id h11sm108910pfe.185.2020.09.08.11.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 11:23:13 -0700 (PDT)
Date:   Tue, 8 Sep 2020 11:23:08 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
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
Subject: Re: [PATCH v2 10/28] kbuild: lto: fix module versioning
Message-ID: <20200908182308.GA1227805@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-11-samitolvanen@google.com>
 <202009031510.32523E45EC@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009031510.32523E45EC@keescook>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 03:11:54PM -0700, Kees Cook wrote:
> On Thu, Sep 03, 2020 at 01:30:35PM -0700, Sami Tolvanen wrote:
> > With CONFIG_MODVERSIONS, version information is linked into each
> > compilation unit that exports symbols. With LTO, we cannot use this
> > method as all C code is compiled into LLVM bitcode instead. This
> > change collects symbol versions into .symversions files and merges
> > them in link-vmlinux.sh where they are all linked into vmlinux.o at
> > the same time.
> > 
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> 
> The only thought I have here is I wonder if this change could be made
> universally instead of gating on LTO? (i.e. is it noticeably slower to
> do it this way under non-LTO?)

I don't think it's noticeably slower, but keeping the version information
in object files when possible is cleaner, in my opinion.

Sami
