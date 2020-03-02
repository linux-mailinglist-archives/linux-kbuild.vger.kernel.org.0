Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B772175AC0
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 13:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgCBMos (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 07:44:48 -0500
Received: from gate.crashing.org ([63.228.1.57]:35158 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726806AbgCBMos (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 07:44:48 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 022CigGl022511;
        Mon, 2 Mar 2020 06:44:42 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 022Cigx2022509;
        Mon, 2 Mar 2020 06:44:42 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 2 Mar 2020 06:44:42 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: eh_frame confusion
Message-ID: <20200302124442.GI22482@gate.crashing.org>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
User-Agent: Mutt/1.4.2.3i
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 02, 2020 at 11:56:05AM +0100, Rasmus Villemoes wrote:
> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
> to gcc-8 all object files now end up having .eh_frame section.

Since GCC 8, we enable -fasynchronous-unwind-tables by default for
PowerPC.  See https://gcc.gnu.org/r259298 .

> For
> vmlinux, that's not a problem, because they all get discarded in
> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
> modules, which doesn't seem to be useful - given that everything worked
> just fine with gcc-7, and I don't see anything in the module loader that
> handles .eh_frame.

It is useful for debugging.  Not many people debug the kernel like this,
of course.


Segher
