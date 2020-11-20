Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7D52BB5D3
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Nov 2020 20:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729614AbgKTTrY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Nov 2020 14:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729114AbgKTTrY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Nov 2020 14:47:24 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D5AC061A47
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 11:47:24 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id w6so8892683pfu.1
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2020 11:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=elr/neHdSPND1QBbHYVTIKRGGtBg1vE7OdThIsRU5pI=;
        b=XzoPI1crChRR6wLQGUnQdTruNmuVNj0hkcwU6yjn8xXrOzmnTuw8bZwNjYOSUMiNjn
         EBV38WHid50TNovyKvDuuqOK6ny2jvmInIM/dgDYVmxiGIxn7be54rsKduzrLe/jMV3q
         ANWN/74SZ1EEZvtawKD5ujXQl6B2YxxD3r8JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=elr/neHdSPND1QBbHYVTIKRGGtBg1vE7OdThIsRU5pI=;
        b=bjxH8NALaP96IkKQRnjLfGGFRg+PmfyMIQgzUMJvODKFaeB/H/R7wBjggcqUZ++J6J
         t6Dugfe00o3o6QIQOilsJ8ldkwycxarPJSsNEZKw4RQdBR4AqiMzvywshiQV7sW1h0vX
         5puvZk7k685zIpW2YqnoeVv82pcHhvQC2dJjZCZ7/+E1cAany7uVbk2yG79wh8wuHsIj
         qnY7q5TyGL6eukOHHaGCozzRbcOhFrQzGyuHMhaCTDWd87QoCur34ZFLRRkQlCkkdZ4f
         Fan+EKmxC2osqMoQ/18B3eArF267SXa6D+OH4/BrLhW+t5AuVvpio56GAcMrzsfFhiXp
         gFAg==
X-Gm-Message-State: AOAM531GwWVPTJS3yTJFdQ/12ZQudtzdub08GQoq9zk6KuEr0yjbj2VR
        nn2Zb3k2gphHp+27zk4wlvfqhA==
X-Google-Smtp-Source: ABdhPJwnsGzh6rI5stQsBcWRn8N0h8Ns8b+OJp9DPF9o8s3fODKrXmSZ/a2sub1vz+HM8LuYBAXNBw==
X-Received: by 2002:a62:ea09:0:b029:197:bad4:1e78 with SMTP id t9-20020a62ea090000b0290197bad41e78mr8311744pfh.22.1605901643516;
        Fri, 20 Nov 2020 11:47:23 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h16sm4507596pfo.185.2020.11.20.11.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 11:47:22 -0800 (PST)
Date:   Fri, 20 Nov 2020 11:47:21 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 02/17] kbuild: add support for Clang LTO
Message-ID: <202011201144.3F2BB70C@keescook>
References: <20201118220731.925424-1-samitolvanen@google.com>
 <20201118220731.925424-3-samitolvanen@google.com>
 <CAKwvOdnYTMzaahnBqdNYPz3KMdnkp=jZ4hxiqkTYzM5+BBdezA@mail.gmail.com>
 <CABCJKucj_jUwoiLc35R7qFe+cNKTWgT+gsCa5pPiY66+1--3Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKucj_jUwoiLc35R7qFe+cNKTWgT+gsCa5pPiY66+1--3Lg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 20, 2020 at 08:23:11AM -0800, Sami Tolvanen wrote:
> Changing the ThinLTO config to a choice and moving it after the main
> LTO config sounds like a good idea to me. I'll see if I can change
> this in v8. Thanks!

Originally, I thought this might be a bit ugly once GCC LTO is added,
but this could be just a choice like we're done for the stack
initialization. Something like an "LTO" choice of NONE, CLANG_FULL,
CLANG_THIN, and in the future GCC, etc.

-- 
Kees Cook
