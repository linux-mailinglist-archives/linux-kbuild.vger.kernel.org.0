Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A374440B6D
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Oct 2021 21:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhJ3TLZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Oct 2021 15:11:25 -0400
Received: from brightrain.aerifal.cx ([216.12.86.13]:42332 "EHLO
        brightrain.aerifal.cx" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhJ3TLZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Oct 2021 15:11:25 -0400
X-Greylist: delayed 915 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Oct 2021 15:11:25 EDT
Date:   Sat, 30 Oct 2021 14:53:39 -0400
From:   Rich Felker <dalias@libc.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, patches@arm.linux.org.uk,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH] sh: decompressor: do not copy source files while building
Message-ID: <20211030185339.GD7074@brightrain.aerifal.cx>
References: <20211030175604.1716611-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211030175604.1716611-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 31, 2021 at 02:56:04AM +0900, Masahiro Yamada wrote:
> As commit 7ae4a78daacf ("ARM: 8969/1: decompressor: simplify libfdt
> builds") stated, copying source files during the build time may not
> end up with as clean code as expected.
> 
> Do similar for sh to clean up the Makefile and .gitignore.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

I think this is the same as "sh: boot: avoid unneeded rebuilds under
arch/sh/boot/compressed/" in commit 7fe859eef9 in linux-next, which
I've had in next but with no pull request sent for embarrassingly
long. It will be included in the PR for the new release cycle.

Sorry about the long delay. Let me know if there's anything else I
need to know about it. And thanks for the patch.

Rich
