Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F4D72ED46
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jun 2023 22:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjFMUq7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jun 2023 16:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjFMUq6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2023 16:46:58 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72351170C
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2023 13:46:56 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b3cc77ccbfso17233515ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2023 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686689216; x=1689281216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UU2W1Yd3b/N1bxttJwHZMPKGDdWn1+63RfP3dSCBBR4=;
        b=bAZ8pdO/DxdY6zDe8daGd9jbKgSBR2wTKN+h+1X22YogYqUPNT4I78n15bPFBQ2Qie
         d8nBcepCW8TdqSPQS6v8H+pYQYNqVZS0r2ubI4BOzwLN+126Je4Yi1tKtAWaAcy8vmrq
         XmgdpIH/9XO5lgOlOBMZPJT8W/gNTxR1kXJYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686689216; x=1689281216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU2W1Yd3b/N1bxttJwHZMPKGDdWn1+63RfP3dSCBBR4=;
        b=OUojarblJ143dDia/Q1+2NXAxRGqETNWOxKB+NRieUSASlxZE+ivIft4ghKLueOw0s
         +60DK0XIrQMv5TUBCy8IDf7A/h/TRbnPK/Eeqr8eFvButGsuvvN50bhAszZgJeg0GT68
         ojgFqV83RjDZMYKvGg9eA2ngE48NRKA4PxXhbpeby5keTBoE1Yg5TC7eJSZhNvgUk6Gd
         4T9r289DFE9/+MXOOzVCcZPkqSV1yTh6dwLhsGtL9LDUTu26r/tx8Nu9lzpXR6aavHpd
         vdVUwub2fSkyQqZsH8+NatHvyhetvZozTE1hm9J2l5t/LtBiesUO60/Alm70RXQgGp0b
         2JkQ==
X-Gm-Message-State: AC+VfDzvEJkMZtHwWMbU/S2u03bqIRPPyAqda6jn1o8zDG4EWwv9sD9p
        nL21vQuav7OnzHwxXpdKtm+pdg==
X-Google-Smtp-Source: ACHHUZ6fFOMFh+FwU12YfRQVUNKzL4Zw50Ovq3PP5212pZBhNw4LQmUj8O7Bv6Fc9zyeJpMSdFalcg==
X-Received: by 2002:a17:903:11d2:b0:1ae:7631:7fa9 with SMTP id q18-20020a17090311d200b001ae76317fa9mr11703605plh.37.1686689215857;
        Tue, 13 Jun 2023 13:46:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902690b00b001b03842ab78sm10672486plk.89.2023.06.13.13.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:46:55 -0700 (PDT)
Date:   Tue, 13 Jun 2023 13:46:54 -0700
From:   Kees Cook <keescook@chromium.org>
To:     kernel test robot <oliver.sang@intel.com>
Cc:     oe-lkp@lists.linux.dev, lkp@intel.com,
        Linux Memory Management List <linux-mm@kvack.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [linux-next:master] [kbuild]  df8fc4e934:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202306131342.51A51F651C@keescook>
References: <202306102333.8f5a7443-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306102333.8f5a7443-oliver.sang@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jun 11, 2023 at 09:41:30PM +0800, kernel test robot wrote:
> the issue we found below is by clang-15, but we confirmed clang-15 we use is
> commit 8dfdcc7b7b in llvm-project. it supports the flag already.

Interesting! Thanks for the report.

> [  228.605608][    C1] BUG: unable to handle page fault for address: 04090300
> [...]
> [ 228.608262][ C1] EIP: string (lib/vsprintf.c:644 lib/vsprintf.c:726) 
> [...]
> [ 228.608262][ C1] Call Trace:
> [ 228.608262][ C1]  <SOFTIRQ>
> [ 228.608262][ C1] vsnprintf (lib/vsprintf.c:2817) 
> [ 228.608262][ C1] vprintk_store (kernel/printk/printk.c:2191) 
> [ 228.608262][ C1] vprintk_emit (kernel/printk/printk.c:2288) 
> [ 228.608262][ C1] vprintk_default (kernel/printk/printk.c:2318) 
> [ 228.608262][ C1] vprintk (kernel/printk/printk_safe.c:50) 
> [ 228.608262][ C1] _printk (kernel/printk/printk.c:2331) 
> [ 228.608262][ C1] __ubsan_handle_out_of_bounds (lib/ubsan.c:209 lib/ubsan.c:343) 

This is a crash within the UBSAN handler! That's very unexpected.

> [ 228.608262][ C1] get_string (drivers/usb/gadget/composite.c:1314) 
> [ 228.608262][ C1] composite_setup (drivers/usb/gadget/composite.c:1871) 
> [ 228.608262][ C1] dummy_timer (drivers/usb/gadget/udc/dummy_hcd.c:?) 

And the out-of-bounds condition got triggered in dummy_hcd.

I also see this is happening in SOFTIRQ context. I wonder if there is a
problem with UBSAN vs SOFTIRQ. Again, I'd find that surprising...

I'll see what I can find...

-- 
Kees Cook
