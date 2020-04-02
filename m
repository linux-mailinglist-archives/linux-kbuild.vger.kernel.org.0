Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B83C619C69C
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 17:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389381AbgDBP6Q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 11:58:16 -0400
Received: from mail.skyhub.de ([5.9.137.197]:42518 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389318AbgDBP6P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 11:58:15 -0400
Received: from zn.tnic (p200300EC2F0A0E00E5DA45869CAED91E.dip0.t-ipconnect.de [IPv6:2003:ec:2f0a:e00:e5da:4586:9cae:d91e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 525451EC0469;
        Thu,  2 Apr 2020 17:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1585843094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KN71Axi3R2DOnnEsCnv9ks/tbfgC0G4SVUAhgahUx30=;
        b=otzYCRNxzjG3bT5gHzs421cwgrbkrbyBFIs+WVi8Zd5uA9EZuHNh9AT7nyW/NqiI7y2akZ
        VAfqjkZdx1gBj/wVPL4UKMkbmiBf5Y2u+HOrx9bwHAxiwiJACS0cXKW0/oiHb+c3dROiBK
        3aWKW7D3xW+VVbzVKAdAkj2UTZy/wSc=
Date:   Thu, 2 Apr 2020 17:58:10 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Nick Terrell <terrelln@fb.com>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Message-ID: <20200402155810.GD9352@zn.tnic>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
 <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 01, 2020 at 05:33:03PM +0000, Nick Terrell wrote:
> The code is currently written so that all the compression algorithms use the
> same ZO_z_extra_bytes. It is taken to be the maximum of the growth rate
> plus the maximum fixed overhead. Just a few lines above is the comment:
> 
> # … Hence safety
> # margin should be updated to cover all decompressors so that we don't
> # need to deal with each of them separately. Please check
> # the description in lib/decompressor_xxx.c for specific information.
> 
> So I was been following the guidance in the comments.

Please state that in the commit message when you send your next
revision.

> Does it matter? I’m not an expert here,

Huh, you're only sending the code then? Or what do you mean with not
being an expert?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
