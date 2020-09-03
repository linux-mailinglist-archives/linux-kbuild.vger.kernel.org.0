Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B5925CCF6
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 23:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729212AbgICV6g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 17:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729036AbgICV6b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 17:58:31 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6D2C061246
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 14:58:30 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id h12so3190726pgm.7
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 14:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zwlTSlngv7hk/k8joOBYJecRtutX3pQhWGRYHaQfHNc=;
        b=cfK1czkMgexKgeV+AniPDaw2RXSPRTJErK03aD3KyKL4Fgd4NeDHwP5V8Xl/FfVKCS
         6F+iqqs9u11jyJ00qYjcMmLzcZHnV9wHK2dvI7ZXa7ITGd9X9E1vU0dh9lPkAo/o/+N9
         ZlfpNW1hK+/ISGP4OP8u8wm5pAhXJBxxqUlTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zwlTSlngv7hk/k8joOBYJecRtutX3pQhWGRYHaQfHNc=;
        b=eimTaPS1V6Lp9xgzGDk8MCulePf4fFPCxIWZeINtdPPhiK4WWurKGVVnjklXT5h9H3
         3lDbFKDIaMthSYqFpOuBnKUZxS2ovHZhXr9pF8Hikase7WYob/dhHhd2bXu4OqhwBrVY
         SNjjiyhqJRPBtNdKfWMFgVHbr9mn4Dngu5QX9u9GaxKevTbALMS6VpxNnpyC/Z2T748K
         61/I8CIhyGG0fCDEe+8nZ1mIaUr2VwX/iRs6Y1Y63PSW5hO8ExfU8iOdBofsvD5B22vh
         5D+8CXxboGkO8r8LeBh2f9CpUfVFHUFTNgqj/8wTzN5llMwreNeLhzRlPk4LTsJ+1+Pj
         R/5A==
X-Gm-Message-State: AOAM531z3jNxNpqEiI9m0U3m8qKp35bYa+lSKunPLwWPqNijQO9JqU5X
        UIGIucSE6w0/8U8qCpcgunBTuw==
X-Google-Smtp-Source: ABdhPJxsSBaVqKQu0Depn8jVU89HVsiUUr1gbeyokvUp0RXsPEsXdBRA9MTk7ZF9gX6Cd/pjcZAmmw==
X-Received: by 2002:a63:d70f:: with SMTP id d15mr4658855pgg.354.1599170310450;
        Thu, 03 Sep 2020 14:58:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s198sm3638905pgc.4.2020.09.03.14.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 14:58:29 -0700 (PDT)
Date:   Thu, 3 Sep 2020 14:58:28 -0700
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
Subject: Re: [PATCH v2 08/28] x86, build: use objtool mcount
Message-ID: <202009031456.C058EC4@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-9-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-9-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:33PM -0700, Sami Tolvanen wrote:
> Select HAVE_OBJTOOL_MCOUNT if STACK_VALIDATION is selected to use
> objtool to generate __mcount_loc sections for dynamic ftrace with
> Clang and gcc <5.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Am I right to understand that this fixes mcount for Clang generally
(i.e. it's not _strictly_ related to LTO, though LTO depends on this
change)? And does this mean mcount was working for gcc < 5?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
