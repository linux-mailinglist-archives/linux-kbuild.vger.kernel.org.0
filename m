Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B2D7DBD8A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Oct 2023 17:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbjJ3QMQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Oct 2023 12:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjJ3QMP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2023 12:12:15 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9903CC5
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Oct 2023 09:12:12 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3b2e22a4004so3266972b6e.3
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Oct 2023 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1698682332; x=1699287132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oodQJECNA1emt+ZSe7GuNR9wIJ3mag7w16SqLJjZ1IU=;
        b=danZmm22xygZLt+rGcfT8IHe1161EDsur1wJbqJYCSstNcK9KxOtHCOfSO5TC7GBNB
         A9PQTd8R45Cy5ryky3kvpbz0Kmp4jQsKZI/3N4xKpAWwY3EvN6d0aAbWwE87NQMGXbTk
         zCr6tlTR0HnLUCeY718KXWpSCJASQkbTftaJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698682332; x=1699287132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oodQJECNA1emt+ZSe7GuNR9wIJ3mag7w16SqLJjZ1IU=;
        b=BUQaK1BOpNIbA+Fn73p+e+WN7B9o86Pew9bajQ/gQmXnqnXJ3xSHFYWntFGkqKpmY/
         mJn3Z82ySSGUt4Ta0gnBp55TxhL/1dTXxPzaw/vreIeDO596kyxiQqP57tqpYeUC0xR6
         FbMq/Tw95wQTmsQYO/sQ/8MySmcuS+IcFqsQvKjGQ+aLulVGQGMIFq/GU7+WX9oUlQmy
         GnXEJgqH43j5WwgizPpWOUVZyvth4Dd4wiGe/Ax40/I5FJbGiClj2je2+lgeBuqxlsio
         5Fl1yv4kKh59p+NOEHmgUGMnaohUg0PT4US29Lm9T3YvHvRX+H+iNuP7nJOPHcoZJMB1
         vS7g==
X-Gm-Message-State: AOJu0YyvuxKtfSKVSgmoArRHHE57uVIQDUTxBm0Di6mRzdnYxEeqKjb2
        Nu/Uqqr7HQPbtJ/i0lguqcep2A==
X-Google-Smtp-Source: AGHT+IHoT9T9j+/Dof6wA/G/+AhrgWHz86krrYzaeW+fuocGkn8AxQnmYdn2G2hIALD+1WZYwAlU5Q==
X-Received: by 2002:aca:1816:0:b0:3ae:5743:533a with SMTP id h22-20020aca1816000000b003ae5743533amr10434767oih.47.1698682331961;
        Mon, 30 Oct 2023 09:12:11 -0700 (PDT)
Received: from bill-the-cat (2603-6081-7b00-6400-0000-0000-0000-013d.res6.spectrum.com. [2603:6081:7b00:6400::13d])
        by smtp.gmail.com with ESMTPSA id h19-20020a05620a401300b007778503ebf4sm3427889qko.16.2023.10.30.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 09:12:11 -0700 (PDT)
Date:   Mon, 30 Oct 2023 12:12:09 -0400
From:   Tom Rini <trini@konsulko.com>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Simon Glass <sjg@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        U-Boot Mailing List <u-boot@lists.denx.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: boot: Support Flat Image Tree
Message-ID: <20231030161209.GU496310@bill-the-cat>
References: <20231026072628.4115527-1-sjg@chromium.org>
 <20231026072628.4115527-4-sjg@chromium.org>
 <CAK7LNASATGRaS-6QxzqTEq7qNVkZPXOBE8pfRBg=2bQGyy3=yw@mail.gmail.com>
 <CAFLszThguWT0u0R0EHfpBro0f-pWDwLOGk+5pQZEVhFYNKH8fQ@mail.gmail.com>
 <ZT/NRvLkvR8uuP5+@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZT/NRvLkvR8uuP5+@shell.armlinux.org.uk>
X-Clacks-Overhead: GNU Terry Pratchett
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 30, 2023 at 03:35:34PM +0000, Russell King (Oracle) wrote:
> On Sun, Oct 29, 2023 at 05:46:12AM +1300, Simon Glass wrote:
> > Hi Masahiro,
> > 
> > Sure, but that is a separate issue, isn't it? We already support
> > various boot targets in arm64 but not one that includes the DTs, so
> > far as I can see. The old arm 'uImage' target is pretty out-of-date
> > now.
> 
> Does that mean it can be removed? ;)
> 
> I've NAK'd FIT support on 32-bit Arm in the past, and I remain of the
> opinion that boot loader specific packaging of the kernel should not
> be in the kernel but should be external to it - even more so given the
> multi-platform nature of 32-bit Arm kernels.

I'll point it out here rather than Simon. As part of
https://github.com/open-source-firmware FIT is a standard and not "boot
loader specific". And one of the points of a FIT image is that you can
easily support multi-platform kernels in a single file (without
optimizing things further, at a cost in tens of milliseconds on a Pi 3
anyhow) and with user-controlled security.

-- 
Tom
