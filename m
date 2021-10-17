Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2481A430B84
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Oct 2021 20:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238333AbhJQSeu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Oct 2021 14:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233541AbhJQSeu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 14:34:50 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60833C06161C;
        Sun, 17 Oct 2021 11:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=BXeRFbHZjMx2hu3VGZIooeLW3/JuBfo/4XQ+WnTASNU=; b=uyPn61Oo6Sqb/xUC2vofU+3Ds/
        KsMpqIUSZ+hjuzZ/m0CCmCbB7x2WL37MRlQB3X27Qe7cUWISKoz5+ij6pEho9xz0+Rntfcp9N4yXC
        fvHcaBbGFqNxYvGRWLhRysSOGBS/VlveBKbXiB2LzID12FWAtIbM+kGfUV3pGJmwiwGdqcTFcM3aY
        XJ5+8AiSeeJCoFraPj4dNlTVeSJkPaTlhZBtDtu9UWsmQL1EM+qWJ+ic/4f8XXi3uk7Hubxg3dIA0
        nzikuQZfrkxIahjubgFZxxJqVopEkOFDTIo5MPddxbknh9NuF7eLauRhQBelrXMs7EaxlX6wcGE6m
        9IY9mRmQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mcAxa-00D99f-I5; Sun, 17 Oct 2021 18:32:38 +0000
Subject: Re: build reproducibility
To:     Julia Lawall <julia.lawall@inria.fr>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
References: <alpine.DEB.2.22.394.2110172002450.4761@hadrien>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7e5485df-a17b-304b-627d-9a85d2464df3@infradead.org>
Date:   Sun, 17 Oct 2021 11:32:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2110172002450.4761@hadrien>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/17/21 11:12 AM, Julia Lawall wrote:
> Hello,
> 
> If I do the following:
> 
> git clean -dfx
> cp saved_config .config
> make olddefconfig && make && make modules_install && make install
> 
> Should I always end up with the same kernel, regardless of the kernel that
> is currently running on the machine?
> 
> I see a large performance difference between Linux 5.10 and all versions
> afterwards for a particular benchmark.  I am unable to bisect the problem
> eg between 5.10 and 5.11, because as soon as I come to a kernel that gives
> the bad performance, all of the kernels that I generate subsequently in
> the bisecting process (using the above commands) also have the bad
> performance.
> 
> It could of course be that I have completely misinterpreted the problem,
> and it has nothing to do with the kernel.  But I have tested the program a
> lot when only working on variants of Linux 5.9.  I only start to have
> problems when I use versions >= 5.11.

Hi,

My "guess" is that this has something to do with the build
reusing some current file(s) that need to be rebuilt.
I.e., adding a "make clean" or "make proper" might be needed.

I say this only because sometimes I cannot even reproduce
a build that has errors or warnings unless I prefix it with
make clean or mrproper. (i.e., nothing to do with booting
and running the new kernel)
Even though the .config file has changed and I do
"make olddefconfig", the same build errors do not show up
unless I do the clean or mrproper step also.


-- 
~Randy
