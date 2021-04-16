Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A4F36245A
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 17:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235488AbhDPPoG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 11:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236017AbhDPPoE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 11:44:04 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C2AAC061574;
        Fri, 16 Apr 2021 08:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=u0q6i4p0A1Xq+FzrPxCkcWRtaIl82014FLZ7LRyz5aU=; b=nsN75AlQzPpc5/Q88Ato4cGX3H
        0iUpvFRvQGE9WYyEzwlscppyr/rX/7Lgxm2gmDC071GStZdLwW6Pe3ui4O0MLPaSHxvcFNwPHNAeI
        Wn8i/h0W0JF0ONg0EUKLda8yZHfYrOeJhdg4erEMh/ZWkPxYJ+p9HACQ3a1MkdlvpVGYjmMGv09Vb
        PZojhFJcVdHeMN+YCmY232mx8irJiLkg50JQP6WAYNjNvp479d3VozFZE7MOzMyDv4+atk/QfSGEl
        xna+txU/4Lktk4edb3OzUHpQSc7j8TKUF2ki2e2+9HglB0X8RH8YWDPrcRFvPXBZPpcur6OzaO+e/
        M86Q8NiQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXQcz-002fFh-Ri; Fri, 16 Apr 2021 15:43:33 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 61689300212;
        Fri, 16 Apr 2021 17:43:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4BDF92122BE98; Fri, 16 Apr 2021 17:43:29 +0200 (CEST)
Date:   Fri, 16 Apr 2021 17:43:29 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHmwoe8+mNPBFm1R@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <CANiq72n9ocqaFQnOjUO95_7Xd3wpWShtzMKrBQE2gN8jOyrW5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n9ocqaFQnOjUO95_7Xd3wpWShtzMKrBQE2gN8jOyrW5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 05:04:41PM +0200, Miguel Ojeda wrote:
> Of course, we could propose something similar for C -- in fact, there
> was a recent discussion around this in the C committee triggered by my
> n2659 "Safety attributes for C" paper. 

http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2659.htm

That's just not making any damn sense what so ever. That seems to be
about sprinkling abort() all over the place, which is just total
rubbish.
