Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C968619D4E7
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 12:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgDCKTe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 06:19:34 -0400
Received: from mail.skyhub.de ([5.9.137.197]:53496 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbgDCKTd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 06:19:33 -0400
Received: from zn.tnic (p200300EC2F0D8900185F9BE223BA1C94.dip0.t-ipconnect.de [IPv6:2003:ec:2f0d:8900:185f:9be2:23ba:1c94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5AE661EC0C84;
        Fri,  3 Apr 2020 12:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1585909172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4gTxr2tMtcHZvA+vMMjjeuIyzVHlsntBq8xEiI0nftM=;
        b=ebAvHLEmjItjXy3diROes48QoOr+3V7Mabl957HF8ZUmg01Zs+dudqR+068+JvUD5k6JfG
        mAMsGMxxsOyOnlEUMSoOI3VUWUJh9XwaHmNnfmGRpzLIltI0GM5Iz+85gp9RHAFFd2Bhai
        /pKE+LLfkN8Fla9geFNQbWuL9S8uYj8=
Date:   Fri, 3 Apr 2020 12:19:29 +0200
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
Message-ID: <20200403101929.GC20218@zn.tnic>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
 <20200401053913.216783-7-nickrterrell@gmail.com>
 <20200401093310.GA13748@zn.tnic>
 <D45F637D-6BB0-4F08-BEBE-FAB9B56F36F6@fb.com>
 <20200402155810.GD9352@zn.tnic>
 <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2370741E-FE5A-44C1-8BF3-24A03E321F4E@fb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 02, 2020 at 08:25:49PM +0000, Nick Terrell wrote:
> So it is possible that there is a use case for kernel compression that
> I’m not aware of where RAM is extremely tight and within 64 KB of
> the current limits.

That's exactly my concern, albeit a very minor one.

> It seems to me that adding 64KB to the memory requirement for kernel
> decompression is not going to break anyone. If it did the kernel image
> is taking up nearly all available RAM, which doesn’t seem likely.
> But, I don’t know all use cases. If it does break someone, we can
> put up a separate patch that switches all the compression methods over
> a per-method ZO_z_extra_bytes.

Ok.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
