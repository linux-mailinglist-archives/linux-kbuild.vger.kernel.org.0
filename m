Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8FDC194363
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 16:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgCZPkv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 11:40:51 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36391 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbgCZPku (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 11:40:50 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so8378829wrs.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=malat-biz.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XEACa47R1YYA9qHdOiFfEkBUAM/n215wAmRNcBN8QwY=;
        b=Fdjop2Y7+L6YPRRq3UV/wtGW2NHguQSXMW9DdVOKRM4FI1a8TVD6RUBb0p2AL+YVLY
         86uf2MCprux6gKpqMXQDyPrhgzrLd0BGo6ylK+XeCEcD/nguONB71GyxnKzUwL32llKH
         8RRO+S/3awfwIojE86vdypyUtHq0HjV23+eovqI+vKi0BSfl190styxTnAoFZI4r/JtM
         ZO2oYik9u03NDJGJ0jvgTAA8EF02O1EKG7Kt0n5Sp9xanFHBJcPXt/8+u4VVoJzlY17e
         6MdsWQVcPMDqCqpsd8LwzihzaT70AI/h4QYoAVotXdBQjFaSPnDZDj11WzNtDEga5WnW
         8jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XEACa47R1YYA9qHdOiFfEkBUAM/n215wAmRNcBN8QwY=;
        b=kN/tdTZEkHreyz2ATu1VkUOtsWkJdJtATCJPmsyj+ocPWyA01iv40FKzg03YqGRvx7
         RpB66z1O52yYUJQrS39LtWrK+vpFXyPXQDhfu7DjEalS/0AT+2zcsFxz5fs7NiZ06uvc
         9SCmxE03zP7HyZyGsgi7zQkkPV1AoXhxS0qP2kyGXi3L4UkSYZDOa11MhojfR0dNaJDa
         RsHfrMgVPlerAICGLGM1bZtNPVMk4wWuCNJvnUPLaQr9PKK2cbbv9sO4nSsKpLNPeD7D
         6I/UuNRBUVLyU89Axj3x8/9zh2t06aZ2M3+XOdYAspjpaIRtJLoiHQNp7WwAP1oYLsKl
         E/TQ==
X-Gm-Message-State: ANhLgQ1wUJ3JF3qWHN59cQOmndSsh0LhtG6GcTSHWpA/3MIZoIVDDoLV
        dw58xknCAfOp5YOfZo3T+8BP3g==
X-Google-Smtp-Source: ADFU+vtop7dLCupf/5Cj0LJPXEZFIZb8nPl47px+m0Juh6AjaUQIZHhP5YiWzaS9s6aHc/n/JZymqQ==
X-Received: by 2002:a05:6000:370:: with SMTP id f16mr10335036wrf.9.1585237249033;
        Thu, 26 Mar 2020 08:40:49 -0700 (PDT)
Received: from ntb.petris.klfree.czf (p5B36386E.dip0.t-ipconnect.de. [91.54.56.110])
        by smtp.gmail.com with ESMTPSA id c5sm11522353wma.3.2020.03.26.08.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 08:40:47 -0700 (PDT)
Date:   Thu, 26 Mar 2020 16:40:38 +0100
From:   Petr Malat <oss@malat.biz>
To:     Nick Terrell <nickrterrell@gmail.com>
Cc:     Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org,
        Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org,
        x86@kernel.org, gregkh@linuxfoundation.org,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH v3 1/8] lib: prepare zstd for preboot environment
Message-ID: <20200326154038.GA21231@ntb.petris.klfree.czf>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-2-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325195849.407900-2-nickrterrell@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick,
I finally got some time to review your patch, here are my comments:

On Wed, Mar 25, 2020 at 12:58:42PM -0700, Nick Terrell wrote:
> * Don't export symbols if ZSTD_PREBOOT is defined.
I'm not sure if this is needed. When I worked on my patch, I have found that
all exporting and modinfo macros generate symbols in modinfo and discard.ksym
sections, which are then dropped by the vmlinux linker script, thus one
will get the same binary independently if he puts this change in or not.

I'm not sure if this is intentional as there is also __DISABLE_EXPORTS define,
which should be used by a decompressor (according to comments in export.h).

> * Remove a double definition of the CHECK_F macro when the zstd
>   library is amalgamated.
> * Switch ZSTD_copy8() to __builtin_memcpy(), because in the preboot
>   environment on x86 gcc can't inline `memcpy()` otherwise.
> * Limit the gcc hack in ZSTD_wildcopy() to the broken gcc version. See
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81388.
No comments to the rest.
  Petr
