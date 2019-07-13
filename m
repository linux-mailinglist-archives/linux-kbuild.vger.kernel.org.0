Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0D4678BA
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jul 2019 08:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbfGMGHq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Jul 2019 02:07:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41689 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfGMGHq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jul 2019 02:07:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so8725605wrm.8;
        Fri, 12 Jul 2019 23:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=On5iqD9AlcEVmas2/vt48n4oosNJbbs0cKQZBxzkZxY=;
        b=Tm87kPHCKamfpAY6goULQAkKazqDEpnzeXlHR4JZBeJvv1GVGSAvFipNxGwE6bAEPk
         r58xUmUnOTJR40dsa7Kl/laITKOpLUNFpHZdLjT+fRAQPGTUqKpEcw6PasDyvUd4c0bj
         gY7QG99zvETFN1bxMACuiAGKCVkS9T8d1VpzqH3anIqZ8jErOwXL5DdIldckGfL12u8F
         mkQXQpfAZFQMVVy8WlWfIPLIh6X7fq8x22ZYArtv64rpYTwQJ0jg39p7vjqfTW9x9hx6
         S3rJyzld2Ajj+qg3gL7MI7r3HXxXa4yZbMk9QxZGNG9rJyXePvrv7j5KgwXK80I0iqEE
         OdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=On5iqD9AlcEVmas2/vt48n4oosNJbbs0cKQZBxzkZxY=;
        b=k/xEIDSpKoYuhM41uHT5D0QMl5dl3aibj7GvaGrVHEEuvMZCxX/XbCNLZODNAuINQP
         f/sUkouGVRXf6n7+l9vMno2GJqAlqGD5oLVT/KEYwtXfuZuEsX+oMKYlQDEph7L8Teff
         VUI5xS0M0boO7H+RX063seheBTTJjkwkVo5LZ0n3FS240IoEo/LLAxXJKolQufKj+/0W
         syuzXENMFE19HQDjUufInvf4Bc/1jFeu0/NWcJzsjUx/777B7djBkRlgh5MecGUkW1wm
         /IExTZBLFuO3YGXwIU+YqSAA9fe9MNrhcAx0lF8a9cswShTiiomgOuYF9P2dXVTQSTF2
         U+iA==
X-Gm-Message-State: APjAAAXCXpJ5GWDI/aAxkC5DxWUDCyGPU63xUbsyJocIo8UGboaWkX9d
        jJnEjc3C0BlYe50g3n4UR5A=
X-Google-Smtp-Source: APXvYqwBRfMNXfHHzwLXmUW/368+gtKOyu7+kMHfTjBTiTaMHZ0RtPhgK75JRaQuQc6UvyRDl8Cy+A==
X-Received: by 2002:a5d:4e08:: with SMTP id p8mr3281323wrt.20.1562998064324;
        Fri, 12 Jul 2019 23:07:44 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id g131sm6963201wmf.37.2019.07.12.23.07.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 23:07:43 -0700 (PDT)
Date:   Fri, 12 Jul 2019 23:07:41 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH] kbuild: add --hash-style= and --build-id unconditionally
Message-ID: <20190713060741.GA76046@archlinux-threadripper>
References: <20190713040110.18210-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190713040110.18210-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 13, 2019 at 01:01:10PM +0900, Masahiro Yamada wrote:
> As commit 1e0221374e30 ("mips: vdso: drop unnecessary cc-ldoption")
> explained, these flags are supported by the minimal required version
> of binutils.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Also supported by ld.lld; I tested both arm and x86, the build ID shows
up fine.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
