Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53069363070
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 15:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhDQNxn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 09:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236058AbhDQNxm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 09:53:42 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB58C061756
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 06:53:16 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o9-20020a1c41090000b029012c8dac9d47so8592594wma.1
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AewrO9ydZMH8IFjVd/qYNAdik/pmPwbpo6Np+kmyKYg=;
        b=LprgzkCTYyqpRBvY/OpJ5/Lw+b1fQGdy7g/Enp9yXjYrwuK0MXw3kDYO+jTVo4AM2O
         da349ZM4/Nio1LQFnTQBh8PdKz12IvSipdyhHL8DjTeljE3RceRtXTG/6CczWnLsmf3B
         ulKaALHU8CRPxtrVb9hD3ogh+kuadPguT2Ej7vHO79q8vj8IOE3N9Ix0l2G6jHCvVRmi
         qnArsiiziY8R4KMLfWqUBkgsIndGyrf4FG4PZbXEsgR2WKzgc4LOanTwtwky7jXdIQXd
         71PMY9eC/OdM8bASwiHbP/tuvDUDapptPBkCHRt0ppck0eI0xkrbnLshbeckXqg1n5LS
         d/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AewrO9ydZMH8IFjVd/qYNAdik/pmPwbpo6Np+kmyKYg=;
        b=N4ddUlcKglhWAaji7Od2Ikf/xCaFWyCX0fz1G6HPfMgnQJqNZO/9+cBsaBTSkNbFJQ
         P94N9AJygb97H/Sizwzr+F2i2IkZfjTgsZ6jvPQRxrjj/OjXh+Y5hnB+iM8eD9P8+i/a
         7o2g2IX+AxxLq7431Yh0BUPZ/dq0xZHva6E2j2kaxJJy98dT792Z34ujMxxZ3IRHrkX/
         VHkmg2SqPo9FmtN+bxk1NczFYoMA4ESmneDBytJeN6AzIt0eaWdB7xgrIF3BHyot2CWH
         f5KybUPdi0TwDlzv5WNCCRjwHYX2OOmZ4ELiwDp2K4lzJVtlNxec13sQvU592su4KPVl
         W/tg==
X-Gm-Message-State: AOAM532KlyOqq4hB4q5rKCfPdVKEJ+O1B1Ew5Ri6HJiGpwjDiSKLFnPi
        pi+BI+3EezNUzZOPKbSDahGN
X-Google-Smtp-Source: ABdhPJx6T84mDYcYChTDx6mFZZd5JbkVIL1vfaM8A6FMAjA3GZ43YPjDBzJtaAVdVRIuMA0uMvFRtQ==
X-Received: by 2002:a05:600c:3594:: with SMTP id p20mr12286134wmq.173.1618667594637;
        Sat, 17 Apr 2021 06:53:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:3c1c:8462:b77e:21a4])
        by smtp.gmail.com with ESMTPSA id o5sm12394021wmc.44.2021.04.17.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 06:53:14 -0700 (PDT)
Date:   Sat, 17 Apr 2021 14:53:10 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHroRuI7lYDABWJR@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416161444.GA10484@1wt.eu>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 06:14:44PM +0200, Willy Tarreau wrote:

> But will this remain syntactically readable/writable by mere humans ?

I would certainly hope so.

> > Note that this is
> > another area where Rust offers advantages: read-only guards (in C, if you take a
> > read lock, nothing prevents you from making changes to fields you should only be
> > allowed to read);
> 
> But I'm happily doing that when I know what I'm doing. What you call a
> read lock usually is in fact a shared lock as opposed to an exclusive
> lock (generally used for writes). For me it's perfectly valid to perform
> atomic writes under a read lock instead of forcing everyone to wait by
> taking a write lock. You may for example take a read lock on a structure
> to make sure that a field you're accessing in it points to stable memory
> that is only modified under the write lock, but the pointer itself is
> atomically accessed and swapped under the read lock.

Yes, this is a great example. Also easily expressible in Rust: they have this
concept of interior mutability where certain types allow their contents to be
modified even when shared immutably. Atomics offer such interior mutability, so
the scenario you describe is fine.

Rust in fact has an extra enforcement here that C doesn't: it requires interior
mutability for this scenario to be allowed, so you can't do it with a plain
naked type (say u64) -- you'd need to use something like an atomic64_t, where
you're required to specify memory ordering when accessing them.

In C we of course have atomics but the compiler never alerts us for when we need
them.

> > In fact, this is also an advantage of Rust. It would *force* developers to
> > lock/unlock the RCU lock before they can access the protected data.
> 
> I'm really afraid by languages which force developers to do this or that.

When I say that Rust forces developers to do certain things, it's to provide the
compile-time safety guarantees. Some of these requirements are imposed by our
own abstractions -- we can always revisit and try to improve them. In cases when
the abstractions cannot be further refined, developers always have the escape
hatch of unsafety, where they're allowed to do pretty much everything as in C,
but then they also give up the compile-time guarantees for those parts.
