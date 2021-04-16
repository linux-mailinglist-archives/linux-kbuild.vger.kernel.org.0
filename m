Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB406361AC9
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 09:47:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238434AbhDPHra (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 03:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbhDPHra (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 03:47:30 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA577C061756;
        Fri, 16 Apr 2021 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=yARDubTAW16ynkF8c/yw773S6TNuq+8S9TYWNugBiOc=; b=OvhpMDykqkB1uxDecS/m2oaj74
        qRGuIhlyZapbjjQ3BnBFHbB+YB7uh//Z0WfR/bHbOnUbnB/R9hXgpKJt0NLqwGwvo1CvNgN20AorC
        1CQJaWpVZ7xgrHKenRdkQ7214mW/KcTJUcTUE9AH6FzbUjW9pziTOR7zpgWdJSmRjo6aHzDOlZ2jp
        N6KVZONNRJB39PLyK+KoURL85gL/EiIXtXvyWorEa/ny9IYLTFrvaok34ZKC93qykYTDEfOEdbBS6
        DHHIHkYTKE1S6AUEPfstV4jLooGgTyjK9Dk0ytJ+vtom/YRKBFqIlHR1uTROQpHIukXrUjGOJIhsR
        RaoD5FgQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXJBT-009e66-3Q; Fri, 16 Apr 2021 07:46:43 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E4609300212;
        Fri, 16 Apr 2021 09:46:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C09C326511154; Fri, 16 Apr 2021 09:46:33 +0200 (CEST)
Date:   Fri, 16 Apr 2021 09:46:33 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHlA2cPkk74on7kl@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHkRvhIeO2794f7v@zeniv-ca.linux.org.uk>
 <YHkaaTQ2KQML2iqt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHkaaTQ2KQML2iqt@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 06:02:33AM +0100, Wedson Almeida Filho wrote:
> On Fri, Apr 16, 2021 at 04:25:34AM +0000, Al Viro wrote:

> > And as one of those freaks I can tell
> > you where exactly I would like you to go and what I would like you to do
> > with implicit suggestions to start a browser when I need to read some
> > in-tree documentation.
> 
> I could be mistaken but you seem angry. Perhaps it wouldn't be a bad idea to
> read your own code of conduct, I don't think you need a browser for that either.

Welcome to LKML. CoC does not forbid human emotions just yet. Deal with
it.
