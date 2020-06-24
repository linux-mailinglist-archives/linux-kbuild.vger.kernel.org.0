Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207B6207EEF
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 23:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405057AbgFXVwi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 17:52:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405108AbgFXVwh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 17:52:37 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710CDC061796
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:52:37 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bh7so1679042plb.11
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 14:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZlZyjdUHfTmn42OuhaukPgD3qQeRnM/SwkQPWmFMjno=;
        b=gkQ03mH+pPQbaY26mXH9tyFtYNKkc69RJVql3zuiAJ9HIg/y5EOgT1k1p8MPr1NS2p
         0+9hv/B8bA8y01i7lTNiIORUq/cOqzJHzcy92+dzag7XYVdUX0EM3i8tlsySkKFAcx1W
         EsBVlaYTjHyKIaqiR5f+zZkVnqGQKjJtrJF7neBM45lEg19dUfITLa6w50pvskzp+H3Q
         7+LiARiXwvKUf+3wbAxBMvD0W3zQDujuEi0Ff7RCeS/cXPDUV5GS8pCW67UEdB7YUlbF
         0gxAzEoMpBl65jky4H43Nbd4ZEdySbpIt0IKZBbG4xl5q5BlvUG77XQRz/Foyl8g2Bff
         X4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZlZyjdUHfTmn42OuhaukPgD3qQeRnM/SwkQPWmFMjno=;
        b=EcqcTdH7YmUWOHbzDV8JdilTQ/io93pEHr7HhsV6RmbEDNOP+m88nFwUdI9zM2BmEu
         XVPc0PqszFmFmqyyyKuUWLuXDlNZZY0OOjdM1O3mM9/OVhWblpax1gUlmyeHt99y3KgV
         0wyGL0jsuCth4FCLVoTQN1mkAi7fPps6uRBFTIXiym8ZJ5Nislvd7pRWSU9cgfb2NdDJ
         rbTuw3kDWPKUBh3hxS/swCB92bBooOI8s0Z8nO1wCnAFVqk8zFzTmEwMyLuzzbPrSbN8
         AQj6Ix9LIJvqB7XXd1AOuXQxMcnuqpKmpQhFG6ygVUxXyQREuMf/ie/WpzJpEsUwXZxG
         bDJQ==
X-Gm-Message-State: AOAM530NYIwHqW4W2A3wIYkImU42PyQHZoTVlziMGUNKTSOePdeTzv+v
        Pw477JdbMxWby++v23b6aoAptg==
X-Google-Smtp-Source: ABdhPJy+JpaxqpHIcJHjR6LpPq5kjrXe0+X/cVoPhow+mRdRGR18dTuC1hpKBoYOG/LhDJ7hbA1ueg==
X-Received: by 2002:a17:90a:dc16:: with SMTP id i22mr30660369pjv.84.1593035556605;
        Wed, 24 Jun 2020 14:52:36 -0700 (PDT)
Received: from google.com ([2620:15c:201:2:ce90:ab18:83b0:619])
        by smtp.gmail.com with ESMTPSA id 2sm6487093pfa.110.2020.06.24.14.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 14:52:35 -0700 (PDT)
Date:   Wed, 24 Jun 2020 14:52:31 -0700
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: [PATCH 17/22] arm64: vdso: disable LTO
Message-ID: <20200624215231.GC120457@google.com>
References: <20200624203200.78870-1-samitolvanen@google.com>
 <20200624203200.78870-18-samitolvanen@google.com>
 <CAKwvOdnEbCfYZ9o=OF51oswyqDvN4iP-9syWUDhxfueq4q0xcw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdnEbCfYZ9o=OF51oswyqDvN4iP-9syWUDhxfueq4q0xcw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 01:58:57PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Wed, Jun 24, 2020 at 1:33 PM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Filter out CC_FLAGS_LTO for the vDSO.
> 
> Just curious about this patch (and the following one for x86's vdso),
> do you happen to recall specifically what the issues with the vdso's
> are?

I recall the compiler optimizing away functions at some point, but as
LTO is not really needed in the vDSO, it's just easiest to disable it
there.

Sami
