Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB07361A1B
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 08:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238714AbhDPGzL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 02:55:11 -0400
Received: from ivanoab7.miniserver.com ([37.128.132.42]:41246 "EHLO
        www.kot-begemot.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhDPGzL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 02:55:11 -0400
X-Greylist: delayed 2568 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Apr 2021 02:55:11 EDT
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6] helo=jain.kot-begemot.co.uk)
        by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1lXHhi-0005kc-N1; Fri, 16 Apr 2021 06:11:48 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
        by jain.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <anton.ivanov@cambridgegreys.com>)
        id 1lXHhf-00024s-Lp; Fri, 16 Apr 2021 07:11:46 +0100
Subject: Re: [PATCH v2] uml: fix W=1 missing-include-dirs warnings
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        linux-um@lists.infradead.org
References: <20210415171352.27398-1-rdunlap@infradead.org>
From:   Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <e3a93e3e-84ba-7274-3476-d63ad4fbcca9@cambridgegreys.com>
Date:   Fri, 16 Apr 2021 07:11:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415171352.27398-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 15/04/2021 18:13, Randy Dunlap wrote:
> Currently when using "W=1" with UML builds, there are over 700 warnings
> like so:
>
>    CC      arch/um/drivers/stderr_console.o
> cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
>
> but arch/um/ does not have include/uapi/ at all, so add that
> subdir and put one Kbuild file into it (since git does not track
> empty subdirs).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: linux-um@lists.infradead.org
> ---
> v2: use Option 4 from v1: add arch/um/include/uapi so that 'make' is
>      placated -- and just like all other arch's have.
>
>   arch/um/include/uapi/asm/Kbuild |    1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/um/include/uapi/asm/Kbuild b/arch/um/include/uapi/asm/Kbuild
> new file mode 100644
> index 000000000000..f66554cd5c45
> --- /dev/null
> +++ b/arch/um/include/uapi/asm/Kbuild
> @@ -0,0 +1 @@
> +# SPDX-License-Identifier: GPL-2.0
>
> _______________________________________________
> linux-um mailing list
> linux-um@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-um
>
+1

I will forward it to openwrt-dev. Their build process adds uapi to uml, 
so if we are going to change this, it will be nice to give them a heads-up.

Acked-By: Anton Ivanov <anton.ivanov@cambridgegreys.com>


-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

