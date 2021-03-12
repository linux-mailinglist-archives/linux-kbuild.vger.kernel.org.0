Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E872C3383E7
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Mar 2021 03:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhCLCqi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 21:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbhCLCqc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 21:46:32 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D64FC061574
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:46:32 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so10352543pjb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Mar 2021 18:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EkKsbT/Be7JGL+mLJvho9bTta6ZuIDt4k2VfVYUMdas=;
        b=RAWK+vGcMZyK9BG6AxoJ0QzqwZIszAK9x1UrTKvNkNwXGVrYgWz8709/k2si8eBj1W
         qQrtwxdfwT+VTa3J8I5zf0r4FiHh18mN89nA+qArQh8jHq5MKYponYw4RmZRp77LRLoY
         uRCsSXXIj7eyg+c6rlvuq9CK91J3pIa9ABX44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EkKsbT/Be7JGL+mLJvho9bTta6ZuIDt4k2VfVYUMdas=;
        b=H7hXw02G8pHf3RUDPQhNgH2c3nex5PZF7BAuRa/dpIhyo54Y9RVhkCUtQu7JVzIoMB
         Ad2PnKAmDFuQQiiY+jfM4gahxE8uGSnbwnijj6OBuCLeUOZqfLRuiBrMpG1M/EzFPSgf
         UGnPItTikdoi2k+hHzLzDMCdshRKjXiEStQ5SuLPpk36GMBMFR5d9UlK9vFdChFiT6WR
         Ed2F1FD281Cvtbp0XAfw7SVY0rrRN7OfHZAZUE7pxUrAJYnMqTQGpGlmfljWAu4crhIj
         s0+e4SyuZAAiuoItWr4JGEDcMFgNeVuYGlM44Q6QoNwZ3WIhKPSpcE6et6EaBHY0VsM1
         gsMg==
X-Gm-Message-State: AOAM530sjvmesDmmYlcu4xZZYC/w+4ytih5bAfmltyOV5c5kPEoaIMW3
        4jatJsVZjRNj6MGCvVirxIWhhQ==
X-Google-Smtp-Source: ABdhPJy0U15bZZKnq24TxTodYpzvMU/ZPG0N12wONWG2T01eoVgkhya4x6f+sSafSsZdieWkf5PVjQ==
X-Received: by 2002:a17:90b:284:: with SMTP id az4mr2741623pjb.12.1615517191648;
        Thu, 11 Mar 2021 18:46:31 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v126sm3540349pfv.163.2021.03.11.18.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:46:31 -0800 (PST)
Date:   Thu, 11 Mar 2021 18:46:30 -0800
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
Subject: Re: [PATCH 13/17] arm64: use __pa_function
Message-ID: <202103111846.49925C94E@keescook>
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-14-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312004919.669614-14-samitolvanen@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 04:49:15PM -0800, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler replaces function address
> references with the address of the function's CFI jump table
> entry. This means that __pa_symbol(function) returns the physical
> address of the jump table entry, which can lead to address space
> confusion as the jump table points to the function's virtual
> address. Therefore, use the __pa_function() macro to ensure we are
> always taking the address of the actual function instead.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
