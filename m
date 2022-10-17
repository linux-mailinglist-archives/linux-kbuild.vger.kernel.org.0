Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B89F6017B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Oct 2022 21:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiJQTcs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Oct 2022 15:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbiJQTcq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2022 15:32:46 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B6511801
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Oct 2022 12:32:42 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id l6so11331200pgu.7
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Oct 2022 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OgoRbFnaF4liUWHPt9WHRYqaz0KaHrlhSQnzgk41VqE=;
        b=GT/v35LuZqCPLrxIFCXsGzIq6UX29tB0UKx6j+JPcHBoPfcu4dRDaBTgnhQyQW/4CA
         u0HRjqYoO06HhlEZ3S+T1lLSJkWrTk1lJcZNZKYhQyU1b6DelWiFNfrDefSd+w+e6RPr
         CXPqndttYWpUGPY0wRJed9zmFVDXfAAHjI4DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgoRbFnaF4liUWHPt9WHRYqaz0KaHrlhSQnzgk41VqE=;
        b=V7Q16g4vsL1wdq2bKnfPgH5s+4VO/JESO1VqeHMCAXQQC/Asnjj2bexa+Wt93pCw4c
         jPtHCyvElOwwRygcc0qSW6a2bLDRH+z/G61fkc8XLKtIav3qB9u4WmZ/AyZm9g9pAdcL
         P2Ab3dTtOXKBi/2C07CoSLKNpBN8vZC5gl8AePjiixAiOUvozua5NFaW7rxaYTweA/+b
         Ai39zkU7cZLzsV+/ZZZKUxykXyQtY+y2+saGKQSghuovvy/GlyhUJNO/zemJw83dvrQa
         CHwtzJAo2gBSs0MAfFSSbMSKI7qUpZy66WxRY4hi5ET/Q86CkI8CfVEdmLMTxEB0hB4l
         slCA==
X-Gm-Message-State: ACrzQf10Z0oPIoAUfqBI4mJdOC4jlDvC9dLJr9oQihqYBAhHHh43+r7R
        EQEc4lxb9td51wooCbFxFpVc0g==
X-Google-Smtp-Source: AMsMyM4SppBWDD+/sle64nI1LMESIyjHFXZcrMzEHZiZk5Ob29HL+SWbGljOvdBFioKXXWS4HDa0JQ==
X-Received: by 2002:a05:6a00:1145:b0:52b:78c:fa26 with SMTP id b5-20020a056a00114500b0052b078cfa26mr14186864pfm.27.1666035162005;
        Mon, 17 Oct 2022 12:32:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q59-20020a17090a1b4100b001efa9e83927sm9766278pjq.51.2022.10.17.12.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 12:32:40 -0700 (PDT)
Date:   Mon, 17 Oct 2022 12:32:39 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     "Li, Xin3" <xin3.li@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
        "H.Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org
Subject: Re: upgrade the orphan section warning to a hard link error
Message-ID: <202210171230.CC40461C@keescook>
References: <BN6PR1101MB216105D169D482FC8C539059A8269@BN6PR1101MB2161.namprd11.prod.outlook.com>
 <Y02eZ6A/vlj8+B/c@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y02eZ6A/vlj8+B/c@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 17, 2022 at 11:26:47AM -0700, Nathan Chancellor wrote:
> It might be interesting to turn orphan sections into an error if
> CONFIG_WERROR is set. Perhaps something like the following (FYI, not
> even compile tested)?
> 
> diff --git a/Makefile b/Makefile
> index 0837445110fc..485f47fc2c07 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1119,7 +1119,7 @@ endif
>  # We never want expected sections to be placed heuristically by the
>  # linker. All sections should be explicitly named in the linker script.
>  ifdef CONFIG_LD_ORPHAN_WARN
> -LDFLAGS_vmlinux += --orphan-handling=warn
> +LDFLAGS_vmlinux += --orphan-handling=$(if $(CONFIG_WERROR),error,warn)
>  endif

Yes, this is much preferred.

> Outright turning the warning into an error with no escape hatch might be
> too aggressive, as we have had these warnings triggered by new compiler
> generated sections, such as in commit 848378812e40 ("vmlinux.lds.h:
> Handle clang's module.{c,d}tor sections"). Unconditionally breaking the
> build in these situations is unfortunate but the warnings do need to be
> dealt with so I think having it error by default with the ability to
> opt-out is probably worth doing. I do not have a strong opinion though.

Correct; the mandate from Linus (disregarding his addition of
CONFIG_WERROR for all*config builds), is that we should avoid breaking
builds. It wrecks bisection, it causes problems across compiler versions,
etc.

So, yes, only on CONFIG_WERROR=y.

-- 
Kees Cook
