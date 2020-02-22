Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35944168C01
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Feb 2020 03:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbgBVCQW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 Feb 2020 21:16:22 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35028 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728010AbgBVCQW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Feb 2020 21:16:22 -0500
Received: by mail-ot1-f65.google.com with SMTP id r16so3864877otd.2;
        Fri, 21 Feb 2020 18:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hNbrrFkKPFhSR7F7zgyGSYHr2/p2BvESnaaeAk58nuE=;
        b=SaK4TkvhlKL9nOfKFT6YgraHBsFXGdGpPB5Z/AJAFuUxAv2UelJnPYdDJh4oVjDGiH
         Re5HhHkm2nf1sDiT0hiVEj37fNBNm6qWiGZgFsXdV3XzMIWvcMrP+ehKySJ2piBFTN2E
         kiyLdbucbdEU6IbbDSMgiicicMsuZllJ2lXvP5Ji7baR/h8kv55brcdA40yUIXbYaY6x
         Va5H+2mR5vF86Vzw+5GqA6SLVFZGc9fI/JjpLQg5Jy5lgm376GN2e/tuM0UtxB15jFRS
         /f0r1A9qHYs3VWfSEEcmqiJbwhlEF30kj0UhQYPWWUcjXets4gg3zne20HaGw+QhBnq7
         Sz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hNbrrFkKPFhSR7F7zgyGSYHr2/p2BvESnaaeAk58nuE=;
        b=oZdeQZTdi1x1vW2GtIRRoQjvTS3XmOjpJ3oy9zw+hmCQRkb3wdUxXqSCdhp6wWL48W
         DVAtlQVwBvUmppi+DyNC048iFDsP9GZZgcvQfhARe07tUEoIQS55XQi8JI7gCIPY+CNl
         OUA9la9tfNJc7/yqp/MXsy1ZuSlv6c2cmdgd5+KB+GQKypxr/Qkwa5ScrIZ5BYG3ONMu
         8j8pPJB1mQBLn9C2AlD3n2RTMe6YGMADEh4kTl+4fMGqFFj/dZy1iTGyK20Mg2Esbk7+
         jaB9elCaYN2SzjPw6k+ht72ImKSvv7rQYzS7HjaQAu0zn80Aslqe7xAFuBPoUAeAwYZo
         FJrA==
X-Gm-Message-State: APjAAAVAJ1mzx8VWBd/wILqRf2m4kq/iwaAqze7kGKhLKwmQqORuWLVy
        T4SVv8XboolkB4y8J5kzgGk=
X-Google-Smtp-Source: APXvYqwi8LKBV6oX/qnZSLaAgOfMKPpIj1zxsvrfz0yq13DLX3sHxO1QWrBisgQa4rdeg5uKCCUiCw==
X-Received: by 2002:a9d:6e9a:: with SMTP id a26mr29465578otr.344.1582337781285;
        Fri, 21 Feb 2020 18:16:21 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id y6sm1693943oti.44.2020.02.21.18.16.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Feb 2020 18:16:20 -0800 (PST)
Date:   Fri, 21 Feb 2020 19:16:19 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Cc:     linux-kbuild@vger.kernel.org, michal.lkml@markovi.net,
        masahiroy@kernel.org, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] kbuild: move -pipe to global KBUILD_CFLAGS
Message-ID: <20200222021619.GA51223@ubuntu-m2-xlarge-x86>
References: <20200222003820.220854-1-alex_y_xu.ref@yahoo.ca>
 <20200222003820.220854-1-alex_y_xu@yahoo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200222003820.220854-1-alex_y_xu@yahoo.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Alex,

On Fri, Feb 21, 2020 at 07:38:20PM -0500, Alex Xu (Hello71) wrote:
> -pipe reduces unnecessary disk wear for systems where /tmp is not a
> tmpfs, slightly increases compilation speed, and avoids leaving behind
> files when gcc crashes.
> 
> According to the gcc manual, "this fails to work on some systems where
> the assembler is unable to read from a pipe; but the GNU assembler has
> no trouble". We already require GNU ld on all platforms, so this is not
> an additional dependency. LLVM as also supports pipes.
> 
> -pipe has always been used for most architectures, this change
> standardizes it globally. Most notably, arm, arm64, riscv, and x86 are
> affected.
> 
> Signed-off-by: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>

Do you have any numbers to show this is actually beneficial from a
compilation time perspective? I ask because I saw an improvement in
compilation time when removing -pipe from x86's KBUILD_CFLAGS in
commit 437e88ab8f9e ("x86/build: Remove -pipe from KBUILD_CFLAGS").

For what it's worth, clang ignores -pipe so this does not actually
matter for its integrated assembler.

That type of change could have been a fluke but I guarantee people
will care more about any change in compilation time than any of the
other things that you mention so it might be wise to check on major
architectures to make sure that it doesn't hurt.

Cheers,
Nathan
