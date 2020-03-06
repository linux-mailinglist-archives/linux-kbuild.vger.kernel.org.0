Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031F317B2EA
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2020 01:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbgCFA2A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Mar 2020 19:28:00 -0500
Received: from ozlabs.org ([203.11.71.1]:54803 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727186AbgCFA1y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Mar 2020 19:27:54 -0500
Received: by ozlabs.org (Postfix, from userid 1034)
        id 48YT3Y2QBsz9sSs; Fri,  6 Mar 2020 11:27:52 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d42c6d0f8d004c3661dde3c376ed637e9f292c22
In-Reply-To: <20200219000434.15872-1-mpe@ellerman.id.au>
To:     Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     masahiroy@kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
Message-Id: <48YT3Y2QBsz9sSs@ozlabs.org>
Date:   Fri,  6 Mar 2020 11:27:52 +1100 (AEDT)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 2020-02-19 at 00:04:34 UTC, Michael Ellerman wrote:
> Some of our phony targets are not marked as such. This can lead to
> confusing errors, eg:
> 
>   $ make clean
>   $ touch install
>   $ make install
>   make: 'install' is up to date.
>   $
> 
> Fix it by adding them to the PHONY variable which is marked phony in
> the top-level Makefile, or in scripts/Makefile.build for the boot
> Makefile.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to powerpc next.

https://git.kernel.org/powerpc/c/d42c6d0f8d004c3661dde3c376ed637e9f292c22

cheers
