Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6A0D3383DA
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbhCLCqF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbhCLCpx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:45:53 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF04EC061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:45:52 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id s21so888739pfm.1
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fac5qEwtGUhYp0i9UgwCZogHJ9c5ndld0feZGyCBugw=;
        b=Yf1jNw5HL2aTwVR53Xw1DAzotE73G/J5yX4CJQJM+XgSnLG8J+vcgPlTdkWIsbuxH6
         QLetB8TZJzSr1rGbx8bLv9sUGwRivp/1eoW5SZQo+X5smcoP6bJxSpB38YAMtOOcS0+B
         DCLkvZloqcKPnWQPN8dAzDhjkMWed0N6lx+N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fac5qEwtGUhYp0i9UgwCZogHJ9c5ndld0feZGyCBugw=;
        b=rBYoJBbKxUsGcCp/NVV06/XUNQ++FGt2X3xUZ823IpzaP/0Ax87UpIC4/zsQoWcO+T
         JztAtZ8+BFkHUNYNciI0XnKlvXf0wwpyc8J+Hseaov+kthd7wMa5TABoivk9ZHDkiJiB
         saqCbLfB3KIAlja/lIlETWKVHgf7qW0UaqtStYpcVMgPttEIw1WC7+oEGd3SMTCEyi+r
         j2HTutvNcU5Bc8R8FOgseuFP5t+TLqRrioBr0R7VTn3UqkuQ70Dir/epWbvxDCKt3EYr
         2yqHA96ma+Rrb8tyo7SXFTxInzWo8x8e8lHM4FDNO84qYcm4LCTmHMZfTHX/Kv5ROEyB
         tdaA==
X-Gm-Message-State: AOAM531gy+wGgIOqsf6yt/aSiskqH/2lh16byAOAD0rdM/y6eFfElIsl
        n21acYfsXqKE6u2qQCdjhpieSg==
X-Google-Smtp-Source: ABdhPJwkatQTgQrGNraBkT/X2lsgOwTQFo5tDOWcr2Yd9maNZVjYw6Sy3JQXdf01TBLr7xwbPU4otA==
X-Received: by 2002:a62:35c2:0:b029:1f1:3a8b:83d5 with SMTP id c185-20020a6235c20000b02901f13a8b83d5mr10327491pfa.29.1615517152536;
        Thu, 11 Mar 2021 18:45:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n184sm3522810pfd.205.2021.03.11.18.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:45:51 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:45:51 -0800
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
Subject: Re: [PATCH 11/17] psci: use __pa_function for cpu_resume
Message-ID: <202103111845.6E00D2E@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-12-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-12-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:13PM -0800, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler replaces function pointers with
> jump table addresses, which results in __pa_symbol returning the
> physical address of the jump table entry. As the jump table contains
> an immediate jump to an EL1 virtual address, this typically won't
> work as intended. Use __pa_function instead to get the address to
> cpu_resume.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
