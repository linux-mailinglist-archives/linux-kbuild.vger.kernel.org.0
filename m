Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90A037B26B
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 01:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhEKXYI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 May 2021 19:24:08 -0400
Received: from gate.crashing.org ([63.228.1.57]:37194 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229714AbhEKXYI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 May 2021 19:24:08 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14BNGbGN018678;
        Tue, 11 May 2021 18:16:37 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 14BNGZlW018677;
        Tue, 11 May 2021 18:16:35 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 11 May 2021 18:16:35 -0500
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
Message-ID: <20210511231635.GR10366@gate.crashing.org>
References: <20210511044812.267965-1-aik@ozlabs.ru> <20210511112019.GK10366@gate.crashing.org> <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 11, 2021 at 11:30:17PM +1000, Alexey Kardashevskiy wrote:
> >In any case, please mention the reasoning (and the fact that you are
> >removing these flags!) in the commit message.  Thanks!
> 
> but i did mention this, the last paragraph... they are duplicated.

Oh!  I completely missed those few lines.  Sorry for that :-(

To compensate a bit:

> It still puzzles me why we need -C
> (preserve comments in the preprocessor output) flag here.

It is so that a human can look at the output and read it.  Comments are
very significant to human readers :-)


Segher
