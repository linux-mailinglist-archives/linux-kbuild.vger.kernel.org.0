Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912182B7119
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 22:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgKQVvq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 16:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728306AbgKQVvq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 16:51:46 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1D9C0617A6
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 13:51:46 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id j19so10122998pgg.5
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2020 13:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ky/CMCEHw6W83Pli0RSEtI4judjYnXP8NLTqyncoiBE=;
        b=dZSJWDKnArBdBXCgAIPNiaxvh5LCZwCDL6Ymkj44p0R8yL+KgQAfKZKf1lt2KfdnvV
         bLD1xeFdcoEmB+Z3tmSxV7RnFUrRITgkpS48Ri05VZa2xyqn5gWggufKXfTSH6J5m6de
         NMkUQrd2oc7jz3d1V4DoMoucn5sXNnsH3BN6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ky/CMCEHw6W83Pli0RSEtI4judjYnXP8NLTqyncoiBE=;
        b=MT2ZR53bXVt6SO0Cjb5mHkZtaHnuKPmUz50DjlwLF/9FCH9aW1Mv6FljG5ptssrsfU
         eHdfYhLuKtFUSkEQHBq9B+WpMRIVWR6rzI4qEtv1T76OIM9IPQGBuh0X2OXkLfcDg0zz
         CKenEL83EFEPmqbaGbJW5XqIhozZwewhnCvCodPt10LDRCIA1KiEcv+ofz00h45Z/3SI
         Gqg0eE/zlfe4b7mYInUxLSrdG1/RJ9dZbK4Q6mcWZqDnZzcnz9k/NNDZhZUMR+4xBVtk
         QEGQv4oqaG9/demulxsRonfrU+Nm4Au81WOc4YsnGCwV/B4bExajegfS4cICKpmfSXR5
         duiA==
X-Gm-Message-State: AOAM530Bm0F0Zab2bKixt3QP3Y8+RUNGC0EJwg0RdUhiyjKnDXMhe/Da
        oISQ/eAKt1Tccv0hpDTjq0VeHw==
X-Google-Smtp-Source: ABdhPJxqggVKuH8HMTgHzwSVLvkZKhOmwN0EoIzciqR8uEi7NDnZHbJFTVTL+MdWrPbHDgwOP+UNwA==
X-Received: by 2002:a63:7847:: with SMTP id t68mr5290408pgc.422.1605649905676;
        Tue, 17 Nov 2020 13:51:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m9sm42912pjf.20.2020.11.17.13.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 13:51:44 -0800 (PST)
Date:   Tue, 17 Nov 2020 13:51:43 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <202011171350.F95127F@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201113195553.1487659-2-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113195553.1487659-2-natechancellor@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 13, 2020 at 12:55:53PM -0700, Nathan Chancellor wrote:
>  config LD_ORPHAN_WARN
> -	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
> +	def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)

Readability nit-pick... I prefer separate "depends" lines to make things
a little easier to parse, change, etc:

config LD_ORPHAN_WARN
	def_bool y
	depends on ARCH_WANT_LD_ORPHAN_WARN
	depends on !LD_IS_LLD || LLD_VERSION >= 110000
	depends on $(ld-option,--orphan-handling=warn)

Otherwise, yeah, looks good to me. With this and the other suggestions,
please consider it:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
