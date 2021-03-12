Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C709C3383C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbhCLCnz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:43:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhCLCnU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:43:20 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B40E1C061762
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:43:20 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id j6so11214926plx.6
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BNPsz0QLD3vM6+qNFMQ0OL0lFNeTebIONp/Q9dpVBmA=;
        b=QFHHVkV6BruBDLSqpSS5ZgpkzbKbFL9XcSmhEzK11y2mzkKvPQY9xpKatfo/Os2Tcd
         vIbekihgbpvMJcPrRh8gScKUhr1OSYBQOHteZqL4n+5ye8SOoMq6eXo3GEVPYy8bBb5Y
         7GtOMqPoVrJccKwnjRy9eXNFAdum8kSTxSXaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BNPsz0QLD3vM6+qNFMQ0OL0lFNeTebIONp/Q9dpVBmA=;
        b=gLaSa37Of/zyeTOGwl80pQEjtu8i77iGZnlhBqEtW4ZGlMg49L4chg6Apk2wRGHtnL
         yxqGcil92rEWr474rMS++WSqRihzFqane0XL+5NKGKIebxp6+mwaK6taBUJNatBh/URQ
         D3eG19uuILGQzdFE9e39W3qOWE4DUVV/ciOO51qWSwgAcOmrwgbVVY993BkyuEMXL3RP
         fSKPcpLDtM4S9VYbz0vsfKsTT0wgRv4OfbfC44vQzJKJW0i0/n+F0wIfjHzZ/Mg5yNLA
         3rHtfNv3JbW+N/1QvMIMCUqgIkJZ0+o/IKlC+90ZCAOhQhyIZW6KtnBKS1Plwu85i9BT
         Yd+w==
X-Gm-Message-State: AOAM533NxnlqN0EctIcTpr/u5jlPNImaeG6cgWnQeb7J7aCW7oMyipRj
        VIT0ohjbVdAM8SijNH147bhxiRrQJKhxfA==
X-Google-Smtp-Source: ABdhPJwFKoCF8whxDXdLUhHjkHxm4/5ycmKLMkKhBI3hwmAY7tNoQI3rQR7e3wSMLF56vcYEDo4ITg==
X-Received: by 2002:a17:902:9a45:b029:e6:1444:5287 with SMTP id x5-20020a1709029a45b02900e614445287mr11337807plv.54.1615517000236;
        Thu, 11 Mar 2021 18:43:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d2sm382256pjx.42.2021.03.11.18.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:43:19 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:43:18 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] workqueue: cfi: disable callback pointer check
 with modules
Message-ID: <202103111840.58C5D95F@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-6-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-6-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:07PM -0800, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, a callback function passed to
> __queue_delayed_work from a module points to a jump table entry
> defined in the module instead of the one used in the core kernel,
> which breaks function address equality in this check:
> 
>   WARN_ON_ONCE(timer->function != delayed_work_timer_fn);
> 
> Disable the warning when CFI and modules are enabled.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
