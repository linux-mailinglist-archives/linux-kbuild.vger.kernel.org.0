Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939826AA09B
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Mar 2023 21:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbjCCU3d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Mar 2023 15:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbjCCU31 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Mar 2023 15:29:27 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397B210A8F
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Mar 2023 12:29:25 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id y2so3776651pjg.3
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Mar 2023 12:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1677875364;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ug2Z8EfRGa5wXZv9R1S7FFDl+MMXhp2ajp3G/Mo9nU4=;
        b=NtmQWi9toAZw3wKPMJ7L+bVX7AsKeXEUVZzNc61Sv1eAtGplSPyGYSdSz/thuFy3Ro
         l0ljb+r0Ij9ZZciynPhNjmrA+EYfaAbbaA1b8Cv7CMo4felDMzLv/e23Dpja0c+f6x9r
         vxtGhYy7Vif1k7Be1sRbTvqcEiOxW4Z/ZMvX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677875364;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ug2Z8EfRGa5wXZv9R1S7FFDl+MMXhp2ajp3G/Mo9nU4=;
        b=LxrIsg/hKB5ZcYXayxVZvKbydPsvDq8/U6krwSmW6AbkuIXqgj/R5uBwMrhgdIKgPu
         iyA9UJHdBEYXuBM3dBGogozEwmx9eb7VQsBDk5hr/fNaERmNn6vLRBNOIj8H7CBx5NA3
         y5o36/LCd6Q0ZXenO0lTve0axAhGZg1sp48UN/Wbkqh8V6ocbvSzrizHhnYiVdgOrk5D
         bMZu0pxLaGcpu4TPaxxSuo3D9hKun6cYsKt0E5XK7K0AqGDesPQzzfvJTdYo8mYRCDS1
         60s8qo/J3141INS4IYnJduCsqEFj6ps4Gms5Pi9nGCVVNYowqaxlhBKkovbhuGRVEA89
         ll0Q==
X-Gm-Message-State: AO0yUKVEMTTUw0P1ZV1s3GRKPPAQVcXdGCsW6G6BVUGbw79QPb5Y0KOr
        rHzpP47/eicUd5rOZMqG/uLIFA==
X-Google-Smtp-Source: AK7set8Hbguq1EyX4kofN/jOOCOGo1tFROI/fI6a3VBD2O6AZtNvSLeX3ZNdPVBgKunGYTMNZUCjTA==
X-Received: by 2002:a17:90b:4b41:b0:234:a9df:db83 with SMTP id mi1-20020a17090b4b4100b00234a9dfdb83mr2996268pjb.10.1677875364637;
        Fri, 03 Mar 2023 12:29:24 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id r3-20020a17090aa08300b00230befd3b2csm3907348pjp.6.2023.03.03.12.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 12:29:24 -0800 (PST)
Message-ID: <640258a4.170a0220.a298f.8ed5@mx.google.com>
X-Google-Original-Message-ID: <202303031226.@keescook>
Date:   Fri, 3 Mar 2023 12:29:23 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Marco Elver <elver@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] ubsan: Tighten UBSAN_BOUNDS on GCC
References: <20230302225444.never.053-kees@kernel.org>
 <20230303154433.GA3775@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303154433.GA3775@dev-arch.thelio-3990X>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 03, 2023 at 08:44:33AM -0700, Nathan Chancellor wrote:
> On Thu, Mar 02, 2023 at 02:54:45PM -0800, Kees Cook wrote:
> > [...]
> >  config CC_HAS_UBSAN_ARRAY_BOUNDS
> >  	def_bool $(cc-option,-fsanitize=array-bounds)
> > +	help
> > +	  The -fsanitize=array-bounds option is only available on Clang,
> > +	  and is actually composed of two more specific options,
> > +	  -fsanitize=array-bounds and -fsanitize=local-bounds. However,
> > +	  -fsanitize=local-bounds can only be used when trap mode is
> > +	  enabled. (See also the help for CONFIG_LOCAL_BOUNDS.)
> 
> The first sentence does not read right to me, you have array-bounds
> twice. I think the first one wants to be just bounds?

Oops, yes. I rewrote that a few times and seem to have gotten lost. I
think it is better written as:

	  Under Clang, the -fsanitize=bounds option is actually composed
	  of two more specific options, -fsanitize=array-bounds and
	  -fsanitize=local-bounds. However, -fsanitize=local-bounds can
	  only be used when trap mode is enabled. (See also the help for
	  CONFIG_LOCAL_BOUNDS.) Explicitly check for -fsanitize=array-bounds
	  so that we can build up the options needed for UBSAN_BOUNDS
	  with or without UBSAN_TRAP.


-- 
Kees Cook
