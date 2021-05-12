Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEF737BAA0
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 12:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhELKeL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 06:34:11 -0400
Received: from gate.crashing.org ([63.228.1.57]:39489 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhELKeL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 06:34:11 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14CAQgOQ001475;
        Wed, 12 May 2021 05:26:42 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 14CAQe4i001474;
        Wed, 12 May 2021 05:26:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Wed, 12 May 2021 05:26:40 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Alexey Kardashevskiy <aik@ozlabs.ru>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for preprocessor
Message-ID: <20210512102640.GT10366@gate.crashing.org>
References: <20210511044812.267965-1-aik@ozlabs.ru> <20210511112019.GK10366@gate.crashing.org> <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru> <20210511231635.GR10366@gate.crashing.org> <80ae1561-ed8d-cf3a-f3bb-d89cd07bfc24@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80ae1561-ed8d-cf3a-f3bb-d89cd07bfc24@ozlabs.ru>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 12, 2021 at 01:48:53PM +1000, Alexey Kardashevskiy wrote:
> >Oh!  I completely missed those few lines.  Sorry for that :-(
> 
> Well, I probably should have made it a separate patch anyway, I'll 
> repost separately.

Thanks.

> >To compensate a bit:
> >
> >>It still puzzles me why we need -C
> >>(preserve comments in the preprocessor output) flag here.
> >
> >It is so that a human can look at the output and read it.  Comments are
> >very significant to human readers :-)
> 
> I seriously doubt anyone ever read those :)

I am pretty sure whoever wrote it did!

> I suspect this is to pull 
> all the licenses in one place and do some checking but I did not dig deep.

I don't see the point in that, but :-)


Segher
