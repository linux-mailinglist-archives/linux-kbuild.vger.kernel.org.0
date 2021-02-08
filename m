Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAEC8313D44
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Feb 2021 19:24:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbhBHSWP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 13:22:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:53538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235510AbhBHSVU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 13:21:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3119E64E9C;
        Mon,  8 Feb 2021 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612808402;
        bh=1Wc66cvijA0/2hnpeQiER8GT9ouRZWKOdv5pXKjT79k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=otblmeVYA7gMbyrdYky5aQLtl1Grz6AkBn5AgvpptyqNt8/IXRLL66NFsT3cR8LJR
         1hP5p5GAPKd8xXj+Td/QLBBgZGI1uCW3xJc4qvx5GWXR43XsjXTILD58mskieWukP2
         LmzQbT/a3ge8YyQF+XTxCAaka7yfYj3vCVY1aAx5dUIOHIpcIuyvATAS1H8gl8X7Oc
         oVmD9qmpvAU2kkT8Q5g/pzgIJP2KwAiWLdqSH29OzXa1YBiVEFlbeiv5TEz52NRrik
         caCxiPhwqVRGzFAp2t4XPNYsHbCdUTIiTGALNmGKm9hx2CrFENTbltU8kaWUCAHuNr
         IdYimNy2aucow==
Date:   Mon, 8 Feb 2021 13:20:01 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
Message-ID: <20210208182001.GA4035784@sasha-vm>
References: <20210207161352.2044572-1-sashal@kernel.org>
 <20210208175007.GA1501867@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210208175007.GA1501867@infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 08, 2021 at 05:50:07PM +0000, Christoph Hellwig wrote:
>On Sun, Feb 07, 2021 at 11:13:52AM -0500, Sasha Levin wrote:
>> +		(u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
>> +		(u16)(LINUX_VERSION_SUBLEVEL));
>
>No need for the casts and braces.
>
>Otherwise this looks good, but please also kill off KERNEL_VERSION
>and LINUX_KERNEL_VERSION entirely while you're at it.

I don't think there are in-tree users left?

We can't remove it completely because userspace is still using it, so if
we drop those userspace will be sad.

-- 
Thanks,
Sasha
