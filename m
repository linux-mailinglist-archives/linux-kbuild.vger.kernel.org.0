Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74A2F4B5961
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Feb 2022 19:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349359AbiBNSKT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Feb 2022 13:10:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345499AbiBNSKS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Feb 2022 13:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98A12652DF
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Feb 2022 10:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644862209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CGNOFCt1MU85Ts1xBeqV0FyWp/WQxMTDQKYlq49a4uc=;
        b=QM6ImguIZ8zc4cCkdJFURHD34Ls3owlDOTdkpmfFPgjf55xKBNBA68rwYbbjrIYv/QDw+v
        i6wOfxzcl2LAc+dz8o8yepmuHSQ3n0axurH5sFJdnctgJkXXp6Q4I2GmZaOOEUsy68xWzO
        rnAC4vYaOXo+04ubSRO5X2yxRAoGoY8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-ReGH8pBuObu9ZcjFdcO-qg-1; Mon, 14 Feb 2022 13:10:07 -0500
X-MC-Unique: ReGH8pBuObu9ZcjFdcO-qg-1
Received: by mail-qt1-f198.google.com with SMTP id j30-20020ac84c9e000000b002cf986622d1so13108374qtv.6
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Feb 2022 10:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CGNOFCt1MU85Ts1xBeqV0FyWp/WQxMTDQKYlq49a4uc=;
        b=S82h8Za4MKrYb1FYidQVOoy9Crtm54CaDW4henEdpkAaEsXV21+1cYbNChLtoUtpV3
         cM0Tp9eoE6AlN7CYgmRfYoi8BV0aJzniBhM+PDiiuiPDtam3lITfFCtCo46+fK1JiEGc
         JVg3ICrFPpmgt3/qpXquEaKkFPEwIYgLjMA18sTQACWo3jI7VUSJNIJpCPXyzefdXlFY
         UoVzLXRtuJeaD63hBb3yCTKNM0sCuujed34ztMZgIra1Dc5fVaI9EKx5AiPAOfUTLvNi
         SagVqwpVxyISNLZkpFtuSHEnkNYZVR11QR/oZVUZVtJ8jvYYJdu3EGUIz+OK1KW0MTbF
         KE2Q==
X-Gm-Message-State: AOAM530xO8FyW7sIY7AS+Xo1R3cfwotvc6e2ySETLv0tplKcNKQR3O/p
        fhJPgA8T8nedqO1q/LuwOq65BSmidhoZqzTfL8KXnHFmrA2eesqqWU2pRwigYfc+6cEw0fbHvNY
        LOiZjx0hKhuk524p9MxbqOWbu
X-Received: by 2002:a05:6214:762:: with SMTP id f2mr693712qvz.24.1644862206838;
        Mon, 14 Feb 2022 10:10:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/vy40rnBwdMoVvt1Kva6lhknBX3yMZ/S5wMQcb4vy84dEW8nb/n8AHTcudHMUidnRHHxsJw==
X-Received: by 2002:a05:6214:762:: with SMTP id f2mr693693qvz.24.1644862206520;
        Mon, 14 Feb 2022 10:10:06 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id br30sm16056253qkb.67.2022.02.14.10.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 10:10:05 -0800 (PST)
Date:   Mon, 14 Feb 2022 10:10:00 -0800
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Alexander Lobakin <alexandr.lobakin@intel.com>
Cc:     =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
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
        Miroslav Benes <mbenes@suse.cz>,
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
Message-ID: <20220214181000.xln2qgyzgswjxwcz@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
 <20220211183529.q7qi2qmlyuscxyto@treble>
 <20220214122433.288910-1-alexandr.lobakin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220214122433.288910-1-alexandr.lobakin@intel.com>
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 14, 2022 at 01:24:33PM +0100, Alexander Lobakin wrote:
> > One idea I mentioned before, it may be worth exploring changing the "F"
> > in FGKASLR to "File" instead of "Function".  In other words, only
> > shuffle at an object-file granularity.  Then, even with duplicates, the
> > <file+function> symbol pair doesn't change in the symbol table.  And as
> > a bonus, it should help FGKASLR i-cache performance, significantly.
> 
> Yeah, I keep that in mind. However, this wouldn't solve the
> duplicate static function names problem, right?
> Let's say you have a static function f() in file1 and f() in file2,
> then the layout each boot can be
> 
> .text.file1  or  .text.file2
> f()              f()
> .text.file2      .text.file1
> f()              f()
> 
> and position-based search won't work anyway, right?

Right, so we'd have to abandon position-based search in favor of
file+func based search.

It's not perfect because there are still a few file+func duplicates.
But it might be good enough.  We would presumably just refuse to patch a
duplicate.  Or we could remove them (and enforce their continued removal
with tooling-based warnings).

Another variant of this which I described here

  https://lore.kernel.org/all/20210125172124.awabevkpvq4poqxf@treble/

would be to keep it function-granular, but have kallsyms keep track of
what file each func belongs to.  Then livepatch could still do the
file+func based search.

-- 
Josh

