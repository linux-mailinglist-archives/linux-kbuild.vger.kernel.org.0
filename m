Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE27372ED71
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jun 2023 22:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbjFMU6r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Jun 2023 16:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234591AbjFMU6p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2023 16:58:45 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 114131BCD
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2023 13:58:44 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-652328c18d5so4578673b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2023 13:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686689923; x=1689281923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kaJ1SlZ50WSiGQJPsQQTsMtPEKHuyraiHKR0QOdAX9I=;
        b=H80e47crm4ESXow/QaIuxPk66TgxVa/iJGaHnH95xfD08xVJrKMNHs8ysh9jIGX/dr
         NDw2UibOZWY96JQi/qehTglV6bBwPEKNS9cB24g/qjELKgnSsGugeXdqfhSWJE2tQTe6
         QS/TOUG6kPDT9evqGfodFJrPyJwJtMP47mu9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686689923; x=1689281923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaJ1SlZ50WSiGQJPsQQTsMtPEKHuyraiHKR0QOdAX9I=;
        b=U4y2VehDLLDJ6X2tFtthwihDLcu3TJMxXK4YhrE0cUzLhVeMJh/KJ4G9j+PcMbzjW/
         EkNIoBEuo9uWxlAGDQ3uUdc7rlNjE4XRpFBUKvi5JzZE/P8v3gJkDSA4GFfU5H1RvAvf
         xUoz9rv0/mfw7/M1FVv0QHr9ipnpmCBAOiOznqVVxkRoaKCqCWH0DUtL2+J2Pp7AdVXL
         kuoJYSa95GupfF16VOpnyeM0zyqRIYiPxOrQZ3sQiLj3IVqm//xsj9TJhOvEKtBIhFRf
         K6trjQX0yGo5C8PdVHJqryquhW35meyKZI6f/jzbvdeIIEB3YkWgUAtrsCUuw3TslW3Q
         YJdQ==
X-Gm-Message-State: AC+VfDwKeef1umwpr4q/9xtfR/+1/mkfa/NTP6ts3WTxcMbymQfdL8/5
        /y6yJrnW3ipEdQha+i++eEsSxg==
X-Google-Smtp-Source: ACHHUZ7n7RXpBZeC4liksc7ps6dJc9YnbYCeZyY/kUOx53JAf3fL+kUrRrJ+Xsm2JqhZ7HUXteWTew==
X-Received: by 2002:a05:6a00:13a6:b0:65a:cbf3:4687 with SMTP id t38-20020a056a0013a600b0065acbf34687mr54961pfg.0.1686689923521;
        Tue, 13 Jun 2023 13:58:43 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j1-20020aa78d01000000b0065418efa5ebsm9022926pfe.155.2023.06.13.13.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:58:43 -0700 (PDT)
Date:   Tue, 13 Jun 2023 13:58:42 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     oe-lkp@lists.linux.dev, lkp@intel.com,
        kernel test robot <oliver.sang@intel.com>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [linux-next:master] [kbuild]  df8fc4e934:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202306131354.A499DE60@keescook>
References: <202306102333.8f5a7443-oliver.sang@intel.com>
 <202306131342.51A51F651C@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306131342.51A51F651C@keescook>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 13, 2023 at 01:46:54PM -0700, Kees Cook wrote:
> On Sun, Jun 11, 2023 at 09:41:30PM +0800, kernel test robot wrote:
> > the issue we found below is by clang-15, but we confirmed clang-15 we use is
> > commit 8dfdcc7b7b in llvm-project. it supports the flag already.
> 
> Interesting! Thanks for the report.
> 
> > [  228.605608][    C1] BUG: unable to handle page fault for address: 04090300
> > [...]
> > [ 228.608262][ C1] EIP: string (lib/vsprintf.c:644 lib/vsprintf.c:726) 
> > [...]
> > [ 228.608262][ C1] Call Trace:
> > [ 228.608262][ C1]  <SOFTIRQ>
> > [ 228.608262][ C1] vsnprintf (lib/vsprintf.c:2817) 
> > [ 228.608262][ C1] vprintk_store (kernel/printk/printk.c:2191) 
> > [ 228.608262][ C1] vprintk_emit (kernel/printk/printk.c:2288) 
> > [ 228.608262][ C1] vprintk_default (kernel/printk/printk.c:2318) 
> > [ 228.608262][ C1] vprintk (kernel/printk/printk_safe.c:50) 
> > [ 228.608262][ C1] _printk (kernel/printk/printk.c:2331) 
> > [ 228.608262][ C1] __ubsan_handle_out_of_bounds (lib/ubsan.c:209 lib/ubsan.c:343) 
> 
> This is a crash within the UBSAN handler! That's very unexpected.

I still don't understand this. Is printk() not allowed in SOFTIRQ?

> > [ 228.608262][ C1] get_string (drivers/usb/gadget/composite.c:1314) 
> > [ 228.608262][ C1] composite_setup (drivers/usb/gadget/composite.c:1871) 
> > [ 228.608262][ C1] dummy_timer (drivers/usb/gadget/udc/dummy_hcd.c:?) 
> 
> And the out-of-bounds condition got triggered in dummy_hcd.

I found this. I'm surprised we didn't trip over it earlier!

/* USB_DT_STRING: String descriptor */
struct usb_string_descriptor {
        __u8  bLength;
        __u8  bDescriptorType;

        __le16 wData[1];                /* UTF-16LE encoded */
} __attribute__ ((packed));

$ git grep 'struct usb_string_descriptor'
drivers/usb/early/xhci-dbc.c:   struct usb_string_descriptor *s_desc;
drivers/usb/early/xhci-dbc.c:   s_desc                  = (struct usb_string_descriptor *)strings->serial;
drivers/usb/early/xhci-dbc.c:   s_desc                  = (struct usb_string_descriptor *)strings->product;
drivers/usb/early/xhci-dbc.c:   s_desc                  = (struct usb_string_descriptor *)strings->manufacturer;
drivers/usb/gadget/composite.c:         struct usb_string_descriptor    *s = buf;
drivers/usb/gadget/udc/aspeed-vhub/hub.c:       struct usb_string_descriptor *sdesc = buf;
drivers/usb/host/xhci-dbgcap.c: struct usb_string_descriptor    *s_desc;
drivers/usb/host/xhci-dbgcap.c: s_desc = (struct usb_string_descriptor *)strings->serial;
drivers/usb/host/xhci-dbgcap.c: s_desc = (struct usb_string_descriptor *)strings->product;
drivers/usb/host/xhci-dbgcap.c: s_desc = (struct usb_string_descriptor *)strings->manufacturer;
include/uapi/linux/usb/ch9.h:struct usb_string_descriptor {

Looking at each use, none are using sizeof() on the struct, so it should
be a trivial replacement. I'll send a patch.

-Kees

-- 
Kees Cook
