Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291C125CDDF
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 00:43:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgICWna (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 18:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgICWnU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 18:43:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08132C061246
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 15:43:20 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id e33so3286533pgm.0
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 15:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JQ91+76gyHMY3xv40LcJfL22rVwnSHEWIrs+JY61Lfw=;
        b=Gv/ffUiV4cHAcDklljNvHcMHuBcglanuZNKtn6NOLTMdAobfJFLi4S3XUK/VF0cMoa
         YCSlZMjLzO+hSp1mb2H+OVfbR2yXR8wtEPXnlt5uMI360+iCnjR0H3cIuzPcnksebXGK
         d93lpCoPbskfIrQ+gg8nraNFnKZGq6Pjaz6ts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JQ91+76gyHMY3xv40LcJfL22rVwnSHEWIrs+JY61Lfw=;
        b=oNhmRm+0dY9QFMNKbJiEebI2yeENHPRZZSsV/BAa96Y/q9CpxKcoDALHl29VWImMdd
         OdqfX9liGz4G+uDFaDu6qGCfI40SDYKQU0HX42q6o5MPMJiOXk+FRoWVreUpqfpHp5pA
         LL89xkZIG5BWawwG5AsTIkTYi2IgBXAcwul6l511UvEWFWGQBEE+rykQBswDRJrVolOI
         ShLX0crVA9d5yuaMZO7CLKUwJlbuJWYsIsAe11pzOUedeTb0QOLAQDdQzD1GJi03saBZ
         V9iPFiSYIINC4e2dXOZqU/soMmqXiVitKhG31q7udo95toRBkP1p931gvHUT70s/eV5+
         CfSw==
X-Gm-Message-State: AOAM533XWaYsPOhrj62V96cOE33ONaQE9+Jt6zvileQ5s3he1EBfYfWQ
        kzgnsTeMBuvHvDYOQozZ79rz4w==
X-Google-Smtp-Source: ABdhPJzsDxL6JJKJu36vJnlttgHabnBSHn20nTl7ZGP5hdybfETsgZLi8FgY6Utuj7Ord6vXDPO70Q==
X-Received: by 2002:a62:4e49:: with SMTP id c70mr5965062pfb.100.1599172999617;
        Thu, 03 Sep 2020 15:43:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 141sm4425163pfb.50.2020.09.03.15.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:43:18 -0700 (PDT)
Date:   Thu, 3 Sep 2020 15:43:18 -0700
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
Subject: Re: [PATCH v2 19/28] scripts/mod: disable LTO for empty.c
Message-ID: <202009031543.A239909B@keescook>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200903203053.3411268-1-samitolvanen@google.com>
 <20200903203053.3411268-20-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903203053.3411268-20-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 01:30:44PM -0700, Sami Tolvanen wrote:
> With CONFIG_LTO_CLANG, clang generates LLVM IR instead of ELF object
> files. As empty.o is used for probing target properties, disable LTO
> for it to produce an object file instead.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
