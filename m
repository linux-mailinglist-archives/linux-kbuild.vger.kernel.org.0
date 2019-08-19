Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E66019497A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 18:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726742AbfHSQJZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 12:09:25 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35324 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbfHSQJZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 12:09:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id k2so9308180wrq.2;
        Mon, 19 Aug 2019 09:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jopRZr5rirHRrOwX/83i4Za+nhdtinIu3t3rEz9kHGI=;
        b=QKpuUher4+uIIBAo+WFBLOvboqwLYxYuU9cnchtO8BRKpxQVftAMe15tR0YigiAlNF
         2eBEOwUn0koH8Xifa3mzdSLHv9dCttUbcQNp2uSijbUgD61XBLnNQodfq0RFZN8HAty1
         3VjRRZIt1tWVCvavrAllLCeP7s/lWoecJzA6e0KTFRQBMo8mfFfoSW/B9KvH5PUTlaXe
         WhExYRPlEKX0lW6h/HSreUyKAO3NrARKR9hZ5/BWCpehTbgWGiC9uoPnP7Qm+8aiCrho
         duzHtg3abwQ7Wpd+B4ojogmH2SUoeDNhfAat15DOFM2jkvagj4l+GHazGyyS25fgCkvl
         N15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jopRZr5rirHRrOwX/83i4Za+nhdtinIu3t3rEz9kHGI=;
        b=fqBBISZjtS4s7TZWAH4XgKS/B2b7fLOBUnfKBqlg70r0dcQ8mVX2TUgklRT101qBGw
         bUXHJGf1AizzYgiicHrLBYh8fa/hzrb2DmrYLMUAeNQd2SHZPiWQs3ew3pLYsdVPibcL
         MIGp3RAvSo5wfwx6hRYrZoPPYEqPrxE3JuzrdvK6XJefAwK91QilD1NlD//8+VousnbG
         KBHQj5BkKEdWp6i830mKgAUmVTzFmS8MtW64T79HFcLXcNjovD78Pu0E6itZARS769C2
         nV2OVxbzcPS2Np5vznMR6vDgot8fukVFHdaU6p+K4jVFTMMKZi7MSZ54m8/Pma4z8VtG
         2m8g==
X-Gm-Message-State: APjAAAV6NIcmmoFSZ3qsNzs6sRay1fHgWcgv0cdkj0mrZn7bb0hWDQWU
        8PoLi7x4PF7rDDx7Z1M4otA=
X-Google-Smtp-Source: APXvYqxSQZ4aUP2N+zLyafLsDeEq3T2PAatY1neZ+EGYyqVUXLQM+Te2l35TMI63hiI0Q8cKS6O0ig==
X-Received: by 2002:adf:ce04:: with SMTP id p4mr29018938wrn.227.1566230962458;
        Mon, 19 Aug 2019 09:09:22 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id 39sm50025159wrc.45.2019.08.19.09.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 09:09:21 -0700 (PDT)
Date:   Mon, 19 Aug 2019 09:09:20 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Burton <paul.burton@mips.com>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: enable unused-function warnings for W= build
 with Clang
Message-ID: <20190819160920.GA108942@archlinux-threadripper>
References: <20190819105138.5053-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819105138.5053-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 19, 2019 at 07:51:38PM +0900, Masahiro Yamada wrote:
> GCC and Clang have different policy for -Wunused-function; GCC does
> not report unused-function warnings at all for the functions marked
> as 'static inline'. Clang does report unused-function warnings if they
> are defined in source files instead of headers.
> 
> We could use Clang for detecting unused functions, but it has been
> suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> warning for unused static inline functions").
> 
> So, we never notice left-over code if functions in .c files are
> marked as inline.
> 
> Let's remove __maybe_unused from the inline macro. As always, it is
> not a good idea to sprinkle warnings for the normal build. So, these
> warnings will be shown for the W= build.
> 
> If you contribute to code clean-up, please run "make CC=clang W=1"
> and check -Wunused-function warnings. You will find lots of unused
> functions.
> 
> Some of them are false-positives because the call-sites are disabled
> by #ifdef. I do not like to abuse the inline keyword for suppressing
> unused-function warnings because it might affect the compiler's
> optimization. When I need to fix unused-functions warnings, I prefer
> adding #ifdef or __maybe_unused to function definitions.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

So if I understand everything correctly, this change allows us to start
finding unused static inline functions with clang at W=1 but disables
-Wunused-function by default... I am not sure that is a good tradeoff
as I am pretty sure that W=1 is fairly noisy for clang although I
haven't checked lately. I'd argue most regular developers do not build
with W=1 meaning -Wunused-function generally will not be run with clang
at all, missing stuff like this:

https://lore.kernel.org/lkml/20190523010235.GA105588@archlinux-epyc/

https://lore.kernel.org/lkml/1558574945-19275-1-git-send-email-skomatineni@nvidia.com/

Furthermore, per the documemtation [1], -Wno-unused-function will also
disable -Wunneeded-internal-declaration, which can help find bugs like
commit 8289c4b6f2e5 ("platform/x86: mlx-platform: Properly use
mlxplat_mlxcpld_msn201x_items").

[1]: https://clang.llvm.org/docs/DiagnosticsReference.html#wunused-function

Is there a way to conditionally remove __maybe_unused from the inline
defintion so that we keep the current behavior but we can still
selectively find potentially unused functions?

Cheers,
Nathan
