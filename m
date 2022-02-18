Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B96D4BC0F8
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Feb 2022 21:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238624AbiBRUIi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Feb 2022 15:08:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbiBRUIg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Feb 2022 15:08:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DCF7F24B2A3
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Feb 2022 12:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645214896;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qbD0qiU4RjhqV726jofvBeaOVqKh7JjTJAB5iz2l93M=;
        b=cA7EwE5OdFiTLj2JF3mjF4lI6iI+z3lsffT4McmY3J3L3ZtEAJ3UrMQ8iv6sz+qdHsQ8qz
        30mp4oi3Pcxr1W2A4iM/+nUzrTY/KIaOOpbqkrkLywNuMpfZqgzBQpt38FoSyXtmly/gPF
        cB4ISfdUG4W9MIusrvPBxFyUN396AVk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-St9OrCeeMd-SYn-HUGmXAQ-1; Fri, 18 Feb 2022 15:08:15 -0500
X-MC-Unique: St9OrCeeMd-SYn-HUGmXAQ-1
Received: by mail-qv1-f71.google.com with SMTP id kd18-20020a056214401200b0042de5c14702so9979374qvb.12
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Feb 2022 12:08:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qbD0qiU4RjhqV726jofvBeaOVqKh7JjTJAB5iz2l93M=;
        b=f9r0VksO3Zl141GpmBqmDONXOjZyMWZnzzeTZ4HQXbTc5+YVSl3HCuhlxW4sHVrNmn
         IcWK1kkg0ePZ5kXsXsBA1FYMe5FZ27+VoIiFO0Sxl0J1O1mSjd3l5Omv8HYgS4fo8cMF
         xdjscPbk+sA0E2QLqdwaDEAZQb15s8jdiRSmOYb+uRprJ1vjYaz95FOT2NSq5fREVCSA
         2Nh4Xtp7w6Sc5t79cAHsVLtZUL6+dYAUDxr0VgFSA9FXbEI1H7R+HLw+QD9vTIvBAfCQ
         zlGcVsgt7MIdx28q7q2WKTWCa35AuuAxlBrP0f/L1+T6e1I+D5ZhaQy76Fj89nrMg4gV
         K3yQ==
X-Gm-Message-State: AOAM532SNtHlff+2iGb3YNh2xCnRpf9MIsWqpSe4/1B9bmmL+hdnLj+j
        AnbbHo/zzZOD/jRcDvgT5CXdF+/XZD7rfU3uKHrp2bo86VKHBdRBfklpNOCx5i1EWFtKrGrjjxS
        p3WwtsIl+UaIHr6EoJvX7FuT6
X-Received: by 2002:a05:6214:17c2:b0:42c:b915:69f with SMTP id cu2-20020a05621417c200b0042cb915069fmr7009969qvb.95.1645214894989;
        Fri, 18 Feb 2022 12:08:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyES3jxSXm6PUQSrWkCWkJOx1aXkyiFLiwQrMEdx8mKix/Dv/YjSGuwkSGrstdFEaba1AKRqg==
X-Received: by 2002:a05:6214:17c2:b0:42c:b915:69f with SMTP id cu2-20020a05621417c200b0042cb915069fmr7009947qvb.95.1645214894772;
        Fri, 18 Feb 2022 12:08:14 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id e64sm6288522qkd.122.2022.02.18.12.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 12:08:14 -0800 (PST)
Date:   Fri, 18 Feb 2022 12:08:08 -0800
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     Miroslav Benes <mbenes@suse.cz>,
        =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
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
Message-ID: <20220218200808.juxnoidtxa7fjsk7@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
 <20220211183529.q7qi2qmlyuscxyto@treble>
 <alpine.LSU.2.21.2202161606430.1475@pobox.suse.cz>
 <20220218163111.98564-1-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220218163111.98564-1-alexandr.lobakin@intel.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 18, 2022 at 05:31:11PM +0100, Alexander Lobakin wrote:
> it took 2 minutes to generate the whole map (instead of a split
> second) (on 64-core CPU, but I guess nm runs in one thread).
> I guess it can be optimized? I'm no a binutils master (will take a
> look after sending this), is there a way to do it manually skipping
> this nm lag or maybe make nm emit filenames without such delays?

Hm, yeah, adding 2 minutes to the link time isn't going to fly ;-)  It
probably takes a while to parse all the DWARF.

Based on ther other discussions I think just using the basename (main.o)
in STT_FILE would be good enough.  Some duplicates are probably ok.

-- 
Josh

