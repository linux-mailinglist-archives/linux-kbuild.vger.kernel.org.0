Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0712027FDE2
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Oct 2020 12:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbgJAK5g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Oct 2020 06:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731888AbgJAK5g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Oct 2020 06:57:36 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F848C0613D0
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Oct 2020 03:57:36 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e2so2548897wme.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Oct 2020 03:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uIC7dj7oltWe68l04x0L6fWnaqmGQcvXiQBbnnS12XU=;
        b=N8ey+YcuMPXshManX3zPwywfOqeeNx1A+UcGWlWQ42qMYLsZxU5gVninqb376OrTab
         tNm3q9DB534M24+asCWHSsEssHzbplzSFsBkc/pCgsZEtnQ3elRGtE/Q5IObT50DijC3
         UmLLTpgJ4lUr0H3OJqpDW9aKOBWB0RZ5DmvrxumWfUN1rm//1CbPYTGxeQc1Uw8Lz7VG
         ZKeffsRrg8mjPPKf3ixhWmGOQCKOIMLPWb1x7KTnlxYxloWGwEZphXYNeZxt64BP0cn8
         pj2+tCmKLs0ZV7qNvGV4xuQNOpINkqV75Nc+NtD3jroYMhe+0So6sTTrTI+FvV0K3nRF
         FE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uIC7dj7oltWe68l04x0L6fWnaqmGQcvXiQBbnnS12XU=;
        b=A6ZxjMFDPew4mdumEyf0gg9sLmatLdCsKUvWjOcc4QOsoXDiwepczFdlYSGAtmF7eq
         SPAEFicqERZ8DR8kOdrc/6RfbnD3Wn1TceypQ/pwXsx5xK9MBMGopBxA4Hz7i4ltdyXg
         QHxfYlDg0NNkR8lCePumMi/sNqMhhGJGOvQfZsZOwpRKOw82BQCke1RocrGN2ICSw5qU
         lCuAL74h4bKdmCSS4e81tA5a7XnRBnHQuVlm/D2pTRYmuiXAaIVrDCMO7lO4jmHMXLu0
         6mWPnCOi5/84OiQZaCuEAma+Y2PjTVqNQ8eowsZ0TGQLpI4KOUfxm/L83yzCgz7NiZeg
         b7AA==
X-Gm-Message-State: AOAM532T2sOUCUuUDIQp13hiTyONZqzjyjoki24k0jMUxvia48W45xzb
        RxclDUo+RkuFFJpIVzFEtkU0fg==
X-Google-Smtp-Source: ABdhPJzH81yvoV14kh0UBrupVwtAp8vc2BgwRUJ/AgiG5QgwEW8w4M550SI7tTEK9mrDCKojnPs7wA==
X-Received: by 2002:a1c:f612:: with SMTP id w18mr7636314wmc.47.1601549854655;
        Thu, 01 Oct 2020 03:57:34 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:109:4a0f:cfff:fe4a:6363])
        by smtp.gmail.com with ESMTPSA id z13sm8267476wro.97.2020.10.01.03.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:57:33 -0700 (PDT)
Date:   Thu, 1 Oct 2020 11:57:29 +0100
From:   Andrew Scull <ascull@google.com>
To:     George-Aurelian Popescu <georgepope@google.com>
Cc:     maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        natechancellor@gmail.com, ndesaulniers@google.com,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        keescook@chromium.org, akpm@linux-foundation.org,
        dvyukov@google.com, elver@google.com, tglx@linutronix.de,
        arnd@arndb.de
Subject: Re: [PATCH 07/14] KVM: arm64: Enable UBSAN_BOUNDS for the both the
 kernel and hyp/nVHE
