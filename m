Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2042E2343B5
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jul 2020 11:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732134AbgGaJun (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Jul 2020 05:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732080AbgGaJum (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Jul 2020 05:50:42 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95938C061574;
        Fri, 31 Jul 2020 02:50:42 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id i26so18632504edv.4;
        Fri, 31 Jul 2020 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lN+Mx9aay7XP6owIiPIJdXITUl7rrQzYabhazGVQjB0=;
        b=ERbE6A9+P9+sSZ5wog7WqOft6HDRUa1ZhGf4ZRjvaukvzVMRiUG28jyK2OCATqS6vK
         NynZHCEDk2WZfmgXg+9UODifR4aNWeRzWSETatwKFKbTvGZGAhJpJJvBmB+eWDS4XSvv
         4m2TrTKavdk1bEoKtgXC4+gJN67nnzpMvYYD8nfxNeBOhgPin0ioekSH+iNhWHQwET7p
         gEWMqY03497GbhJoll3sZPdOKdDJ6MHRcQgR/UYC89VH471VKCcwhOqsAPUG97UUCVNk
         /CMqfajIFl17v4iLIuppw/hYL4DGSJqDUq0jHBHflk1ew6KvfARh+Hv2ug5LcXuDSSL3
         MdNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lN+Mx9aay7XP6owIiPIJdXITUl7rrQzYabhazGVQjB0=;
        b=FBR0V0HhLG/vVwItl8ztq5iIi0O7zLHv699mCaZWSF/BlEICCz9eJc1VDMYIOfn1Xw
         ABzGxw5lxfM8/hqfeh7xbNai4Ngro05SvwRhkSNLt4776olNu1chaiMZEilcyDBBTSKM
         k+21hqP+IYrIaG83LRx7MQYR39Exp07aBcyhkInrfVZxzevEcnwnNkvV8KzmykCD0QQd
         lbbUhfnVxYT5o49E9SV9r8TosGZK3SGE0URIvGQKjskzsSJbr3bh9ufCr0q1lx376s51
         aIUAPbHAzNdilyEMNhcenFpfXaEpE+xPvQTxSZrh0eXjrvtIFVYq17pN0lIbf1lhzF+n
         2Hag==
X-Gm-Message-State: AOAM53317dZE4nzdH2SqLruQ8neOaGAe/LUL0feo6BCXUk8umayFZMlI
        kgZp64wAf8m66O71+2DvW9LSnCCp
X-Google-Smtp-Source: ABdhPJwmCNypLp/cJmGlfSoNI0jIRCvhxWxBZSth46gRORVwLKzhFrx+wasLhUi3axTtV6zM6AeCyw==
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr3052058edu.11.1596189041336;
        Fri, 31 Jul 2020 02:50:41 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id ov32sm1100890ejb.102.2020.07.31.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 02:50:40 -0700 (PDT)
Date:   Fri, 31 Jul 2020 11:50:38 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>
Cc:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v10 7/8] .gitignore: add ZSTD-compressed files
Message-ID: <20200731095038.GA15126@gmail.com>
References: <20200730190841.2071656-1-nickrterrell@gmail.com>
 <20200730190841.2071656-8-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200730190841.2071656-8-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Nick Terrell <nickrterrell@gmail.com> wrote:

> From: Adam Borowski <kilobyte@angband.pl>
> 
> For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
> will come, thus let's be consistent with all other compressors.
> 
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> Signed-off-by: Adam Borowski <kilobyte@angband.pl>

I presume Adam Borowski's Signed-off-by was intended to be added as 
the first entry of the SOB chain?

I've added it, please let me know if that's not OK.

Thanks,

	Ingo
