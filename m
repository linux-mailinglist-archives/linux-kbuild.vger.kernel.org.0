Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698483629A1
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 22:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242375AbhDPUtT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 16:49:19 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:57733 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234312AbhDPUtS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 16:49:18 -0400
X-Originating-IP: 50.39.163.217
Received: from localhost (unknown [50.39.163.217])
        (Authenticated sender: josh@joshtriplett.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EA15720002;
        Fri, 16 Apr 2021 20:48:44 +0000 (UTC)
Date:   Fri, 16 Apr 2021 13:48:42 -0700
From:   Josh Triplett <josh@joshtriplett.org>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHn4KqS2tTp2+G7V@localhost>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHkSO3TUktyPs4Nz@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHkSO3TUktyPs4Nz@boqun-archlinux>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 12:27:39PM +0800, Boqun Feng wrote:
> Josh, I think it's good if we can connect to the people working on Rust
> memoryg model, I think the right person is Ralf Jung and the right place
> is https://github.com/rust-lang/unsafe-code-guidelines, but you
> cerntainly know better than me ;-) Or maybe we can use Rust-for-Linux or
> linux-toolchains list to discuss.

Ralf is definitely the right person to talk to. I don't think the UCG
repository is the right place to start that discussion, though. For now,
I'd suggest starting an email thread with Ralf and some C-and-kernel
memory model folks (hi Paul!) to suss out the most important changes
that would be needed.

With my language team hat on, I'd *absolutely* like to see the Rust
memory model support RCU-style deferred reclamation in a sound way,
ideally with as little unsafe code as possible.