Message-ID: <20201001105729.GA632887@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-8-georgepope@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914172750.852684-8-georgepope@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 14, 2020 at 05:27:43PM +0000, George-Aurelian Popescu wrote:
> From: George Popescu <georgepope@google.com>
> 
> If an out of bounds happens inside the hyp/nVHE code, the
> ubsan_out_of_bounds handler stores the logging data inside the
> kvm_ubsan_buffer. The one responsible for printing is the kernel
> ubsan_out_of_bounds handler. The process of decapsulating the data happens
> in kvm_ubsan_buffer.c.
> 
> The struct kvm_ubsan_info contains three main components:
> -enum type, which is used to identify which handler to call from the
> kernel.
> -struct ubsan_values, which stores the operands involved during the
> undefined behaviours, which can be one, two or zero, depending on what
> undefiend behaviour is reported. As an example for: out_of_bounds there
> is only one operand (the index).
> 
> Accessing a slot with no type should do nothing. Each slot is marked
> with the UBSAN_NONE tag after it's first usage.
> 
> Signed-off-by: George Popescu <georgepope@google.com>
> ---
>  arch/arm64/include/asm/kvm_ubsan.h | 19 ++++++++++++++++++-
>  arch/arm64/kvm/hyp/nvhe/ubsan.c    | 13 ++++++++++++-
>  arch/arm64/kvm/kvm_ubsan_buffer.c  | 13 ++++++++++++-
>  3 files changed, 42 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_ubsan.h b/arch/arm64/include/asm/kvm_ubsan.h
> index af607a796376..575881e0bd5f 100644
> --- a/arch/arm64/include/asm/kvm_ubsan.h
> +++ b/arch/arm64/include/asm/kvm_ubsan.h
> @@ -11,7 +11,24 @@
>  #define UBSAN_MAX_TYPE 6
>  #define KVM_UBSAN_BUFFER_SIZE 1000
>  
> +struct ubsan_values {
> +	void *lval;
> +	void *rval;
> +	char op;
> +};
> +
>  struct kvm_ubsan_info {
> -	int type;
> +	enum {
> +		UBSAN_NONE,
> +		UBSAN_OUT_OF_BOUNDS
> +	} type;
> +	union {
> +		struct out_of_bounds_data out_of_bounds_data;
> +	};
> +	union {
> +		struct ubsan_values u_val;
> +	};
>  };
>  #endif
> +
> +void __ubsan_handle_out_of_bounds(void *_data, void *index);
> diff --git a/arch/arm64/kvm/hyp/nvhe/ubsan.c b/arch/arm64/kvm/hyp/nvhe/ubsan.c
> index a43c9646e1e8..b2d3404f6215 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ubsan.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ubsan.c
> @@ -43,7 +43,18 @@ void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr) {}
>  
>  void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr) {}
>  
> -void __ubsan_handle_out_of_bounds(void *_data, void *index) {}
> +void __ubsan_handle_out_of_bounds(void *_data, void *index)
> +{
> +	struct kvm_ubsan_info *slot = NULL;
> +	struct out_of_bounds_data *data = _data;
> +
> +	slot = kvm_ubsan_buffer_next_slot();
> +	if (slot) {
> +		slot->type = UBSAN_OUT_OF_BOUNDS;
> +		slot->out_of_bounds_data = *data;
> +		slot->u_val.lval = index;
> +	}
> +}
>  
>  void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs) {}
>  
> diff --git a/arch/arm64/kvm/kvm_ubsan_buffer.c b/arch/arm64/kvm/kvm_ubsan_buffer.c
> index 28dcf19b5706..ce796bdd027e 100644
> --- a/arch/arm64/kvm/kvm_ubsan_buffer.c
> +++ b/arch/arm64/kvm/kvm_ubsan_buffer.c
> @@ -16,6 +16,17 @@
>  
>  DECLARE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
>  
> +void __kvm_check_ubsan_data(struct kvm_ubsan_info *slot)
> +{
> +	switch (slot->type) {
> +	case UBSAN_NONE:
> +		break;
> +	case UBSAN_OUT_OF_BOUNDS:
> +		__ubsan_handle_out_of_bounds(&slot->out_of_bounds_data,
> +				slot->u_val.lval);
> +		break;
> +	}
> +}
>  
>  void __kvm_check_ubsan_buffer(void)
>  {
> @@ -25,7 +36,7 @@ void __kvm_check_ubsan_buffer(void)
>  
>  	init_kvm_debug_buffer(kvm_ubsan_buff, struct kvm_ubsan_info, slot, write_ind);
>  	for_each_kvm_debug_buffer_slot(slot, write_ind, it) {
> -		/* check ubsan data */
> +		__kvm_check_ubsan_data(slot);
>  		slot->type = 0;

0's called UBSAN_NONE now

>  	}
>  }
> -- 
> 2.28.0.618.gf4bc123cb7-goog
> 
