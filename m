Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53CE4B9207
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Feb 2022 21:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiBPUBn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Feb 2022 15:01:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbiBPUBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Feb 2022 15:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B4CB9E007
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Feb 2022 12:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645041688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2VxECJm9oCcTZNF1nwOOvaIbVoK8MPKCQvBO1i/w1TA=;
        b=Yez2ZwI0zqRcJ0zllVPyFDBFn9/xuYLuexz6ErBY8X8/+agxUXY2aTCoRvnlcYahp8KDMb
        Nb5JsNGUQHENipJPuU+wltj7Fms65LG6A/wISWeTs+N9Lkjl1sbKM9olEs9fQACgbrq6Qj
        qOCRhmNUIbZNUmQjsn7QqleLvy73paQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-5Kq61BNeP6aC2PG6TTktyA-1; Wed, 16 Feb 2022 15:01:27 -0500
X-MC-Unique: 5Kq61BNeP6aC2PG6TTktyA-1
Received: by mail-qv1-f72.google.com with SMTP id kd18-20020a056214401200b0042de5c14702so2884018qvb.12
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Feb 2022 12:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2VxECJm9oCcTZNF1nwOOvaIbVoK8MPKCQvBO1i/w1TA=;
        b=FKYMGIZGuaP9SUMnpq4cWT7Po1JTFhKc77A7tumbKq2E2EHRhMXRJY4I9iZ1dcshx6
         jULXC6xld18WV7fjo3cVWJD+7YayAkN2HwM0AX4fPBZNUNAg1EYfAUEicqMLvsNIXqdf
         zZB1B+DjoOrRYb5QIVPwqH8rGmxwBmyIwe/ZwO7FcSuUU30kAlxhdhhW3QHtuzz6OjRs
         YlWNEAEEQQG//O7UnV8HbZkrZHzhYRdm7NNhc0p6Fp81ONyAkn+d4IFkaAVYNO/6XhmP
         2l95w9GcXqeVBdLMUOMr8k+FJsWGfprK+DyjBM4birieMbMqirolFy7ofPOAk2VK5ZMw
         U4Ww==
X-Gm-Message-State: AOAM532e4SEIEi305A0cIv/880HgeBU6X98pYKPdLYtZKNc8umKREN8+
        bTg73jLl/vAX1nkyJzsEmtzAnPAOjZJ9t30PlLJtUYnRJfM5c5nIFNFNleH1vCyyfZkwFLXMa9i
        tIXj8r8WteulZNDjpHeh1Qgmx
X-Received: by 2002:ae9:eb12:0:b0:608:4151:c70f with SMTP id b18-20020ae9eb12000000b006084151c70fmr1842253qkg.281.1645041686716;
        Wed, 16 Feb 2022 12:01:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcmcVnXIz7khB34mtSJ5XeCHKuXXwpaasMWVF3vmW0irrcQH4GnwIH7nMDtcIH2X2ytZ5b9A==
X-Received: by 2002:ae9:eb12:0:b0:608:4151:c70f with SMTP id b18-20020ae9eb12000000b006084151c70fmr1842215qkg.281.1645041686423;
        Wed, 16 Feb 2022 12:01:26 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id p6sm8916153qkg.33.2022.02.16.12.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 12:01:25 -0800 (PST)
Date:   Wed, 16 Feb 2022 12:01:20 -0800
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Miroslav Benes <mbenes@suse.cz>
Cc:     =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
        Alexander Lobakin <alexandr.lobakin@intel.com>,
        linux-hardening@vger.kernel.org, x86@kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        Bruce Schlobohm <bruce.schlobohm@intel.com>,
        Jessica Yu <jeyu@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Christoph Hellwig <hch@lst.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marios Pomonis <pomonis@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: [PATCH v10 02/15] livepatch: avoid position-based search if `-z
 unique-symbol` is available
Message-ID: <20220216200120.djt6ijjenmcxmko6@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
 <20220211183529.q7qi2qmlyuscxyto@treble>
 <alpine.LSU.2.21.2202161606430.1475@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LSU.2.21.2202161606430.1475@pobox.suse.cz>
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 16, 2022 at 04:15:20PM +0100, Miroslav Benes wrote:
> > > I subscribe to llvm@lists.linux.dev and happen to notice this message
> > > (can't keep up with the changes...)
> > > I am a bit concerned with this option and replied last time on
> > > https://lore.kernel.org/r/20220105032456.hs3od326sdl4zjv4@google.com
> > > 
> > > My full reasoning is on
> > > https://maskray.me/blog/2020-11-15-explain-gnu-linker-options#z-unique-symbol
> > 
> > Ah, right.  Also discussed here:
> > 
> >   https://lore.kernel.org/all/20210123225928.z5hkmaw6qjs2gu5g@google.com/T/#u
> >   https://lore.kernel.org/all/20210125172124.awabevkpvq4poqxf@treble/
> > 
> > I'm not qualified to comment on LTO/PGO stability issues, but it doesn't
> > sound good.  And we want to support livepatch for LTO kernels.
> 
> Hm, bear with me, because I am very likely missing something which is 
> clear to everyone else...
> 
> Is the stability really a problem for the live patching (and I am talking 
> about the live patching only here. It may be a problem elsewhere, but I am 
> just trying to understand.)? I understand that two different kernel builds 
> could have a different name mapping between the original symbols and their 
> unique renames. Not nice. But we can prepare two different live patches 
> for these two different kernels. Something one would like to avoid if 
> possible, but it is not impossible. Am I missing something?

Maybe Fāng-ruì can clarify, but my understanding was that the stability
issue affects the kernel in general (particularly if LTO or PGO is
enabled) and isn't necessarily specific to livepatch itself.

-- 
Josh

