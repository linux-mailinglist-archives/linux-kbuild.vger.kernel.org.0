Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCA12DD231
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 14:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgLQNdk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Dec 2020 08:33:40 -0500
Received: from mail.skyhub.de ([5.9.137.197]:55188 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725871AbgLQNdk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Dec 2020 08:33:40 -0500
Received: from zn.tnic (p200300ec2f10f600957b9387e8d7e202.dip0.t-ipconnect.de [IPv6:2003:ec:2f10:f600:957b:9387:e8d7:e202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 20F981EC03D5;
        Thu, 17 Dec 2020 14:32:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1608211979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=+TLzASq70VBpo0GbRM8NPPPn3+YDrcOCKE5gMb0uyJM=;
        b=Vb1IgjAxKzi8sbilr6CiVAWZADHo/tCtzE4rBErHeeeIbe1M7VuMQkOvClKbAW/olnlZGf
        i1jA2GXls+6z0l8YjOfacHoXsHLT7grO+dcJ/JtFvhUlVZ27rt1wsYL4Fci6yA8iTGdNkB
        3eypG9PhA4OP8s7slXojpiB7I7PpGXU=
Date:   Thu, 17 Dec 2020 14:32:53 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Makefile: Add {kvm_guest,xen}.config targets to make
 help's output
Message-ID: <20201217133253.GB23634@zn.tnic>
References: <20201217121725.16842-1-bp@alien8.de>
 <CAK7LNARgCu+FJCPtcNBQJxHJiLwYbTXi2WYCvptPrspTAK7x_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNARgCu+FJCPtcNBQJxHJiLwYbTXi2WYCvptPrspTAK7x_w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 17, 2020 at 09:47:07PM +0900, Masahiro Yamada wrote:
> I do not want to touch scripts/kconfig/Makefile
> every time somebody adds a new file to
> kernel/configs/*.config or arch/$(ARCH)/configs/*.config

Because that happens so often and somehow burdens your maintenance
effort impossibly?! Geez, gimme a break.

Lemme move those to archhelp so that you don't get bothered.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
