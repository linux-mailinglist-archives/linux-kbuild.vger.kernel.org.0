Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48EF257FEDA
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jul 2022 14:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbiGYMRa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jul 2022 08:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbiGYMR3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jul 2022 08:17:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 923811A3B5
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 05:17:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 395FB61050
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 12:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E19C341C6
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Jul 2022 12:17:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
        dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ATDtDJaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1658751446;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bK/YvwfROKSRDyXQJn91Dl18uO1oeV6IpFanZCzkJ48=;
        b=ATDtDJaNVRBzkl/6lXMsyNUyLERW3WRW5IFv0p+5yG8cY2GMRHSNhNxFVHNyJDIvNrsuWV
        NlBB4OSEX0eP0KZtpNM22Gf3RWRy3ko0jXCUKfrPFeLj1Yk9ebaA0i1gUqsv/HUay42iNC
        YKfDEOYiDhY/5RuYl+lCOAhH1MvC6qw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f8d6440d (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
        for <linux-kbuild@vger.kernel.org>;
        Mon, 25 Jul 2022 12:17:25 +0000 (UTC)
Date:   Mon, 25 Jul 2022 14:15:00 +0200
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     Albert Huang <huangjie.albert@bytedance.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Eric Biederman <ebiederm@xmission.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Michael Roth <michael.roth@amd.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sean Christopherson <seanjc@google.com>,
        Joerg Roedel <jroedel@suse.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/4] kexec: add CONFING_KEXEC_PURGATORY_SKIP_SIG
Message-ID: <Yt6JRBToqY5ts6OU@zx2c4.com>
References: <20220725083904.56552-1-huangjie.albert@bytedance.com>
 <20220725083904.56552-3-huangjie.albert@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220725083904.56552-3-huangjie.albert@bytedance.com>
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Albert,

On Mon, Jul 25, 2022 at 04:38:54PM +0800, Albert Huang wrote:
> +config KEXEC_PURGATORY_SKIP_SIG
> +	bool "skip kexec purgatory signature verification"
> +	depends on ARCH_HAS_KEXEC_PURGATORY
> +	help
> +	  this options makes the kexec purgatory do  not signature verification
> +	  which would get hundreds of milliseconds saved during kexec boot. If we can
> +	  confirm that the data of each segment loaded by kexec will not change we may
> +	  enable this option
> +

Some grammar nits here, but actually, wouldn't it be better to make this
depend on some other signature things instead? Like if the parent kernel
actually did a big signature computation, then maybe the purgatory step
is needed, but if it didn't bother, then maybe you can skip it. This
way, you don't need a compile-time option that might change some aspect
of signature verification people might otherwise be relying on.

Jason
