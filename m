Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60B2542AD6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 21:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233161AbhJLTrC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 15:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLTrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 15:47:02 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C266C061570;
        Tue, 12 Oct 2021 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=GmU52LcW7Taz8iLhrlrmKLg+fN7VX8YQj3FglOsUxIY=; b=AGUZK/dPN8t3DXvNoq81McZnaY
        UrsyS5/mPfHu0D/VTsca2GryE+M692JCl8iV6GLJeF/mwa1QzyvzqtPqUf3UDQjWzaFTkljt3TmrT
        qay2VRaewVq5O6R9O+P6MVPLcF62jMITDxSSgVDiwNW0ENppKVRaS+tBDRu5Ko6TQT8j6Sg/SV6sT
        hnsGKcxzcmH2a+7W72VQh5QGufTAr9EGeom2cKIoOiovhVj55lNIqVzD91toVznbsEDO1OcAjRdQA
        iHBlWqe71WFSM/g3ya+7huTI/iJyLdTiTPh8P2McGGGH0+Xi7GgLtNIj3Z8lszg2MKWiGFCYHC/LS
        gQhlEEyQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1maNhr-00DscO-RL; Tue, 12 Oct 2021 19:44:59 +0000
Subject: Re: [RFC PATCH] kbuild: only prompt for compressors that are actually
 usable
To:     Vegard Nossum <vegard.nossum@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211012170121.31549-1-vegard.nossum@oracle.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <adfb38d7-8ce5-3266-df5a-e38e3597d994@infradead.org>
Date:   Tue, 12 Oct 2021 12:44:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012170121.31549-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/12/21 10:01 AM, Vegard Nossum wrote:
> If a given compression algorithm for the kernel image is not usable on
> the host system, there is no point prompting for it.
> 
> We can use the kconfig preprocessing feature to check if the command is
> available or not. I've chosen to test this using "which", which exits
> with success if the given command exists in PATH (or it is an absolute
> path), which mimics exactly how it would be found in the kernel's
> Makefiles.

Hi Vegard,

I have made a few patches that used "which", but I was always told
that the POSIX spelling of that command is "command -v", so that is
preferable.

> This uses the make variables that are set in Makefile and/or the
> command line, so you can do e.g.
> 
>    make KGZIP=pigz menuconfig
> 
> and it will test for the correct program.
> 
> I am intentionally adding these dependencies to e.g. KERNEL_LZ4, as
> opposed to HAVE_KERNEL_LZ4, since the latter are "select"-ed
> unconditionally by the architectures that use them, so they are not
> suitable for depending on anything else.
> 
> I've put RFC in the subject as maybe there are downsides to this that
> I'm not aware of.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>   init/Kconfig | 7 +++++++
>   1 file changed, 7 insertions(+)


-- 
~Randy
